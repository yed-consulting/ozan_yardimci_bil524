ogrenci_ismi <- c("s1","s2","s3","s4","s5","s6","s7","s8","s9","s10") # vektör:aynı türde olan birden fazla veriyi tutar.
vize_notu <- c(90,92,88,84,50,56,78,92,45,80)  
final_notu <- c(98,90,100,84,90,70,70,80,0,90)

#vize-%40, final-%60 
ortalama_not <- vize_notu*0.4 + final_notu*0.6 #ağırlıklı ort. formülü

#data frame oluştur:
not_tablosu<- data.frame(ogrenci_ismi, vize_notu, final_notu, ortalama_not) 
#sütunları isimlendir:
colnames(not_tablosu)<- c("ogrenci_ismi", "vize_notu", "final_notu", "ortalama_not")

#harf notlarnı tanımla:
duraklar<- c(0,50,60,65,70,75,80,85,90,100) #harf notu geçiş durakları
harfler<- c("FF","FD","DD","DC","CC","CB","BB","BA","AA")

#not_tablosu data frame'inde harf notunun eklenmesi 
not_tablosu$harf_notu<- cut(not_tablosu$ortalama_not,
                            breaks= duraklar, #harf notunun değişeceği duraklar
                            labels= harfler,  # karşılık gelen harf notları
                            right= FALSE,   #durakların sağ sınırını sonraki harfe atar
                            include.lowest= TRUE) #100 alan için AA yazar 

not_tablosu$durum<- ifelse(not_tablosu$harf_notu == "FF", "KALDI",
                           ifelse(not_tablosu$harf_notu %in% c("DD", "DC"),"KOŞULLU GEÇTİ", "GEÇTİ"))
  
#FF ise kaldı, DD veya DC ise koşullu geçti, bunlar değilse geçti)
  
print(not_tablosu)  #son tablomuzu consola yazar
print(summary(not_tablosu$ortalama_not)) #ortlama_not verisinin özeti


