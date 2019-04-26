library(openintro)
library(xtable)
d <- email
names(d)

table(d$sent_email, d$spam)
SGlm <- function(form, data = d) {
  m <- glm(
      form,
      data = d,
      family = binomial)
  summary(m)
}

vars <- c(
    "to_multiple", "cc", "attach", "dollar",
    "winner", "inherit", "password", "format",
    "re_subj", "exclaim_subj", "sent_email")
form <- spam ~ 1
for (v in vars) {
  form <- update(form, paste(". ~ . +", v))
}
m <- glm(
    form,
    data = d,
    family = binomial)
summary(m)

# form <- update(form, . ~ . - exclaim_subj - cc)

aic <- c("Drop None" = SGlm(form))
vars. <- names(unlist(sapply(vars, grep, x = as.character(form)[3], fixed = TRUE)))
for (v in vars.) {
  m. <- update(form, paste(". ~ . -", v))
  aic[v] <- SGlm(m.)$aic
}
which.min(aic)
# xtable(data.frame(cbind(aic, aic[1] - aic)))
xtable(data.frame(aic))


