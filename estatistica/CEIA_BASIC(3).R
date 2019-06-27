alt = c(110, 100, 60, 80, 70, 18, 17, 17, 42, 89, 108, 143)

nat = c(2.39, 2.32, 2.26, 2.2, 2.14, 2.09, 2.04, 1.99, 1.95, 1.91, 1.87, 1.83, 1.8, 1.77, 1.74, 1.56, 1.69)

pibpcap = c(6913, 7481, 8351, 9511, 10703, 11723, 12862, 14358, 16236, 17221, 19877, 22170, 24165, 26521, 28500, 29117, 30407)

rendsalmin = c(5557, 5841, 6498, 6035, 7015, 7034, 7197, 7101, 7529, 7418, 7959, 7708, 8342, 9645)

pluv = c(110, 100, 60, 80, 70, 18, 17, 17, 42, 89, 108, 143)

irmãos = c(0,1,2,0,0,2,4,1,2,3,2,1,1,1,1,0,0,0,1,2,3,4,2,2,1,1,0,1,0,1,0,1,0,2,1,1,2,0,1,1)

summary(pluv)

table(pluv)

transform(table(cut(pibpcap, breaks = pretty(pibpcap, n = 4))),FreqRel = Freq/12, FreqAcum = cumsum(Freq), FreqRelAcum = cumsum(Freq)/12)

transform(table(cut(pluv, breaks = c(17,40,80,120,160))))

hist(pluv, breaks = 5)

hist(pluv, breaks = c(0,40,80,120,160))

pie(table(cut(pluv, breaks = c(0,40,80,120,160))))

mean(pluv)

sd(pluv)

var(pluv)

median(pluv)

t.test(pluv, mu = 70.6)

t.test(irmãos, m = 2)

t.test(pluv, mu = 70.6, alternative = "less")

t.test(pluv, mu = 70.6, alternative = "greater")

t.test(evento1, mu=285, alternative = "two.sided", conf.level = 0.99)

