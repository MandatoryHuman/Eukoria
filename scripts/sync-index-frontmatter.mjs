import fs from "node:fs"
import path from "node:path"
import matter from "gray-matter"
import { globby } from "globby"

const files = (await globby("content/**/index.md")).sort()
const changedFiles = []

for (const file of files) {
  const raw = fs.readFileSync(file, "utf8")
  const parsed = matter(raw)
  const data = parsed.data ?? {}
  const folderName = path.basename(path.dirname(file))

  let changed = false

  if (!Object.prototype.hasOwnProperty.call(data, "title") || String(data.title ?? "").trim() === "") {
    data.title = folderName
    changed = true
  }

  const aliases = data.aliases
  if (aliases == null) {
    data.aliases = [folderName]
    changed = true
  } else if (Array.isArray(aliases)) {
    const hasAlias = aliases.some((a) => String(a).trim() === folderName)
    if (!hasAlias) {
      data.aliases = [...aliases, folderName]
      changed = true
    }
  } else if (typeof aliases === "string") {
    if (aliases.trim() !== folderName) {
      data.aliases = [aliases, folderName]
      changed = true
    }
  } else {
    data.aliases = [folderName]
    changed = true
  }

  if (changed) {
    const updated = matter.stringify(parsed.content, data)
    fs.writeFileSync(file, updated, "utf8")
    changedFiles.push(file)
  }
}

console.log(`Scanned: ${files.length} index.md files`)
console.log(`Updated: ${changedFiles.length}`)
for (const file of changedFiles) {
  console.log(file)
}
