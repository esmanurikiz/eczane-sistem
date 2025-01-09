USE EczaneDB;  
GO


CREATE TABLE Eczane (
    EczaneID INT PRIMARY KEY,
    EczaneAdi VARCHAR(100),
    Adres VARCHAR(255),
    Telefon VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Ilac (
    IlacID INT PRIMARY KEY,
    IlacAdi VARCHAR(100),
    Firma VARCHAR(100),
    Fiyat DECIMAL(10, 2),
    Kategori VARCHAR(50)
);


CREATE TABLE Hasta (
    HastaID INT PRIMARY KEY,
    AdSoyad VARCHAR(100),
    DogumTarihi DATE,
    Cinsiyet VARCHAR(10),
    Telefon VARCHAR(15)
);
CREATE TABLE Doktor (
    DoktorID INT PRIMARY KEY,
    AdSoyad VARCHAR(100),
    Uzmanlik VARCHAR(100),
    Telefon VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Recete (
    ReceteID INT PRIMARY KEY,
    HastaID INT,
    DoktorID INT,
    Tarih DATE,
    FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
    FOREIGN KEY (DoktorID) REFERENCES Doktor(DoktorID)
);



CREATE TABLE Calisan (
    CalisanID INT PRIMARY KEY,
    EczaneID INT,
    AdSoyad VARCHAR(100),
    Pozisyon VARCHAR(50),
    Maas DECIMAL(10, 2),
    FOREIGN KEY (EczaneID) REFERENCES Eczane(EczaneID)
);


CREATE TABLE Tedarikci (
    TedarikciID INT PRIMARY KEY,
    FirmaAdi VARCHAR(100),
    Telefon VARCHAR(15),
    Email VARCHAR(100),
    Adres VARCHAR(255)
);


CREATE TABLE Siparis (
    SiparisID INT PRIMARY KEY,
    TedarikciID INT,
    IlacID INT,
    Miktar INT,
    Tarih DATE,
    FOREIGN KEY (TedarikciID) REFERENCES Tedarikci(TedarikciID),
    FOREIGN KEY (IlacID) REFERENCES Ilac(IlacID)
);

CREATE TABLE Stok (
    StokID INT PRIMARY KEY,
    EczaneID INT,
    IlacID INT,
    Miktar INT,
    RafNo VARCHAR(10),
    FOREIGN KEY (EczaneID) REFERENCES Eczane(EczaneID),
    FOREIGN KEY (IlacID) REFERENCES Ilac(IlacID)
);

CREATE TABLE Fatura (
    FaturaID INT PRIMARY KEY,
    ReceteID INT,
    ToplamTutar DECIMAL(10, 2),
    Tarih DATE,
    FOREIGN KEY (ReceteID) REFERENCES Recete(ReceteID)
);
