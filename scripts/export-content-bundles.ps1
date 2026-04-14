param(
  [string]$ContentRoot = "content",
  [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Resolve-FullPath {
  param([string]$Path)

  $resolved = Resolve-Path -LiteralPath $Path -ErrorAction Stop
  return [System.IO.Path]::GetFullPath($resolved.Path)
}

function Get-MarkdownFilesRecursive {
  param([string]$Root)

  if (-not (Test-Path -LiteralPath $Root)) {
    throw "Path not found: $Root"
  }

  return Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md |
    Sort-Object FullName
}

function Remove-ParenthesizedHttpsLinks {
  param([string]$Text)

  if ([string]::IsNullOrEmpty($Text)) {
    return $Text
  }

  return [regex]::Replace($Text, '\(https?://[^)]*\)', '')
}

function Remove-CreatedModifiedLines {
  param([string]$Text)

  if ([string]::IsNullOrEmpty($Text)) {
    return $Text
  }

  return [regex]::Replace($Text, '(?im)^[ \t]*(created|modified):.*(?:\r?\n)?', '')
}

function Write-BundleFile {
  param(
    [string]$OutputPath,
    [System.IO.FileInfo[]]$Files,
    [string]$ContentRootFull
  )

  $sections = New-Object System.Collections.Generic.List[string]
  $contentRootPrefix = $ContentRootFull
  if (-not $contentRootPrefix.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
    $contentRootPrefix = "$contentRootPrefix$([System.IO.Path]::DirectorySeparatorChar)"
  }

  foreach ($file in $Files) {
    $raw = [System.IO.File]::ReadAllText($file.FullName)
    $clean = Remove-ParenthesizedHttpsLinks -Text $raw
    $clean = Remove-CreatedModifiedLines -Text $clean

    $relativePath = $file.FullName
    if ($relativePath.StartsWith($contentRootPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
      $relativePath = $relativePath.Substring($contentRootPrefix.Length)
    }
    $header = "=== $relativePath ==="
    [void]$sections.Add("$header`r`n$clean")
  }

  $content = [string]::Join("`r`n`r`n", $sections)

  if ($WhatIf) {
    Write-Output "[WhatIf] Would write $($Files.Count) file(s) to '$OutputPath'."
    return
  }

  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
  Write-Output "Wrote $($Files.Count) file(s) to '$OutputPath'."
}

if (-not (Test-Path -LiteralPath $ContentRoot)) {
  throw "Content root '$ContentRoot' does not exist."
}

$desktopPath = [Environment]::GetFolderPath("Desktop")
if ([string]::IsNullOrWhiteSpace($desktopPath)) {
  throw "Could not determine Desktop path."
}

$contentRootFull = Resolve-FullPath -Path $ContentRoot

$bundleMap = @{
  "Gods.txt"       = Join-Path $ContentRoot "1. World Almanac\World\Gods & Divines"
  "Locations.txt"  = Join-Path $ContentRoot "1. World Almanac\World\Locations"
  "NPCs.txt"       = Join-Path $ContentRoot "1. World Almanac\World\NPCs"
  "Mechanics.txt"  = Join-Path $ContentRoot "2. Mechanics"
  "templates.txt"  = Join-Path $ContentRoot "z_Templates"
  "dictionary.txt" = Join-Path $ContentRoot "Dictionary"
}

$bundleRoots = New-Object System.Collections.Generic.List[string]

foreach ($entry in $bundleMap.GetEnumerator() | Sort-Object Name) {
  $targetName = $entry.Key
  $sourceRoot = $entry.Value
  $sourceRootFull = Resolve-FullPath -Path $sourceRoot
  [void]$bundleRoots.Add($sourceRootFull)

  $files = @(Get-MarkdownFilesRecursive -Root $sourceRootFull)
  $outputPath = Join-Path $desktopPath $targetName
  Write-BundleFile -OutputPath $outputPath -Files $files -ContentRootFull $contentRootFull
}

$allContentFiles = @(Get-MarkdownFilesRecursive -Root $contentRootFull)
$normalizedRoots = @(
  $bundleRoots | ForEach-Object {
    if ($_.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
      $_
    }
    else {
      "$_$([System.IO.Path]::DirectorySeparatorChar)"
    }
  }
)

$otherFiles = @(
  $allContentFiles | Where-Object {
    $filePath = $_.FullName
    $isCaptured = $false

    foreach ($root in $normalizedRoots) {
      if ($filePath.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
        $isCaptured = $true
        break
      }
    }

    return -not $isCaptured
  }
)

$otherOutputPath = Join-Path $desktopPath "other.txt"
Write-BundleFile -OutputPath $otherOutputPath -Files $otherFiles -ContentRootFull $contentRootFull

if ($WhatIf) {
  Write-Output "[WhatIf] Completed bundle export preview."
}
else {
  Write-Output "Completed bundle export."
}