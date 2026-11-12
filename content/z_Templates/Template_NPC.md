---
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
<<<<<<< HEAD
=======
created: 2026-11-12T17:37:18.917Z
modified: 2026-09-26T17:18:52.594Z
published: 2026-09-26T17:18:52.594Z
>>>>>>> 9154a718c11fbe82d5488ef60b627dad32fb5686
tags:
  - "#NPCs"
ancestry: '<% tp.system.prompt("Ancestry?") %>'
background: '<% tp.system.prompt("Background?") %>'
class_profession: '<% tp.system.prompt("Class/Profession?") %>'
faction: '<% tp.system.prompt("Faction?") %>'
level: '<% tp.system.prompt("Level?") %>'
location: '<% tp.system.prompt("Location?") %>'
pronouns: '<% tp.system.prompt("Pronouns? (e.g., They/Them)") %>'
role: '<% tp.system.prompt("Role?") %>'
status: '<% tp.system.suggester(\["Alive", "Deceased", "Undead", "Unknown"], \["Alive", "Deceased", "Undead", "Unknown"]) %>'
---

> [!info]+ Details
> **Pronouns:** `=this.pronouns`
> **Ancestry:** `=this.ancestry`
> **Background:** `=this.background`
> **Class/Profession:** `=this.class_profession`
> **Level:** `=this.level`
> **Location:** `=this.location`
> **Faction:** `=this.faction`
> **Role:** `=this.role`
> **Status:** `=this.status`

![[Assets/NPCs/<% tp.file.title %>.webp|400]]

# Appearance

# Personality

# Relationships

# History & Lore

# Stats & Equipment
