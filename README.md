# Slot Machine in R 🎰

This project simulates a slot machine built in R. It defines symbol probabilities, calculates winnings according to game rules, and runs multiple simulations to evaluate the expected prize payout.

## 📊 Overview

Developed as part of the **Statistics** course during the 1st year of the Computer Engineering degree. The simulation includes:

- 4 slot windows and 5 symbols: 🍇, 🍒, 🔔, 🍉, 💎
- Adjusted probability for each symbol
- Prize assignment based on statistical return (at least 70% of total stakes)
- Mass simulation of 1000 plays

## 🛠️ Tech Stack

- Language: **R**
- Package: [`emo`](https://github.com/hadley/emo) for emojis

## 🚀 How to Run

1. Install dependencies:
```r
install.packages("devtools")
devtools::install_github("hadley/emo")
````

2. Run the script in RStudio or the R console:

```r
source("slot_machine.R")
```

## 🎯 Features

* Weighted random draw of symbols
* Prize allocation using probability matrix
* Statistical computations with `dbinom`, `ceiling`, and matrix operations
* Analysis of payout, excess, and optimization
* Simulation of 1000 rounds to evaluate behavior

## 📁 Main File

* `slot_machine.R`: full implementation of slot logic and simulation

## 👤 Author

Alexander Mendoza Mendoza ([GitHub](https://github.com/AlexanderMenMen))
*Individual academic project.*
