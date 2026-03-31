---
title: The World of Eukoria
aliases: 
- Homepage
---

> [!quote] "Magic is not a force to be tamed but an equation written in the language of the four Essences. Follow the wheel and the universe will provide."

Welcome to **Eukoria**, a realm defined by strict cosmological duality, complex divine hierarchies, and the pervasive, often volatile nature of magic. It is a world where faith, law, and arcane traditions are deeply intertwined, and where historical schisms continue to shape the lives of its inhabitants.

# The War of Laws
Exactly 116 years ago, the heavens were torn apart by a cataclysmic celestial rebellion known as the War of Laws. What began as a theological dispute over the rigid geometry of the divine hierarchy quickly devolved into a war of attrition that spilled directly onto mortal soil.

The world was an epicentre of divine collateral damage. It was here that the Canonical gods and the rebel forces of [[Lethos, God of Trickery]] clashed most violently, boiling the oceans and permanently tearing the physical fabric of [[Fundamental Essences|Matter]].

When the dust settled, the world was forever changed. While the heavens are now at an uneasy peace, the mortal world must navigate dead-magic zones, warped landscapes, and volatile regions where the fundamental essences of reality still bleed into one another. Yet, from this apocalypse, mortals found opportunity. Various nations have risen from the ashes, each hoping to lead the inhabitants of [[1. World Almanac/World/Locations/Eukoria/index|Eukoria]] into a prosperous future.

# Directory

## Core Lore & Mechanics
- [[Fundamental Essences]] - The building blocks of reality (Life, Spirit, Mind, Matter).
- [[Basic Essences]] - The absolute anchors of the void (Presence and Absence).
- [[Traditions of Magic]] - The sanctioned, harmonious spellcasting traditions.
- [[Traditions of Dismagic]] - The forbidden, volatile magic born of cosmic friction.

### [[1. World Almanac/World/Gods & Divines/Greater Gods/index|Greater Gods]]
```dataview
TABLE WITHOUT ID
file.link AS "Name",
areas-of-concern AS "Areas of Concern", Category, Aspects, Domains
FROM #Gods 
WHERE file.folder != "z_Templates"
WHERE contains(Category, [[Greater Gods]])
SORT file.name ASC
```

## Geography & Nations

### The Continents
- [[Antoria]] (West)
- [[Cenora]] (East)

### Nations

```dataview
TABLE WITHOUT ID
title AS "Name", Capital, Government, Ruler, Religions
FROM #State
WHERE file.folder != "z_Templates"
SORT file.name ASC
```

### Notable Locations:
- [[God-Scar Strait]]: The treacherous, highly-trafficked choke-point between the continents.

### 🧑‍🤝‍🧑 Characters & Factions
