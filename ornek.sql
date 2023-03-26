-- SQL UYGULAMA
/*
Aşağıdaki tabloyu SQL kodlarını kullanarak oluşturunuz.
+----+-------+-----+--------+------------------+
| id | isim  | yas | maas   |  email		   | 
+----+-------+-----+--------+------------------+
| 1  | Ali   | 39  | 12500  |ali@gmail.com	   |
| 2  | Derya | 28  | 15000  |derya@yahoo.com   |
| 3  | Sevim | 24  | 25000  |sevim@hotmail.com |
| 4  | Yusuf | 32  | 18000  |yusuf@gmail.com   |
| 5  | Halil | 48  | 22000  |halil@gmail.com   |
| 6  | Ece   | 54  | 21000  |ece@gmail.com     |
| 7  | Can   | 38  | 19000  |can@gmail.com     |
| 8  | Elif  | 27  | 14000  |elif@gmail.com    |
| 9  | Ezgi  | 35  | 21000  |ezgi@gmail.com    |
+----+-------+-----+--------+------------------+
*/

CREATE TABLE personel(
id int,
isim varchar(10),
yas int,
maas int,
email varchar(30)
);

insert into personel (id,isim, yas, maas,  email) values (1,'Ali', 39, 12500, 'ali@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (2,'Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (id,isim, yas, maas,  email) values (3,'Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (id,isim, yas, maas,  email) values (4,'Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (5,'Halil', 48, 22000, 'halil@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (6,'Ece', 54, 21000, 'ece@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (7,'Can', 38, 19000, 'can@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (8,'Elif', 27, 14000, 'elif@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (9,'Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (id,isim, yas, maas,  email) values (10,'Sena', 25, 11000, NULL);

select * from personel;
DELETE FROM personel;

-- 1) Tablo bilgilerini listeleyiniz.
-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
-- 3) id'si 8 olan personel bilgilerini listeleyiniz
-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
-- 15) emaili olmayan personel bilgilerini listeleyiniz.
-- 16) emaili olan personel bilgilerini listeleyiniz.
-- 17) personel bilgilerini yaşa göre sıralayınız.
-- 18) personel bilgilerini maaşa göre sıralayınız.
-- 19) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
-- 20) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
-- 21) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız

--CEVAPLAR

1 - SELECT * FROM personel;
2 - SELECT isim,yas,maas FROM personel;
3 - SELECT * FROM personel WHERE id=8;
4 - SELECT id,isim,yas,email FROM personel WHERE id=5;
5 - SELECT * FROM personel WHERE yas>30;
6 - SELECT * FROM personel WHERE NOT maas=21000;
7 - SELECT * FROM personel WHERE isim ILIKE 'a%';
8 - SELECT * FROM personel WHERE isim ~~ '%n';
9 - SELECT * FROM personel WHERE email ~ '@g';
10 - SELECT * FROM personel WHERE email !~ '@g';
11 - SELECT * FROM personel WHERE id=3 OR id=5 OR id=7 OR id=9;
12 - SELECT * FROM personel WHERE yas NOT IN (39,48,54);
13 - SELECT * FROM personel WHERE yas BETWEEN 30 AND 40;
14 - SELECT * FROM personel WHERE yas NOT BETWEEN 30 AND 40;
15 - SELECT * FROM personel WHERE email IS NULL;
16 - SELECT * FROM personel WHERE email ~ '@';
17 - SELECT * FROM personel ORDER BY yas;
18 - SELECT * FROM personel ORDER BY maas;
19 - SELECT yas FROM personel ORDER BY yas desc;
20 - SELECT maas FROM personel ORDER BY maas desc;
21 - SELECT * FROM personel ORDER BY maas desc limit 3;