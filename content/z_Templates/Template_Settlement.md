---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-09-26T16:52:54.408Z
modified: 2026-09-26T17:18:52.596Z
published: 2026-09-26T17:18:52.596Z
tags:
  - "#Settlement"
marker:
demographics: <% tp.system.prompt("Demographics?") %>
level: <% tp.system.prompt("Settlement Level?") %>
population: <% tp.system.prompt("Population?") %>
ruler: <% tp.system.prompt("Ruler?") %>
type: <% tp.system.suggester(\["Capital City", "City", "Town", "Village", "Outpost", "Ruins"], \["Capital City", "City", "Town", "Village", "Outpost", "Ruins"]) %>
---

> [!info]+ Details
> **Type:** <% tp.system.suggester(\["Capital City", "City", "Town", "Village", "Outpost", "Ruins"], \["Capital City", "City", "Town", "Village", "Outpost", "Ruins"]) %>
> **Level:** <% tp.system.prompt("Settlement Level?") %>
> **Population:** <% tp.system.prompt("Population?") %>
> **Demographics:** <% tp.system.prompt("Demographics?") %>
> **Ruler:** <% tp.system.prompt("Ruler?") %>

![[Assets/Locations/Coat of Arms/<% tp.file.title %> Emblem.webp|200]]
![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Geography & Layout

# Government & Law

# Districts

-

# Notable Locations

-

# Key NPCs

-

# Factions & Guilds

-

-

# History & Lore
