#!/bin/bash

OK_HLASKY=(
  "Operace proběhla úspěšně."
  "Vše je v pořádku."
  "Skript běží bez problémů."
  "Data byla úspěšně zpracována."
)

ERR_HLASKY=(
  "Došlo k chybě při zpracování."
  "Soubor nebyl nalezen."
  "Přístup byl odepřen."
  "Nastala neočekávaná chyba."
)

while true; do
  # 0 = stdout, 1 = stderr
  VYSTUP=$((RANDOM % 2))

  if [ "$VYSTUP" -eq 0 ]; then
    INDEX=$((RANDOM % ${#OK_HLASKY[@]}))
    echo "${OK_HLASKY[$INDEX]}"
  else
    INDEX=$((RANDOM % ${#ERR_HLASKY[@]}))
    echo "${ERR_HLASKY[$INDEX]}" >&2
  fi

  sleep 10
done
