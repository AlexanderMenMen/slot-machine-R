# Slot Machine in R 🎰

A slot machine simulation implemented in R, featuring weighted symbol probabilities, prize calculation logic, and reproducible simulations.  
The project includes a refactored version of the original academic code for improved clarity, maintainability, and flexibility.

---

## 📊 Overview

Originally developed as part of the **Statistics** course in the 1st year of the Computer Engineering degree, this simulation:

- Spins **4 slot windows** with **5 different symbols**: 🍇, 🍒, 🔔, 🍉, 💎
- Assigns probabilities for each symbol (customizable)
- Calculates prizes based on matching patterns and number of diamonds
- Ensures a minimum 70% return-to-player ratio in the original configuration
- Can run **thousands of rounds** to evaluate average payouts

---

## 🛠️ Tech Stack

- **R** (base)
- [`emo`](https://github.com/hadley/emo) *(optional)* for emoji output — falls back to text labels if unavailable.

---

## 🚀 How to Run

### 1️⃣ Install dependencies
If you want emojis:
```r
install.packages("devtools")
devtools::install_github("hadley/emo")
````

Otherwise, the script will automatically use text-based symbols.

### 2️⃣ Run the script

You can run with default values:

```bash
Rscript slot_machine.R
```

Or customize:

```bash
Rscript slot_machine.R --rounds=5000 --seed=42
```

---

## 🎯 Features

* **Weighted random draws** for each symbol
* **Named constants** for figures, probabilities, and payout table
* **Pure functions**: `spin_once()`, `compute_prize()`, and `simulate_n()`
* **Optional reproducibility** via `--seed`
* **Configurable number of rounds** via `--rounds`
* **Summary statistics**: total payout, average prize, standard deviation
* Prints the first few spins for inspection

---

## 📁 Files

* `slot_machine.R` → Full implementation of the slot machine logic and simulation.
* *(Optional)* `README.md` → This documentation.

---

## 📌 Example Output

```text
Slot Machine — R (refactor)
Rounds: 10 | Seed: 42 | Emojis: TRUE
[0001] 🍉 🔔 🍉 🍉 | Prize: 0
[0002] 💎 💎 💎 💎 | Prize: 86
[0003] 🍒 🍒 🍒 🍒 | Prize: 28
[0004] 🍇 🍉 💎 🍇 | Prize: 0
[0005] 💎 🍉 💎 💎 | Prize: 7

--- Summary ---
Total payout: 121
Average per round: 12.1000
Std. dev.: 27.1566
```

---

## 👤 Author

**Alexander Mendoza Mendoza** ([GitHub](https://github.com/AlexanderMenMen))
*Individual academic project, refactored for clarity and maintainability.*