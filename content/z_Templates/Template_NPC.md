---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-09-26T16:52:54.407Z
modified: 2026-09-26T17:18:52.594Z
published: 2026-09-26T17:18:52.594Z
tags:
  - "#NPCs"
ancestry: <% tp.system.prompt("Ancestry?") %>
background: <% tp.system.prompt("Background?") %>
class_profession: <% tp.system.prompt("Class/Profession?") %>
faction: <% tp.system.prompt("Faction?") %>
level: <% tp.system.prompt("Level?") %>
location: <% tp.system.prompt("Location?") %>
pronouns: <% tp.system.prompt("Pronouns? (e.g., They/Them)") %>
role: <% tp.system.prompt("Role?") %>
status: <% tp.system.suggester(\["Alive", "Deceased", "Undead", "Unknown"], \["Alive", "Deceased", "Undead", "Unknown"]) %>
---

> [!info]+ Details
> **Pronouns:** <% tp.system.prompt("Pronouns? (e.g., They/Them)") %>
> **Ancestry:** <% tp.system.prompt("Ancestry?") %>
> **Background:** <% tp.system.prompt("Background?") %>
> **Class/Profession:** <% tp.system.prompt("Class/Profession?") %>
> **Level:** <% tp.system.prompt("Level?") %>
> **Location:** <% tp.system.prompt("Location?") %>
> **Faction:** <% tp.system.prompt("Faction?") %>
> **Role:** <% tp.system.prompt("Role?") %>
> **Status:** <% tp.system.suggester(\["Alive", "Deceased", "Undead", "Unknown"], \["Alive", "Deceased", "Undead", "Unknown"]) %>

![[Assets/NPCs/<% tp.file.title %>.webp|400]]

# Appearance

# Personality

# Relationships

# History & Lore

# Stats & Equipment
