CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

--Calisanlar tablosundaki en yüksek maası listeleyiniz
SELECT max(maas) as en_yuksek_maas FROM calisanlar2;

--En düşük maas
SELECT min(maas) as en_dusuk_maas FROM calisanlar2;

--Calisanlar tablosunda kaç kişi olduğunu listeleyiniz
SELECT count(isim) as kisi_sayisi FROM calisanlar2;

--Calisanlar tablosundaki maaş ortalamasını listeleyiniz
SELECT avg(maas) as ortalama_maas FROM calisanlar2;

--avg() methodda çıkan sonucu yuvarlamak için;
SELECT round(avg(maas)) as yuvarlama_maas FROM calisanlar2;

--Virgülden sonraki 2 basamağa yuvarlamak için;
SELECT round(avg(maas),2) as yuvarlama_maas FROM calisanlar2;

SELECT * FROM markalar;

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id, marka_isim, (SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim = isyeri) FROM markalar;

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim, calisan_sayisi, (SELECT sum(maas) as toplam_maas FROM calisanlar2 WHERE marka_isim = isyeri) FROM markalar;

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim, calisan_sayisi,
(SELECT max(maas) as max_maas FROM calisanlar2 WHERE marka_isim = isyeri),
(SELECT min(maas) as min_maas FROM calisanlar2 WHERE marka_isim = isyeri) FROM markalar;

/*
  MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/

SELECT urun_id, musteri_isim FROM mart
WHERE EXISTS (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id);

/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

SELECT urun_isim, musteri_isim FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_isim = nisan.urun_isim);

/*
Practice1:
“tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi” field’lari olsun.
2) Var olan tablodan yeni tablo olusturmak 
“tedarikçi_ziyaret” isminde bir tabloyu 
“tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari
olsun.

*/

CREATE TABLE tedarikciler(
tedarikci_id int,
tedarikci_ismi varchar(25),
tedarikci_adres varchar(50),
ulasim_tarihi date
);

CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler;

SELECT * FROM tedarikciler;

SELECT * FROM tedarikci_ziyaret;

/*
Practice2:
“ ogretmenler” isminde tablo olusturun. Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet”
field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
Kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
Ekleme :
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
Kimlik_no: 567597624, isim: Ali Veli
*/

CREATE TABLE ogretmenler(
kimlik_no char(11),
isim varchar(20),
brans varchar(30),
cinsiyet char(5)	
);

INSERT INTO ogretmenler VALUES('13241881390','Özgür','Developer','Erkek');
INSERT INTO ogretmenler VALUES('567597624','Ali Veli');

SELECT * FROM ogretmenler;

/*
Practice 3:
“sehirler” isimli bir Table olusturun. 
Tabloda “alan_kodu”, “isim”, “nufus” 
field’lari olsun. Isim field’i bos
birakilamasin.
1.Yontemi kullanarak “alan_kodu”
field’ini “Primary Key” yapin
*/

CREATE TABLE sehirler(
alan_kodu int PRIMARY KEY,
isim varchar(25) NOT NULL,
nufus int
);

SELECT * FROM sehirler;

/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3(
tedarikci_id int,
tedarikci_ismi varchar(20),
iletisim_isim varchar(25),
PRIMARY KEY (tedarikci_id)
);

SELECT * FROM tedarikciler3;

CREATE TABLE urunler(
tedarikci_id int,
urun_id int,
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

SELECT * FROM urunler;

/*
Practice 5:
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
, 
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”
,
“sokak”
, 
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar(
id varchar(15) PRIMARY KEY,
isim varchar(20) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', 'null', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmazz', 5000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');

SELECT * FROM calisanlar;

CREATE TABLE adresler(
adres_id varchar(15),
sokak varchar(50),
cadde varchar(50),
sehir varchar(50),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id));

DROP TABLE calisanlar;
DROP TABLE adresler;

/*
Practice 6
-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
-- D ile Y arasındaki personel bilgilerini listeleyiniz
-- D ile Y arasında olmayan personel bilgilerini listeleyiniz
-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
*/

DROP TABLE personel;

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);

SELECT * FROM personel;

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE id>='1003' AND id<='1005';

-- D ile Y arasındaki personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE isim BETWEEN 'Derya Soylu' AND 'Yavuz Bal';

--D ile Y arasında olmayan personel bilgilerini listeleyiniz
SELECT * FROM personel WHERE isim NOT BETWEEN 'Derya Soylu' AND 'Yavuz Bal';

--Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
SELECT * FROM personel WHERE maas= 70000 OR isim='Sena Beyaz';

--SUBQUERIES

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);

SELECT * FROM calisanlar2;

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

DROP TABLE markalar;
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

--marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id>101);

--Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
SELECT marka_id,calisan_sayisi FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar2 WHERE sehir='Ankara');

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id,marka_isim,(SELECT count(sehir) FROM calisanlar2 WHERE isyeri=marka_isim) as sehir_sayisi FROM markalar;

--Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim,calisan_sayisi,(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) as en_yuksek_maas FROM calisanlar2 WHERE marka_isim=isyeri),
(SELECT min(maas) as en_dusuk_maas FROM calisanlar2 WHERE marka_isim=isyeri)  FROM markalar;

--EXISTS CONDITION
/*
  MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/
SELECT musteri_isim,urun_id FROM mart
WHERE EXISTS(SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id);

/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
SELECT urun_isim,musteri_isim FROM nisan
WHERE EXISTS(SELECT urun_isim FROM mart WHERE nisan.urun_isim=mart.urun_isim);

/*
--Her iki ayda ortak satılmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
SELECT urun_isim,musteri_isim FROM nisan
WHERE NOT EXISTS(SELECT urun_isim FROM mart WHERE nisan.urun_isim=mart.urun_isim);

--UPDATE
DROP TABLE tedarikciler;
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
);

DROP TABLE urunler;

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler;
SELECT * FROM urunler;
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikciler
SET firma_ismi='Vestel'
WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler
SET firma_ismi='Casper',irtibat_ismi='Ali Veli'
WHERE vergi_no=101;

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler
SET urun_isim='Telefon'
WHERE urun_isim='Phone';

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler
SET urun_id= urun_id+1
WHERE urun_id > 1004;

--urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler
SET urun_id = urun_id + ted_vergino;

--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda 
--irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler
SET urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')
WHERE musteri_isim='Ali Bak';

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')
WHERE urun_isim='Laptop';

--Practice-8
CREATE TABLE personel4(
id int,
isim varchar(25),	
soyisim varchar(25),	
email varchar(30),	
ıse_baslama_tarihi date,
ıs_unvani varchar(25),
maas int	
);

INSERT INTO personel4 VALUES(123456789,'Ali','Can','alican@gmail.com','10-APR-10','isci',5000);
INSERT INTO personel4 VALUES(123456788,'Veli','Cem','velicem@gmail.com','10-JAN-12','isci',5500);
INSERT INTO personel4 VALUES(123456787,'Ayse','Gul','aysegul@gmail.com','01-MAY-14','muhasebeci',4500);
INSERT INTO personel4 VALUES(123456789,'Fatma','Yasa','fatmayasa@gmail.com','10-APR-09','muhendis',7500);

--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
SELECT maas,ıs_unvani FROM personel4 WHERE maas<5000 OR ıs_unvani='isci';

--Iscilerin tum bilgilerini listeleyin.
SELECT * FROM personel4 WHERE ıs_unvani='isci';

--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
SELECT ıs_unvani,maas FROM personel4 WHERE soyisim='Can' OR soyisim='Cem' OR soyisim='Gul';

--Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
SELECT email,ıse_baslama_tarihi FROM personel4 WHERE maas>5000;

--Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
SELECT * FROM personel4 WHERE maas BETWEEN 5000 AND 7000;

--IN CONDITION

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

--uzun yolu
SELECT * FROM musteriler WHERE urun_isim = 'Orange' OR urun_isim = 'Apple' OR urun_isim = 'Apricot';

--kısa yolu
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

--BETWEEN CONDITION

CREATE TABLE musteriler6
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler6 VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler6 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler6 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler6 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler6 VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler6 VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler6 VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler6 VALUES (20, 'Eddie', 'Apple');

--1) Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyiniz
SELECT * FROM musteriler6 WHERE urun_id BETWEEN 20 AND 40;

--NOT BETWEEN CONDITION

CREATE TABLE musteriler7
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler7 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler7 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler7 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler7 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler7 VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler7 VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler7 VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler7 VALUES (20, 'Eddie', 'Apple');

--1) Urun_id 20 ile 40 arasinda olmayan urunlerin tum bilgilerini listeleyiniz
SELECT * FROM musteriler7 WHERE urun_id NOT BETWEEN 20 AND 40;

--IS NULL CONDITION

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar WHERE isim IS NULL;
SELECT * FROM insanlar WHERE isim IS NOT NULL;
UPDATE insanlar
SET isim = 'İsim girilmemis'
WHERE isim IS NULL;

--ORDER BY CLAUSE

CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki datalari adres’e gore siralayin
SELECT * FROM insanlar ORDER BY adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar WHERE isim = 'Mine' ORDER BY ssn;

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
SELECT * FROM insanlar WHERE soyisim = 'Bulut' ORDER BY 2;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar ORDER BY ssn desc;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar ORDER BY isim asc, soyisim desc;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH(soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT(isim,' ',soyisim) AS isimsoyisim FROM insanlar ORDER BY LENGTH(isim) + LENGTH(soyisim);

--GROUP BY CLAUSE

CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

--1) Isme gore alinan toplam urunleri bulun.
SELECT isim, SUM(Urun_miktar) AS toplam_meyve_sayisi
FROM manav
GROUP BY isim;

--2) Urun ismine gore urunu alan toplam kisi sayisi
SELECT Urun_adi, COUNT(isim) AS toplam_kisi_sayisi
FROM manav
GROUP BY Urun_adi;

--3) Alinan kilo miktarina gore musteri sayisi
SELECT Urun_miktar, COUNT(isim) AS musteri_sayisi
FROM manav
GROUP BY Urun_miktar;

CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1) Isme gore toplam maaslari bulun
SELECT isim, SUM(maas) AS isme_gore_toplam_maas
FROM personel
GROUP BY isim;

--2) sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) AS sehre_gore_personel_sayisi
FROM personel
GROUP BY sehir;

--3) Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(*) AS personel_sayisi
FROM personel WHERE maas > 5000
GROUP BY sirket;

--4) Her sirket icin Min ve Max maasi bulun
SELECT sirket, MIN(maas) AS min_maas, MAX(maas) AS max_maas 
FROM personel
GROUP BY sirket;

--HAVING CLAUSE
CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

DELETE FROM personel

--1) Her sirketin MIN maaslarini eger 2000’den buyukse goster
SELECT sirket, MIN(maas) AS min_maas
FROM personel
GROUP BY sirket
HAVING MIN(maas) > 2000;

--2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz
SELECT isim, SUM(maas) AS isim_toplam_maas
FROM personel
GROUP BY isim
HAVING SUM(maas) >10000;

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir,COUNT(isim) AS personel_sayisi
FROM personel
GROUP BY sehir
HAVING COUNT(isim) > 1;

--4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir, MAX(maas) AS max_maas
FROM personel
GROUP BY sehir
HAVING MAX(maas) < 5000;

--UNION OPERATOR

--Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.

CREATE TABLE personel(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456789012, 'Veli Sahin ', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
SELECT isim,maas FROM personel WHERE maas > 4000
UNION
SELECT sehir,maas FROM personel WHERE maas > 5000;

-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz
SELECT isim,maas FROM personel WHERE isim = 'Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir = 'Istanbul';

--NOT : 2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tum tabloyu istediginiz siralamaya gore siralar
SELECT isim,maas FROM personel WHERE isim = 'Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir = 'Istanbul' ORDER BY maas;

--3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
SELECT sehir, maas FROM personel WHERE maas > 3000
UNION
SELECT isim, maas FROM personel WHERE maas <5000 ORDER BY maas;

CREATE TABLE personel
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id));

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
SELECT sehir AS sehir_tel, maas AS maas_cocuk_sayisi FROM personel WHERE id = 123456789
UNION
SELECT tel, cocuk_sayisi FROM personel_bilgi WHERE id = 123456789;

--NOT : Union islemi yaparken
--1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
--2)Alt alta gelecek sutunlarin data type’lari ayni olmali

--1) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim,maas FROM personel WHERE maas < 5000;

--2) Ayni sorguyu UNION ile iki kere yazarak calistirin
SELECT isim,maas FROM personel WHERE maas < 5000
UNION
SELECT isim,maas FROM personel WHERE maas < 5000;

--3) Ayni sorguyu UNION ALL ile iki kere yazarak calistirin
SELECT isim,maas FROM personel WHERE maas < 5000
UNION ALL
SELECT isim,maas FROM personel WHERE maas < 5000;

--UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
--Ayni kayit birden fazla olursa, sadece bir tanesini alir.
--UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
--NOT : UNION ALL ile birlestirmelerde de
--1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
--2)Alt alta gelecek sutunlarin data type’lari ayni olmali

--1) Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
SELECT sehir,maas FROM personel WHERE maas > 4000;

--2) Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
SELECT isim,maas FROM personel WHERE maas < 5000;

--3) Iki sorguyu UNION ve UNION ALL ile birlestirin
--UNION ile
SELECT sehir,maas FROM personel WHERE maas > 4000
UNION
SELECT isim,maas FROM personel WHERE maas < 5000;

--UNION ALL ile
SELECT sehir,maas FROM personel WHERE maas > 4000
UNION ALL
SELECT isim,maas FROM personel WHERE maas < 5000;

--INTERSECT OPERATOR

--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id,isim FROM personel WHERE sehir IN('Istanbul','Ankara');

--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3);

--3) Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE sehir IN('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3);













