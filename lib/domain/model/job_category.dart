enum JobCategory {
  shoring, excavation, breaker;
}


//Bu kategoriler yetmedi çünkü alt kategorileri de var bu fiyatların, mesela shoring shutcrete veya fore kazık fiyatı gelebilir.

// *** Bu gelen kategorilere göre quantity kalkülasyonu yapılmalı
// *** Ui veya state tarafından ikisinden biri seçilebilmelidir.

// Aslında iç içe enum yapabilsem bunu rahatlıkla başarabilirim fakat yapamadım. Çünkü;
// Eğer mesela shoringBoredPile veya shoringShutcrete yaparsam bu sefer bu ikisi arasında ui veya state arasından seçim yapma sıkıntım doğuyor.
// Sistem ikisinide otomatik hesaplıyor, ben hem ikisinden birini seçebilmeyi hem de kalkülasyonu yapmak istiyorum (Sadece seçtiğimiz kalkülasyonu yapılsa çok daha iyi olur)