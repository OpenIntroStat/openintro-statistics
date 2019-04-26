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
form <- update(form, . ~ . - exclaim_subj - cc - inherit - password - sent_email - dollar - attach)
m <- glm(
    form,
    data = d,
    family = binomial)
summary(m)
xtable(summary(m))

which.max(predict(m))
max(predict(m, type = "response"))



