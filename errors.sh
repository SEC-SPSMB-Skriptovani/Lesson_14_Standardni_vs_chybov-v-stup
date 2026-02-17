#!/bin/bash

OK_HLASKY=(
  "Operace proběhla úspěšně."
  "Vše je v pořádku."
  "Skript byl dokončen bez chyb."
  "Data byla úspěšně zpracována."
  "Kontrola proběhla bez nalezení problémů."
  "Systém odpověděl očekávaným způsobem."
  "Požadovaná akce byla provedena."
  "Proces byl úspěšně ukončen."
  "Soubor byl správně vytvořen."
  "Soubor byl úspěšně aktualizován."
  "Připojení k systému proběhlo úspěšně."
  "Služba byla spuštěna."
  "Služba běží správně."
  "Operace byla potvrzena."
  "Vstupní data jsou platná."
  "Výstup byl vygenerován."
  "Kontrola oprávnění proběhla úspěšně."
  "Konfigurace je platná."
  "Nebyla zjištěna žádná chyba."
  "Úloha byla úspěšně dokončena."
  "Skript stále běží bez potíží."
  "Systém je ve stabilním stavu."
)

ERR_HLASKY=(
  "Došlo k chybě při zpracování."
  "Soubor nebyl nalezen."
  "Přístup byl odepřen."
  "Nastala neočekávaná chyba."
  "Chyba při čtení vstupních dat."
  "Chyba při zápisu do souboru."
  "Neplatný vstup."
  "Operaci nelze dokončit."
  "Požadovaný prostředek není dostupný."
  "Spojení bylo přerušeno."
  "Nedostatečná oprávnění k provedení akce."
  "Konfigurace je neplatná."
  "Službu se nepodařilo spustit."
  "Služba přestala odpovídat."
  "Vypršel časový limit operace."
  "Došlo k selhání procesu."
  "Chyba při inicializaci."
  "Systém hlásí kritickou chybu."
  "Požadovaný soubor již existuje."
  "Není dostatek systémových prostředků."
  "Interní chyba aplikace."
  "Operace byla přerušena."
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
