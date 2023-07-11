CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

-- 1.1 Mağazadaki tüm ürünlerin adlarını seçin.
-- 1.2 Mağazadaki tüm ürünlerin adlarını ve fiyatlarını seçin.
-- 1.3 Fiyatı 200$ veya daha düşük olan ürünlerin adını seçin.
-- 1.4 Fiyatı 60$ ile 120$ arasında olan tüm ürünleri seçin.
-- 1.5 Adı ve fiyatı sent cinsinden seçin (yani, fiyat 100 ile çarpılmalıdır).
-- 1.6 Tüm ürünlerin ortalama fiyatını hesaplayın.
-- 1.7 Üretici kodu 2 olan tüm ürünlerin ortalama fiyatını hesaplayınız.
-- 1.8 Fiyatı 180$'a eşit veya daha yüksek olan ürünlerin sayısını hesaplayın.
-- 1.9 Fiyatı 180$ veya daha yüksek olan tüm ürünlerin adını ve fiyatını seçin ve önce fiyata göre (azalan düzende), ardından ada göre (artan düzende) sıralayın.
-- 1.10 Her bir ürünün üreticisine ilişkin tüm veriler dahil olmak üzere, ürünlerdeki tüm verileri seçin.
-- 1.11 Tüm ürünlerin ürün adını, fiyatını ve üretici adını seçin.
-- 1.12 Her bir üreticinin ürününün ortalama fiyatını, yalnızca üretici kodunu göstererek seçin.
-- 1.13 Üreticinin adını gösteren her üreticinin ürününün ortalama fiyatını seçin.
-- 1.14 Ürünlerinin ortalama fiyatı 150$ veya daha yüksek olan üreticilerin adlarını seçin.
-- 1.15 En ucuz ürünün adını ve fiyatını seçin.
-- 1.16 Her üreticinin adını ve en pahalı ürününün adını ve fiyatını seçin.
-- 1.17 Yeni bir ürün ekleyin: Hoparlörler, 70 USD, üretici 2.
-- 1.18 Ürün 8'in adını "Lazer Yazıcı" olarak güncelleyin.
-- 1.19 Tüm ürünlerde %10 indirim uygulayın.
-- 1.20 Fiyatı 120$ veya daha yüksek olan tüm ürünlere %10 indirim uygulayın.

--Cevaplar
1.1 SELECT * FROM Products;
1.2 SELECT Name,Price FROM Products;
1.3 SELECT Name FROM Products WHERE Price <= 200;
1.4 SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;
1.5 SELECT Name,Price*100 AS Price FROM Products;
1.6 SELECT round(avg(Price),2) AS ortalama_fiyat FROM Products;
1.7 SELECT round(avg(Price),2) AS iki_ort_fiyat FROM Products WHERE Manufacturer = 2;
1.8 SELECT count(name) FROM Products WHERE Price >= 180;
1.9 SELECT Name,Price FROM Products WHERE Price >= 180 
	ORDER BY Price desc, Name;
1.10 SELECT * FROM Manufacturers
	 FULL JOIN Products ON Manufacturers.Code = Products.Manufacturer;
1.11 SELECT Products.Name, Products.Price, Manufacturers.Name FROM Manufacturers
	 FULL JOIN Products ON Manufacturers.Code = Products.Manufacturer;
1.12 SELECT round(avg(Price),2), Manufacturer FROM Products GROUP BY Manufacturer;
