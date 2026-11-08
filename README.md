# sunmap

A hackable 3D level editor written in [Spectre](https://github.com/spectrelang/spectre) with SDL2 and OpenGL 2.1.

Sunmap is deliberately closer to a compact TrenchBroom than to a full engine
editor: a 3D viewport, a texture shelf, an inspector, convex brush
editing, and first-class CSG.

## Building

```sh
cd ../sunmap
spectre build release
```

The bundled UI font is `assets/font.ttf` (DejaVu Sans). If it is missing the
editor falls back to common system fonts.

## Controls

| Input                       | Action                                              |
| --------------------------- | --------------------------------------------------- |
| `LMB` drag (empty grid)     | Draw a brush footprint (height is in the inspector) |
| `LMB` drag (brush)          | Move the brush/selection on the horizontal plane    |
| `Shift` + `LMB` drag (face) | Extrude / intrude that face                         |
| `V`                         | Toggle vertex editing                               |
| `1` / `2` / `3`             | Brush / Face / Vertex mode                          |
| Arrows                      | Nudge selection by grid, `Shift` = 8×               |
| `PageUp` / `PageDown`       | Nudge selection up/down by grid                     |
| `Delete` / `Backspace`      | Delete selection                                    |
| `Ctrl+H`                    | Hollow selection (wall thickness in inspector)      |
| `Ctrl+A`                    | Select all                                          |
| `Ctrl+S` / `Ctrl+O`         | Save / load `projects/<name>.sm`                    |
| `Ctrl+E`                    | Export every format                                 |
| `Ctrl+Q`                    | Quit                                                |
| `RMB` drag                  | Look (relative mouse)                               |
| `MMB` drag                  | Pan                                                 |
| `WASD` / `Q` `E`            | Noclip; `Shift` = faster                            |
| Wheel                       | Grid size (or scroll textures over the shelf)       |
| `[` / `]`                   | Grid size down/up                                   |
| `F1`                        | Toggle the controls overlay                         |

The top bar also has Brush/Face/Vertex buttons, Save/Load, and Export. The
inspector exposes grid, wall thickness, brush height, CSG operations, the
active texture, and per-format export buttons.
