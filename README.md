# Lekce 14 – debugování a přesměrování

## Cíl kapitoly
- spustit skript v ladicím (debugovacím) režimu,
- vysvětlit rozdíl mezi `bash -v` a `bash -x`,
- popsat účel souboru `/dev/null`,
- používat podmíněné spouštění příkazů pomocí `&&` a `||`,
- pracovat se standardním vstupem, výstupem a chybovým výstupem,
- přesměrovávat výstupy programů do souborů nebo na `/dev/null`.

---

## 1. Debugování skriptů v Bash

Při psaní shellových skriptů se často stává, že skript nefunguje podle očekávání. K nalezení chyby používáme **debugování** – tedy sledování toho, co skript skutečně dělá.

### 1.1 `bash -v nazev_skriptu`

- Přepínač `-v` (verbose) způsobí, že Bash **vypisuje jednotlivé řádky skriptu tak, jak jsou načítány**.
- Nevypisuje hodnoty proměnných, pouze samotné řádky.

**Použití:**
```bash
bash -v mujskript.sh
```

**Vhodné, pokud:**
- Např. chceme vidět, v jakém pořadí se řádky skriptu zpracovávají.

---

### 1.2 `bash -x nazev_skriptu`

- Přepínač `-x` (xtrace) vypisuje **jednotlivé příkazy po dosazení hodnot proměnných**.
- Velmi užitečné pro hledání chyb v logice skriptu.

**Použití:**
```bash
bash -x mujskript.sh
```

**Ukázka výstupu:**
```text
+ a=5
+ echo 5
```

---

### Úkol 1
Vytvořte jednoduchý nový script , nebo použíjte nějaký existující script (například hru kámen nůžky papír.) otestujte oba režimy:

Skript spusť pomocí:
- `bash -v test.sh`
- `bash -x test.sh`

Porovnej rozdíl ve výstupu.

---

## 2. Speciální soubor `/dev/null`

`/dev/null` je speciální systémový soubor, kterému se přezdívá **černá díra**.

- Všechna data, která do něj přesměrujeme, se **nenávratně zahodí**.
- Často se používá k potlačení nechtěného výstupu.

### 2.1 Přesměrování výstupu na `/dev/null`

**Syntaxe:**
```bash
příkaz > /dev/null
```

**Příklad:**
```bash
ls > /dev/null
```

➡️ Příkaz `ls` se provede, ale jeho výstup neuvidíme.

---



### Úkol 2
Spusť příkaz `ls` tak, aby:
- se provedl,
- ale nevypisoval nic na obrazovku.

---

## 3. Podmíněné spouštění příkazů (`&&`, `||`)

V Bash můžeme řetězit příkazy podle toho, **zda předchozí příkaz uspěl nebo selhal**.

### 3.1 Operátor `&&` (AND)

- Druhý příkaz se spustí **jen tehdy**, když první skončí úspěšně (exit status = 0).

**Syntaxe:**
```bash
příkaz1 && příkaz2
```

---

### 3.2 Operátor `||` (OR)

- Druhý příkaz se spustí **jen tehdy**, když první selže (exit status ≠ 0).

**Syntaxe:**
```bash
příkaz1 || příkaz2
```

---

### 3.3 Kombinace `&&` a `||`

```bash
příkaz1 && příkaz2 || příkaz3
```

- Pokud `příkaz1` uspěje → provede se `příkaz2`
- Pokud `příkaz1` selže → provede se `příkaz3`

**Příklad:**

```bash
rm soubor && echo "Soubor byl úspěšně odstraněn." || echo "Soubor nebyl odstraněn."
```

---

### Úkol 3
Napiš příkaz, který:
- zkusí odstranit soubor `test.txt`,
- při úspěchu vypíše hlášení o smazání,
- při neúspěchu vypíše chybovou zprávu.
- ls na složku a posléze na složku, která neexistuje. Vypiš ok, případně chyba pokud příkaz ls selhal.

```bash
rm err.log && echo "Smazáno..." || echo "CHYBA"
ls test && echo "OK" || echo "CHYBA"
```
---

## 4. Standardní vstup, výstup a chybový výstup

Při spuštění každého programu vznikají tři standardní datové proudy:

| Název | File descriptor | Popis | Výchozí zařízení |
|-----|----------------|------|------------------|
| stdin | 0 | standardní vstup | klávesnice |
| stdout | 1 | standardní výstup | obrazovka |
| stderr | 2 | chybový výstup | obrazovka |

---

### 4.1 Přesměrování vstupu

```bash
0 < vstupni_soubor
```

---

### 4.2 Přesměrování výstupů

```bash
1> soubor      # standardní výstup
2> soubor      # chybový výstup
1>&2           # stdout → stderr
2>&1           # stderr → stdout
&> soubor      # stdout + stderr
2> /dev/null   # zahodí chyby
1> /dev/null   # zahodí výstup
```

---

### Úkol 4
Vyzkoušej příkaz:
```bash
./errors.sh 1> log.log
./errors.sh 2> err.log
./errors.sh 1> log.log 2> err.log

```

Poté:
- přesměruj chybový výstup do souboru `chyby.txt`,
- potlač chybový výstup pomocí `/dev/null`.

---

## Shrnutí
- `bash -v` ukazuje řádky skriptu
- `bash -x` ukazuje příkazy včetně hodnot proměnných
- `/dev/null` slouží k zahazování výstupu
- `&&` a `||` umožňují podmíněné spouštění
- stdin, stdout a stderr lze přesměrovávat podle potřeby

---

## Cičení 
Vyzkoušejte následující příkazy a sledujte jednotlivé výstupy:
```bash
./errors.sh 1> vystup.txt
./errors.sh 2> chyby.txt
./errors.sh > /dev/null
./errors.sh 2> /dev/null
./errors.sh &> vse.txt
```

