# ÖDEV 3 - Ozan YARDIMCI

#EDA süreci adımları
#1. Veri Setini Oluşturma: Analiz edilecek veri sertinin üretilmesi  
#2. Yapısal İnceleme: Verinin satır ve sütun sayısı değişken tipleri
#3. Özet İstatistikler: Ortalama, medyan, yayılım vb. 
#4. Görselleştirme: Veriyi görsel olarak okumak


#Veri dış kaynaktan çekilmiştir (New York Air Quality Index)
url <- "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/airquality.csv"
hava_verisi <- read.csv(url)
print(head(hava_verisi)) #ilk 6 satırı yaz

nrow(hava_verisi) #rows sayısı = gözlem sayısı
ncol(hava_verisi) #columdn saysı = değişken sayısı 
summary(hava_verisi) #her değiişken içn min,max,median,mean,q1,q3 ve eksik NA değerleri

colSums(is.na(hava_verisi)) #is.na eksik verilerin yerine TRUE(1) yazar, dolu olan yerlere FALSE(0) yaza
                            #colSums, sütunları toplar. eksik veri toplamı tespit edilir. 

par(mfrow = c(1, 1)) #tekli çizim için
#nicel değişken,  frekans grafiğini göstermek için histogram kullanılabilir 
hist(hava_verisi$Ozone, 
     main = "Yer Seviyesi Ozon Konsantrasyonu", 
     xlab = "Ozon Seviyesi [ppb - parts per billion]", 
     col = "lightblue")


# Sıcaklık ve Ozon arasındaki ilişkiyi incelenebilir 
# Sıcaklık ve Ozon -- ikisi de nicel değişken. Scatter plot oluşturulabilir. 
plot(hava_verisi$Temp, hava_verisi$Ozone,
     main = "Sıcaklık ve Ozon İlişkisi",
     xlab = "Sıcaklık [Fahrenheit]",
     ylab = "Ozon Seviyesi [ppb]",
     col = "darkred",
     pch = 19) # pch= 19 için dolu noktalar

####----------------------------------------------------------####
#veri seti-2
kategoriler <- c("vize1", "vize2", "final", "proje") #değişkenler

set.seed(123) 
notlar <- round(runif(100, min = 0, max = 100)) #0-100 arası 100 adet (100 satır= 100 gözlem) 
                                                #random uniform notlar üretip sayısı yuvarlar
ogrenci_notlari <- data.frame(sinav_tipi = sample(kategoriler, 100, replace = TRUE),
  not = notlar) #sample: rastgele seçim 
                #replacece=TRUE seçilen sayı tekrar seçilebilir
                #not=notlar notlar verisini not sütununa ata
print(head(ogrenci_notlari)) #ilk 6 satırı yaz

#Sınav tiplerini döneim için kronolojikl sırası ile yeniden yaz
ogrenci_notlari$sinav_tipi <- factor(ogrenci_notlari$sinav_tipi, 
                                     levels = c("vize1", "vize2", "final", "proje"))

summary(ogrenci_notlari)

#box piot sınav notlarını hızlıca karşılaştırabilriz
boxplot(not ~ sinav_tipi, data = ogrenci_notlari,
        main="Sınav Tiplerine Göre Not Dağılımı",
        xlab="Sınav Tipi",
        ylab="Notlar",
        col= c("gold","blue","green","orchid"))

# tüm notlar için histogram
hist(ogrenci_notlari$not, 
     main = "Notların Dağılımı", 
     xlab = "Notlar", 
     col = "lightblue",
     breaks = 100)

# sınav tiplerine göre histogram 
vize1_notlari <- ogrenci_notlari$not[ogrenci_notlari$sinav_tipi == "vize1"]
vize2_notlari <- ogrenci_notlari$not[ogrenci_notlari$sinav_tipi == "vize2"]
final_notlari <- ogrenci_notlari$not[ogrenci_notlari$sinav_tipi == "final"]
proje_notlari <- ogrenci_notlari$not[ogrenci_notlari$sinav_tipi == "proje"]

par(mfrow = c(2, 2)) # 2*2'lik çizim kanvası oluştur
hist(vize1_notlari, 
     main = "Vize 1", 
     xlab = "Notlar", 
     col = "lightblue",
     breaks = 50)

hist(vize2_notlari, 
     main = "Vize 2", 
     xlab = "Notlar", 
     col = "lightgreen",
     breaks = 50)

hist(final_notlari, 
     main = "Final", 
     xlab = "Notlar", 
     col = "lightgrey",
     breaks = 50)

hist(proje_notlari, 
     main = "Proje", 
     xlab = "Notlar", 
     col = "lightyellow",
     breaks = 50)
par(mfrow = c(1, 1)) #1*1 olarak bırak
####----------------------------------------------------------####














 


