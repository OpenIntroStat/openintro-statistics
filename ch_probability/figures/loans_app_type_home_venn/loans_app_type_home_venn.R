library(openintro)

d <- loans_full_schema
table(d[,c("application_type", "homeownership")])
table(d[,c("application_type")])
table(d[,c("homeownership")])

myPDF('loans_app_type_home_venn.pdf', 5, 1.5,
      mar = c(0.1, 1.5, 0.1, 0.1))
plot(c(-0.2, 2.2),
     c(0, 1),
     type = 'n',
     ylab = "",
     axes = FALSE)
box()

z <- seq(0, 2 * pi, len = 99)
x1 <- cos(z) * 1.04 + 0.8
y1 <- sin(z) / 3 + 0.5
lines(c(x1, x1[1]), c(y1, y1[1]))

x2 <- cos(z) / 1.8 + 1.65
y2 <- sin(z) / 3 + 0.5
lines(c(x2, x2[1]),c(y2, y2[1]))

text(0.6, 0.9, 'applicant had a mortgage')
text(1.9, 0.9, 'joint application')
text(c(0.6, 1.46, 2),
     c(0.6, 0.58, 0.57),
     c(3839, 950, 545),
     cex = c(1.7, 1.2, 1.25))
text(c(0.6, 1.46, 2),
     c(0.4, 0.44, 0.43),
     format(c('0.384', '0.095', '0.055')),
     cex = c(1.3, 0.95, 1),
     col = COL[1])
text(0.77, 0.07, 'Other loans: 10000 - 3839 - 950 - 545 = 4666')
text(1.9, 0.06, '(0.467)', col = COL[1])

dev.off()
# table(email[,c("joint application", "number")])
