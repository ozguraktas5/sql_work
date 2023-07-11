-- parçalar
CREATE TABLE Pieces   (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
-- sağlayıcılar
 CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
-- sağlar
 CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
			 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');  
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');
			
INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');
			
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);

-- 5.1 Select the name of all the pieces. 
-- 5.2 Select all the providers' data. 
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
-- 5.4 Obtain the names of all providers who supply piece 1.
-- 5.5 Select the name of pieces provided by provider with code "HAL".
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
-- 5.8 Increase all prices by one cent.
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
	
--5.1
Select Name FROM Pieces;
--5.2
Select * FROM Providers;
--5.3
Select Pieces.Code, ROUND(AVG(Provides.Price),2) FROM Pieces 
INNER JOIN Provides
ON Pieces.Code = Provides.Piece
GROUP BY Pieces.Code;

select piece, avg(price) 
from Provides 
group by piece;
--5.4 
--1. parçayı tedarik eden tüm sağlayıcıların isimlerini alın.
Select Providers.Name FROM Providers
INNER JOIN Provides
ON Providers.Code = Provides.Provider
WHERE Provides.Piece = 1;
--5.5
--Sağlayıcı tarafından "HAL" koduyla sağlanan parçaların adını seçin.
Select Pieces.Name FROM Pieces
INNER JOIN Provides
ON Pieces.Code = Provides.Piece
WHERE Provides.Provider = 'HAL';
--5.6
--İlginç ve önemli biri.
--Her parça için, o parçanın en pahalı teklifini bulun ve parça adını, sağlayıcı adını ve fiyatı ekleyin
--(aynı parçayı en pahalı fiyata tedarik eden iki sağlayıcı olabileceğini unutmayın).
Select Pieces.Name, Provides.Provider, MAX(Provides.Price) FROM Provides
INNER JOIN Pieces
ON Pieces.Code = Provides.Piece
GROUP BY Pieces.Name, Provides.Provider;

SELECT Pieces.Name, Providers.Name, Price
FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece
            INNER JOIN Providers ON Providers.Code = Provider
WHERE Price =
(
  SELECT MAX(Price) FROM Provides
  WHERE Piece = Pieces.Code
);
--5.7
--"Skellington Sarf Malzemeleri"nin ("TNBC" kodu) her biri 7 sente zincir dişlileri ("1" kodu) sağlayacağını 
--belirtmek için veritabanına bir giriş ekleyin.
INSERT INTO Provides(Piece, Provider, Price) VALUES (1, 'TNBC', 7);
--5.8
--Tüm fiyatları bir sent artırın.
UPDATE Provides.Price
SET Price = Price+1
WHERE Provides;

--5.9
--Veritabanını "Susan Calvin Corp." ifadesini yansıtacak şekilde güncelleyin. (kod "RBT") cıvata sağlamaz (kod 4).
DELETE FROM Provides WHERE provider = 'RBT' AND Piece = 4;
SELECT * FROM Provides;
--5.10
--Veritabanını "Susan Calvin Corp." ifadesini yansıtacak şekilde güncelleyin. (kod "RBT") herhangi bir parça tedarik etmeyecektir
--(sağlayıcı hala veritabanında kalmalıdır).
DELETE FROM Provides WHERE provider = 'RBT';


