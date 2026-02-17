#!/bin/bash

# Pole hlášek pro standardní výstup
OK_HLASKY=(
  "Operace proběhla úspěšně."
  "Vše je v pořádku."
  "Skript byl dokončen bez chyb."
  "Data byla správně zpracována."
)

# Pole hlášek pro chybový výstup
ERR_HLASKY=(
  "Došlo k chybě při zpracování."
  "Soubor nebyl nalezen."
  "Přístup byl odepřen."
  "Nastala neočekávaná chyba."
)

# Náhodné rozhodnutí: 0 = stdout, 1 = stderr
VYSTUP=$((RANDOM % 2))

if [ "$VYSTUP" -eq 0 ]; then
  # Náhodná hláška na stdout
  INDEX=$((RANDOM % ${#OK_HLASKY[@]}))
  echo "${OK_HLASKY[$INDEX]}"
else
  # Náhodná hláška na stderr
  INDEX=$((RANDOM % ${#ERR_HLASKY[@]}))
  echo "${ERR_HLASKY[$INDEX]}" >&2
fi
