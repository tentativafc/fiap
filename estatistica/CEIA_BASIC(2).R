alt = c(110, 100, 60, 80, 70, 18, 17, 17, 42, 89, 108, 143)

nat = c(2.39, 2.32, 2.26, 2.2, 2.14, 2.09, 2.04, 1.99, 1.95, 1.91, 1.87, 1.83, 1.8, 1.77, 1.74, 1.56, 1.69)

pibpcap = c(6913, 7481, 8351, 9511, 10703, 11723, 12862, 14358, 16236, 17221, 19877, 22170, 24165, 26521, 28500, 29117, 30407)

rendsalmin = c(5557, 5841, 6498, 6035, 7015, 7034, 7197, 7101, 7529, 7418, 7959, 7708, 8342, 9645)

summary(pluv)

table(pluv)

transform(table(cut(pluv, breaks = pretty(pluv, n = 4))),FreqRel = Freq/12, FreqAcum = cumsum(Freq), FreqRelAcum = cumsum(Freq)/12)

transform(table(cut(pluv, breaks = c(17,40,80,120,160))))

hist(pluv, breaks = 5)

hist(pluv, breaks = c(0,40,80,120,160))

pie(table(cut(pluv, breaks = c(0,40,80,120,160))))

mean(pluv)

sd(pluv)

var(pluv)

median(pluv)


