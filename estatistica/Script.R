alt = c(110, 100, 60, 80, 70, 18, 17, 17, 42, 89, 108, 143)
nat = c(2.39, 2.32, 2.26, 2.2, 2.14, 2.09, 2.04, 1.99, 1.95, 1.91, 1.87, 1.83, 1.8, 1.77, 1.74, 1.56, 1.69)

summary(alt)
boxplot(alt, horizontal=TRUE)
# 17 cms?
### Interquartil
#IQR = Q3-Q1

q1 = quantile(alt, .25)
q3 = quantile(alt, .75)
iqr = q3 - q1
lim_inf = quantile(alt, .25) - (iqr * 1.5)
lim_sup = quantile(alt, .75) + (iqr * 1.5)
outliers_sup = alt[alt <= lim_inf]
outliers_inf = alt[alt >= lim_sup]
std_2 = sd(alt) * 2
lim_inf = alt < std_2 



summary(nat)  
hist(nat, breaks = 5)
boxplot(nat, horizontal=TRUE)
hist(alt, breaks = 5)




pibpcap = c(6913, 7481, 8351, 9511, 10703, 11723, 12862, 14358, 16236, 17221, 19877, 22170, 24165, 26521, 28500, 29117, 30407)

rendsalmin = c(5557, 5841, 6498, 6035, 7015, 7034, 7197, 7101, 7529, 7418, 7959, 7708, 8342, 9645)

summary(pibpcap)

table(pibpcap)

transform(table(cut(pibpcap, breaks = pretty(pibpcap, n = 4))),FreqRel = Freq/12, FreqAcum = cumsum(Freq), FreqRelAcum = cumsum(Freq)/12)

transform(table(cut(pibpcap, breaks = c(6913, 10703, 16236, 24165, 30407))))

hist(pibpcap, breaks = 5)

hist(pibpcap, breaks = c(6913, 10703, 16236, 24165, 30407))

pie(table(cut(pibpcap, breaks = c(6913, 10703, 16236, 24165, 30407))))

mean(pibpcap)

sd(pibpcap)

var(pibpcap)

median(pibpcap)

plot(alt, nat, main = "Altura X Natalidade", xlab = "Altura", ylab = "Natalidade", pch = 19, frame = FALSE)


hist(wt, mpg, main="Scatterplot Example", 
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)


