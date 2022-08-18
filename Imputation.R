#Imputation adalah memasukkan nilai pada data yang diindikasi terdapat missing value
library(imputeTS)

#Datanya dapat disimulasikan sendiri, disini digunakan data runtun waktu (bitcoin time series (btc.ts))
data=read.csv(file.choose(),sep =";", dec=".", header=TRUE)
View(data)
#Didefinisikan tanggal awal dari data hingga akhir
awal <- as.Date("2017-03-01")
akhir <- as.Date("2021-09-30")
panjang <- akhir-awal
panjang
tanggal<-seq(awal, length=panjang+1, by="days")

#Didefinisikan per frekuensi sebanyak 30 data
btc.ts = ts(data$Close, start = c(01/03/2017), frequency = 30)
btc.ts
plot.ts(btc.ts)
ggplot_na_distribution(btc.ts)
summary(is.na(btc.ts))

#Plot missing value (NA)
ggplot_na_distribution(btc.ts)

#Impute dengan metode rata-rata (na_mean)
a1<-na_mean(btc.ts, option = "mean")
a1
ggplot_na_imputations(btc.ts, a1)

#Impute dengan metode pembobotan (na_ma)
a2<-na_ma(btc.ts, k=3, weighting = "linear")
ggplot_na_imputations(btc.ts, a2)
a2

#Impute dengan metode spline (na_interpolation)
a3<-na_interpolation(btc.ts, option = "spline")
a3
ggplot_na_imputations(btc.ts, a3)

#Impute dengan metode kalman (na_kalman)
a4<-na_kalman(btc.ts)
ggplot_na_imputations(btc.ts, a4)
a4
