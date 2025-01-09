use EczaneDB;

SELECT HastaID, AdSoyad, DogumTarihi, Cinsiyet 
FROM Hasta 
ORDER BY DogumTarihi DESC;


SELECT CalisanID, AdSoyad, Pozisyon, Maas 
FROM Calisan 
WHERE EczaneID = (SELECT EczaneID FROM Eczane WHERE EczaneAdi = 'Saðlýk Eczanesi');

SELECT StokID, IlacID, Miktar, RafNo 
FROM Stok 
WHERE Miktar > 0;


INSERT INTO Eczane (EczaneID, EczaneAdi, Adres, Telefon, Email) 
VALUES (1, 'Saðlýk Eczanesi', 'Ýstanbul, Kadýköy', '02161234567', 'saglik@eczane.com');



INSERT INTO Hasta (HastaID, AdSoyad, DogumTarihi, Cinsiyet, Telefon) 
VALUES (1, 'Ahmet Yýlmaz', '1990-05-15', 'Erkek', '05321234567');


INSERT INTO Stok (StokID, EczaneID, IlacID, Miktar, RafNo) 
VALUES (1, 1, 1, 50, 'A1');


UPDATE Ilac 
SET Fiyat = 18.50 
WHERE IlacID = 1;


UPDATE Calisan 
SET Maas = Maas + 1000 
WHERE CalisanID = 1;


UPDATE Doktor 
SET Uzmanlik = 'Kardiyoloji' 
WHERE DoktorID = 1;

DELETE FROM Recete 
WHERE ReceteID = 1;


DELETE FROM Tedarikci 
WHERE TedarikciID = 1;


DELETE FROM Stok 
WHERE Miktar = 0;
