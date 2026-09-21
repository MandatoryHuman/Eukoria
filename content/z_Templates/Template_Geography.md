---
publish: true
aliases:
  - <% tp.file.title.toLowerCase() %>
title: <% tp.file.title %>
created: 2026-09-16T15:12:55.292Z
modified: 2026-09-12T09:37:40.190Z
published: 2026-09-12T09:37:40.190Z
tags:
  - Geography
---

\[Type::<% tp.system.prompt("Geography Type? (e.g., Continent, Oceanic Channel)") %>]
\[Region::<% tp.system.prompt("Region?") %>]
\[Size/Length::<% tp.system.prompt("Size/Length?") %>]
\[Climate::<% tp.system.prompt("Climate?") %>]
\[Danger Level::<% tp.system.suggester(\["Low", "Moderate", "Severe", "Extreme", "Varies"], \["Low", "Moderate", "Severe", "Extreme", "Varies"]) %>]
\[Known For::<% tp.system.prompt("Known For?") %>]

![[Assets/Locations/Maps/<% tp.file.title %> Map.webp|400]]

# Overview

# Ecology & Environment

# Hazards & Encounters

# Landmarks & Points of Interest

# Natural Resources

# Myths & Lore
