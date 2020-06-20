Add CJK support to PT Sans font (`PTSans.ttf`) for [Call To Arms](https://www.curseforge.com/wow/addons/call-to-arms-list).

## Build Instructions

### Get Character List

1. Install “CTA_Dump” addon.
2. Login and logout with these locales: zhCN (简体中文), zhTW (繁體中文), and koKR (한국어).
3. Characters will be found in `WTF/Account/<AccountID>/SavedVariables/CTA_Dump.lua`.

### Build Font

1. Install [fontTools](https://github.com/fonttools/fonttools) ([Python](https://www.python.org/) required).
   ```bash
   pip install fonttools
   ```
2. Subset CJK font with `pyftsubset`.
   ```bash
   pyftsubset WarSans-CN-CondensedBold.ttf --output-file=CJK.ttf --text-file=characters.txt --layout-features=''
   ```
3. Merge fonts with `pyftmerge`.
   ```bash
   pyftmerge PTSans.ttf CJK.ttf
   mv merged.ttf PTSans-CTA.ttf
   ```
4. `PTSans-CTA.ttf` is what we want.
   * It’s smaller than `PTSans.ttf`. Don’t worry, `pyftmerge` just dropped legacy `kern` table (OpenType fonts has GPOS `kern` feature).
