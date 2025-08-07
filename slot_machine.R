# Slot Machine in R — refactor for clarity and reproducibility
# Author: Alexander Mendoza Mendoza
# Usage:
#   Rscript slot_machine.R --rounds=1000 --seed=130
#   Rscript slot_machine.R                      # defaults

# ---------- Dependencies (optional emojis) ----------
use_emoji <- requireNamespace("emo", quietly = TRUE)

sym <- list(
  grape   = if (use_emoji) emo::ji("grape")      else "GRAPE",
  cherry  = if (use_emoji) emo::ji("cherries")   else "CHERRY",
  bell    = if (use_emoji) emo::ji("bell")       else "BELL",
  watermelon = if (use_emoji) emo::ji("watermelon") else "WATERMELON",
  diamond = if (use_emoji) emo::ji("gem")        else "DIAMOND"
)

# ---------- Config ----------
# Symbols (order matters) and probabilities
FIGURES <- c(sym$grape, sym$cherry, sym$bell, sym$watermelon, sym$diamond)
PROBS   <- c(0.35,      0.08,       0.25,     0.30,          0.02)

# Payout schedule aligned with your original matrix:
# max (4 diamonds) = 86; any other 4-equal = 28; 3 diamonds = 7; 2 diamonds = 2; otherwise 0
PAYOUTS <- list(
  four_diamonds = 86,
  four_other    = 28,
  three_diamond = 7,
  two_diamond   = 2,
  none          = 0
)

N_WINDOWS <- 4  # four slots per spin

stopifnot(length(FIGURES) == length(PROBS))
if (abs(sum(PROBS) - 1) > 1e-8) stop("Probabilities must sum to 1.")

# ---------- CLI args ----------
get_arg <- function(name, default = NULL) {
  # expects --name=value
  a <- grep(paste0("^--", name, "="), commandArgs(TRUE), value = TRUE)
  if (length(a) == 0) return(default)
  sub(paste0("^--", name, "="), "", a[1])
}
ROUNDS <- as.integer(get_arg("rounds", 1000))
SEED   <- get_arg("seed", NA)

if (!is.na(SEED)) set.seed(as.integer(SEED))

# ---------- Core helpers ----------
spin_once <- function(figures = FIGURES, probs = PROBS, n = N_WINDOWS) {
  sample(figures, size = n, replace = TRUE, prob = probs)
}

compute_prize <- function(result, figures = FIGURES, payouts = PAYOUTS) {
  # count diamonds
  diamond <- tail(figures, 1)  # last is diamond in our config
  dcount <- sum(result == diamond)

  # four-in-a-row (any symbol)
  # Note: "all equal and not diamond" vs "all diamonds"
  if (length(unique(result)) == 1) {
    if (result[1] == diamond) return(payouts$four_diamonds)
    else return(payouts$four_other)
  }
  if (dcount == 3) return(payouts$three_diamond)
  if (dcount == 2) return(payouts$two_diamond)
  return(payouts$none)
}

simulate_n <- function(n_rounds) {
  prizes <- integer(n_rounds)
  # sample once per window for speed
  for (i in seq_len(n_rounds)) {
    res <- spin_once()
    prizes[i] <- compute_prize(res)
    if (i <= 5) {
      cat(sprintf("[%04d] %s | Prize: %d\n", i, paste(res, collapse = " "), prizes[i]))
    }
  }
  list(
    total = sum(prizes),
    mean  = mean(prizes),
    sd    = sd(prizes),
    rounds = n_rounds
  )
}

# ---------- Run ----------
cat("Slot Machine — R (refactor)\n")
cat(sprintf("Rounds: %d | Seed: %s | Emojis: %s\n",
            ROUNDS, ifelse(is.na(SEED), "none", SEED), use_emoji))

stats <- simulate_n(ROUNDS)
cat("\n--- Summary ---\n")
cat(sprintf("Total payout: %d\nAverage per round: %.4f\nStd. dev.: %.4f\n",
            stats$total, stats$mean, stats$sd))