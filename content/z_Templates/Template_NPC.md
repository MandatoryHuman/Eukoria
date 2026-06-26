---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-03-30T12:31:05.568+01:00
modified: 2026-06-26T19:33:23.274+01:00
published: 2026-06-26T19:33:23.274+01:00
tags:
  - NPCs
---

\[Pronouns::<% tp.system.prompt("Pronouns? (e.g., They/Them)") %>]
\[Ancestry::<% tp.system.prompt("Ancestry?") %>]
\[Background::<% tp.system.prompt("Background?") %>]
\[Class/Profession::<% tp.system.prompt("Class/Profession?") %>]
\[Level::<% tp.system.prompt("Level?") %>]
\[Location::<% tp.system.prompt("Location?") %>]
\[Faction::<% tp.system.prompt("Faction?") %>]
\[Role::<% tp.system.prompt("Role?") %>]
\[Status::<% tp.system.suggester(\["Alive", "Deceased", "Undead", "Unknown"], \["Alive", "Deceased", "Undead", "Unknown"]) %>]

![[Assets/NPCs/<% tp.file.title %>.webp|400]]

# Appearance

# Personality

# Relationships

# History & Lore

# Stats & Equipment
