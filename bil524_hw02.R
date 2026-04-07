ogrenci_ismi <- c("s1","s2","s3","s4","s5","s6","s7","s8","s9","s10")
vize_notu <- c(90,92,88,84,50,56,78,92,45,80)
final_notu <- c(98,90,100,84,90,70,70,80,0,90)

#vize-%40, final-%60 
ortalama_not <- vize_notu*0.4 + final_notu*0.6

#data frame
not_tablosu<- data.frame(ogrenci_ismi, vize_notu, final_notu, ortalama_not) 
colnames(not_tablosu)<- c("ogrenci_ismi", "vize_notu", "final_notu", "ortalama_not")

#harf notları
duraklar<- c(0,50,60,65,70,75,80,85,90,100)
harfler<- c("FF","FD","DD","DC","CC","CB","BB","BA","AA")

#not_tablosu data frame'inde harf notunun eklenmesi 
not_tablosu$harf_notu<- cut(not_tablosu$ortalama_not,
                            breaks= duraklar,
                            labels= harfler,
                            right= FALSE,
                            include.lowest= TRUE)

not_tablosu$durum<- ifelse(not_tablosu$harf_notu == "FF", "KALDI",
                           ifelse(not_tablosu$harf_notu %in% c("DD", "DC"),"KOŞULLU GEÇTİ", "GEÇTİ"))
  
  
  
print(not_tablosu)
print(summary(not_tablosu$ortalama_not))


