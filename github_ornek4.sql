CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
  FOREIGN KEY (Movie) REFERENCES Movies(Code)
);

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
-- 4.1 Tüm filmlerin adını seçin.
-- 4.2 Veritabanındaki tüm farklı derecelendirmeleri gösterin.
-- 4.3 Derecelendirilmemiş tüm filmleri göster.
-- 4.4 Şu anda bir film göstermeyen tüm sinema salonlarını seçin.
-- 4.5 Tüm sinema salonlarından tüm verileri seçin
    -- ve ayrıca sinemada gösterilen filmden (gösteriliyorsa) alınan veriler.
-- 4.6 Tüm filmlerden tüm verileri seçin ve bu film bir sinemada gösteriliyorsa, sinemadaki verileri gösterin.
-- 4.7 Şu anda hiçbir sinemada gösterilmeyen filmlerin adlarını gösterin.
-- 4.8 Derecelendirilmemiş "Bir, İki, Üç" filmini ekleyin.
-- 4.9 Derecelendirilmemiş tüm filmlerin derecelendirmesini "G" olarak ayarlayın.
-- 4.10 "NC-17" olarak derecelendirilen filmleri gösteren sinema salonlarını kaldırın.

--CEVAPLAR
-- 4.1
Select MovieTheaters.Name from MovieTheaters inner join Movies on MovieTheaters.Code = Movies.Code;
-- 4.2
Select Movies.Rating from Movies inner join MovieTheaters on MovieTheaters.Code = Movies.Code;
-- 4.3
Select * from Movies where Rating is NULL;
-- 4.4
Select * from MovieTheaters where Movie is NULL;
-- 4.5
Select * from MovieTheaters;
-- 4.6
Select * from Movies inner join MovieTheaters on MovieTheaters.Code = Movies.Code;
-- 4.7
Select Movies.Title from MovieTheaters right join Movies on Movies.Code = MovieTheaters.Movie
where MovieTheaters.Movie is NULL;
-- 4.8
INSERT INTO Movies(Title,Rating) VALUES('One, Two, Three',NULL);
-- 4.9
UPDATE Movies
SET Rating = 'G'
WHERE Rating is NULL;

Select * from Movies;
-- 4.10
Delete from MovieTheaters
Where Movie IN (Select Code from Movies Where Rating = 'NC-17');





 