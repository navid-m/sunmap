# sunmap

A hackable 3D level editor written in [Spectre](https://github.com/spectrelang/spectre) with SDL2 and OpenGL 2.1.

Sunmap is deliberately closer to a compact TrenchBroom than to a full engine
editor: a 3D viewport, a texture shelf, an inspector, convex brush
editing, and first-class CSG.

## Building

```sh
cd ../sunmap
spectre build dev       # ./sunmap-dev
spectre build release   # ./sunmap
```

Both configurations use the `-alt` (C99) backend and `-dynamic`.

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

## Project layout (`.sm`)

`.sm` is a line/token oriented format intended to stay readable and easy
to diff:

```
sunmap 1
name untitled
camera 256 -320 220 1.15 -0.32
grid 16
wall 16
height 96
texture default -
texture red textures/red.png
brush 1 6
p 1 0 0 416
p -1 0 0 -336
...
end
```

Each `brush` stores the texture index, face count, then one plane per face.
`p nx ny nz d` is the halfspace `n · p <= d`.

## Export details

- `.map` is Valve 220: three clockwise-from-outside points per face, texture
  axes and scale, worldspawn entity.
- `.obj`/`.mtl` use Y-up coordinates, triangulated faces, per-vertex UVs and
  normals, one material per texture.
- `.gltf` references `<project>.bin` and PNG images under `textures/`.
- `.glb` embeds the same buffer and PNG images in the binary chunk.
- Textures are copied to `exports/<project>/textures/` and converted to PNG for
  glTF/GLB so TGA/BMP sources also work in engines.
