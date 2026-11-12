---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
<<<<<<< HEAD
=======
created: 2026-11-12T17:37:18.916Z
modified: 2026-09-26T17:18:52.592Z
published: 2026-09-26T17:18:52.592Z
>>>>>>> 9154a718c11fbe82d5488ef60b627dad32fb5686
tags:
  - Geography
climate: '<% tp.system.prompt("Climate?") %>'
danger_level: '<% tp.system.suggester(\["Low", "Moderate", "Severe", "Extreme", "Varies"], \["Low", "Moderate", "Severe", "Extreme", "Varies"]) %>'
known_for: '<% tp.system.prompt("Known For?") %>'
region: '<% tp.system.prompt("Region?") %>'
size_length: '<% tp.system.prompt("Size/Length?") %>'
type: '<% tp.system.prompt("Geography Type? (e.g., Continent, Oceanic Channel)") %>'
---

> [!info]+ Details
> **Type:** `=this.type`
> **Region:** `=this.region`
> **Size/Length:** `=this.size_length`
> **Climate:** `=this.climate`
> **Danger Level:** `=this.danger_level`
> **Known For:** `=this.known_for`

![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Ecology & Environment

# Hazards & Encounters

# Landmarks & Points of Interest

# Natural Resources

# Myths & Lore
