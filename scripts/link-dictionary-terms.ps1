param(
  [string]$ContentRoot = 'content',
  [string]$DictionaryDir = 'content/Dictionary',
  [switch]$WhatIf
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-DictionaryEntries {
  param([string]$Dir)

  $entries = @()
  $files = Get-ChildItem -Path $Dir -Filter *.md -File | Sort-Object Name

  foreach ($file in $files) {
    $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $aliases = New-Object System.Collections.Generic.List[string]
    $lines = Get-Content -Path $file.FullName

    $inFrontmatter = $false
    $frontmatterSeen = $false
    $inAliases = $false

    foreach ($line in $lines) {
      $trim = $line.Trim()

      if (-not $frontmatterSeen -and $trim -eq '---') {
        $inFrontmatter = $true
        $frontmatterSeen = $true
        continue
      }

      if ($inFrontmatter -and $trim -eq '---') {
        break
      }

      if (-not $inFrontmatter) {
        continue
      }

      if ($trim -match '^aliases\s*:\s*$') {
        $inAliases = $true
        continue
      }

      if ($inAliases -and $trim -match '^-\s+(.+)$') {
        $alias = $Matches[1].Trim()
        if ($alias.Length -gt 0) {
          [void]$aliases.Add($alias)
        }
        continue
      }

      if ($inAliases -and $trim.Length -gt 0 -and $trim -notmatch '^-\s+') {
        $inAliases = $false
      }
    }

    $terms = New-Object System.Collections.Generic.List[string]
    [void]$terms.Add($title)
    foreach ($aliasValue in $aliases) {
      if (-not ($terms -contains $aliasValue)) {
        [void]$terms.Add($aliasValue)
      }
    }

    $entries += [pscustomobject]@{
      Title   = $title
      Aliases = @($aliases)
      Terms   = @($terms)
    }
  }

  return $entries
}

function Get-CanonicalDisplay {
  param(
    [string]$Matched,
    [pscustomobject]$Entry
  )

  if ($Matched -ceq $Entry.Title) {
    return $Entry.Title
  }

  foreach ($aliasValue in $Entry.Aliases) {
    if ($Matched -ceq $aliasValue) {
      return $aliasValue
    }
  }

  if ($Matched -ieq $Entry.Title) {
    return $Entry.Title
  }

  foreach ($aliasValue in $Entry.Aliases) {
    if ($Matched -ieq $aliasValue) {
      return $aliasValue
    }
  }

  return $Matched
}

function New-WikiLink {
  param(
    [pscustomobject]$Entry,
    [string]$Matched
  )

  $display = Get-CanonicalDisplay -Matched $Matched -Entry $Entry
  if ($display -ceq $Entry.Title) {
    return "[[$($Entry.Title)]]"
  }

  return "[[$($Entry.Title)|$display]]"
}

function Set-LineDictionaryLinks {
  param(
    [string]$Line,
    [pscustomobject[]]$Entries,
    [string]$SelfNameLower
  )

  $protectedPattern = '(\[\[[^\]]+\]\]|https?://[^\s)\]>]+)'
  $parts = [regex]::Split($Line, $protectedPattern)

  for ($partIndex = 0; $partIndex -lt $parts.Count; $partIndex += 2) {
    $segment = $parts[$partIndex]

    foreach ($entry in $Entries) {
      if ($entry.Title.ToLowerInvariant() -eq $SelfNameLower) {
        continue
      }

      foreach ($term in $entry.Terms) {
        if ([string]::IsNullOrWhiteSpace($term)) {
          continue
        }

        $escaped = [regex]::Escape($term)
        $pattern = "(?<![A-Za-z0-9_])$escaped(?![A-Za-z0-9_])"

        $segment = [regex]::Replace(
          $segment,
          $pattern,
          {
            param($match)
            return New-WikiLink -Entry $entry -Matched $match.Value
          },
          [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
        )
      }
    }

    $parts[$partIndex] = $segment
  }

  return ($parts -join '')
}

if (-not (Test-Path -Path $ContentRoot)) {
  throw "Content root '$ContentRoot' does not exist."
}

if (-not (Test-Path -Path $DictionaryDir)) {
  throw "Dictionary directory '$DictionaryDir' does not exist."
}

$entries = Get-DictionaryEntries -Dir $DictionaryDir
$entries = $entries | ForEach-Object {
  $_.Terms = @($_.Terms | Sort-Object { $_.Length } -Descending)
  $_
}

$files = Get-ChildItem -Path $ContentRoot -Recurse -Filter *.md -File |
  Where-Object { $_.FullName -notlike '*\content\Dictionary\*' }

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$changedCount = 0
$lineSplitPattern = '\r?\n'
$newline = [Environment]::NewLine

foreach ($file in $files) {
  $original = [System.IO.File]::ReadAllText($file.FullName)
  $lines = [regex]::Split($original, $lineSplitPattern)
  $selfNameLower = [System.IO.Path]::GetFileNameWithoutExtension($file.Name).ToLowerInvariant()

  $inFrontmatter = $false
  $inCodeFence = $false

  if ($lines.Count -gt 0 -and $lines[0].Trim() -eq '---') {
    $inFrontmatter = $true
  }

  for ($lineIndex = 0; $lineIndex -lt $lines.Count; $lineIndex++) {
    $line = $lines[$lineIndex]
    $trim = $line.Trim()

    if ($inFrontmatter) {
      if ($lineIndex -gt 0 -and $trim -eq '---') {
        $inFrontmatter = $false
      }
      continue
    }

    if ($trim -match '^```') {
      $inCodeFence = -not $inCodeFence
      continue
    }

    if ($inCodeFence) {
      continue
    }

    $lines[$lineIndex] = Set-LineDictionaryLinks -Line $line -Entries $entries -SelfNameLower $selfNameLower
  }

  $updated = [string]::Join($newline, $lines)
  if ($updated -ne $original) {
    $changedCount++
    if (-not $WhatIf) {
      [System.IO.File]::WriteAllText($file.FullName, $updated, $utf8NoBom)
    }
  }
}

if ($WhatIf) {
  Write-Output "[WhatIf] Would update $changedCount file(s)."
}
else {
  Write-Output "Updated $changedCount file(s)."
}
