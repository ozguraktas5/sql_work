CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

-- 2.1 Tüm çalışanların soyadını seçin.
-- 2.2 Yinelenenler olmadan tüm çalışanların soyadını seçin.
-- 2.3 Soyadı "Smith" olan çalışanların tüm verilerini seçin.
-- 2.4 Soyadı "Smith" veya "Doe" olan çalışanların tüm verilerini seçin.
-- 2.5 Departman 14'te çalışan çalışanların tüm verilerini seçin.
-- 2.6 Departman 37 veya departman 77'de çalışan çalışanların tüm verilerini seçin.
-- 2.7 Soyadı "S" ile başlayan çalışanların tüm verilerini seçin.
-- 2.8 Tüm bölümlerin bütçelerinin toplamını seçin.
-- 2.9 Her departmandaki çalışan sayısını seçin (sadece departman kodunu ve çalışan sayısını göstermeniz yeterlidir).
-- 2.10 Her çalışanın departman verileri dahil olmak üzere çalışanların tüm verilerini seçin.
-- 2.11 Her çalışanın adını ve soyadını ve çalışanın departmanının adını ve bütçesini seçin.
-- 2.12 Bütçesi 60.000$'dan fazla olan departmanlarda çalışan personelin adını ve soyadını seçin.
-- 2.13 Bütçesi tüm departmanların ortalama bütçesinden daha büyük olan departmanları seçin.
-- 2.14 İkiden fazla çalışanı olan bölümlerin adlarını seçin.
-- 2.15 Çok Önemli - İkinci en düşük bütçeli departmanlarda çalışan personelin isim ve soyadlarını seçiniz.
-- 2.16 "Kalite Güvencesi" adlı, bütçesi 40.000$ olan ve departman kodu 11 olan yeni bir departman ekleyin.
-- Ve o departmana SSN 847-21-9811 ile "Mary Moore" adında bir çalışan ekleyin.
-- 2.17 Tüm departmanların bütçesini %10 azaltın.
-- 2.18 Araştırma departmanındaki (kod 77) tüm çalışanları BT departmanına (kod 14) yeniden atayın.
-- 2.19 Tablodan BT departmanındaki tüm çalışanları silin (kod 14).
-- 2.20 Bütçesi 60.000$ veya daha büyük olan departmanlarda çalışan tüm çalışanları tablodan silin.
-- 2.21 Tüm çalışanları tablodan silin.

--CEVAPLAR

-- 2.1 Tüm çalışanların soyadını seçin.
SELECT LastName FROM Employees;

-- 2.2 Yinelenenler olmadan tüm çalışanların soyadını seçin.
SELECT DISTINCT LastName FROM Employees;

-- 2.3 Soyadı "Smith" olan çalışanların tüm verilerini seçin.
SELECT * FROM Employees WHERE LastName = 'Smith';

-- 2.4 Soyadı "Smith" veya "Doe" olan çalışanların tüm verilerini seçin.
SELECT * FROM Employees WHERE LastName = 'Smith' OR LastName = 'Doe';
SELECT * FROM Employees WHERE LastName IN ('Smith','Doe');

-- 2.5 Departman 14'te çalışan çalışanların tüm verilerini seçin.
SELECT * FROM Employees WHERE Department = 14;

-- 2.6 Departman 37 veya departman 77'de çalışan çalışanların tüm verilerini seçin.
SELECT * FROM Employees WHERE Department IN (37,77);

-- 2.7 Soyadı "S" ile başlayan çalışanların tüm verilerini seçin.
SELECT * FROM Employees WHERE LastName LIKE 'S%';
SELECT * FROM Employees WHERE LastName ~~ 'S%'; 

-- 2.8 Tüm bölümlerin bütçelerinin toplamını seçin.
SELECT SUM(Budget) AS toplam_butce FROM Departments;

-- 2.9 Her departmandaki çalışan sayısını seçin (sadece departman kodunu ve çalışan sayısını göstermeniz yeterlidir).
SELECT * FROM Employees ORDER BY Department;
SELECT Department, COUNT(Name) FROM Employees GROUP BY Department;

SELECT Department, COUNT(*) FROM Employees GROUP BY Department;

-- 2.10 Her çalışanın departman verileri dahil olmak üzere çalışanların tüm verilerini seçin.
SELECT * FROM Departments 
JOIN Employees 
ON Departments.Code = Employees.Department;

select a.*, b.* from employees a join departments b on a.department = b.code;

-- 2.11 Her çalışanın adını ve soyadını ve çalışanın departmanının adını ve bütçesini seçin.
SELECT a.Name, a.LastName, b.Name, b.Budget FROM Departments b
JOIN Employees a
ON b.Code = a.Department ORDER BY a.Name;

select Name, Lastname, (select Name from Departments where Code =Department),(select Budget from Departments where Code =Department) from Employees ;
-- 2.12 Bütçesi 60.000$'dan fazla olan departmanlarda çalışan personelin adını ve soyadını seçin.
SELECT a.Name, a.LastName FROM Employees a
JOIN Departments b
ON b.Code = a.Department
WHERE Budget > 60000;

select Name,Lastname,(select budget from Departments where Code =Department) from Employees where (select budget from Departments where Code =Department)>60000;

-- 2.13 Bütçesi tüm departmanların ortalama bütçesinden daha büyük olan departmanları seçin.
SELECT Name,Budget FROM Departments 
WHERE Budget > (SELECT avg(Budget) FROM Departments);

-- 2.14 İkiden fazla çalışanı olan bölümlerin adlarını seçin.
SELECT Name FROM Departments
WHERE Code IN (SELECT Department FROM Employees GROUP BY Department HAVING count(Department) > 2);

-- 2.15 İkinci en düşük bütçeli departmanlarda çalışan personelin isim ve soyadlarını seçiniz.
SELECT e.Name, e.LastName FROM Employees e
WHERE e.Department = (SELECT d.Code FROM Departments d ORDER BY d.budget OFFSET 1 ROW FETCH NEXT 1 ROW ONLY);

-- 2.16 "Kalite Güvencesi" adlı, bütçesi 40.000$ olan ve departman kodu 11 olan yeni bir departman ekleyin.
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Kalite Güvencesi',40000);
SELECT * FROM Departments;

-- 2.17 Tüm departmanların bütçesini %10 azaltın.
UPDATE Departments
SET Budget = Budget * 0.9;

SELECT * FROM Departments;

-- 2.18 Araştırma departmanındaki (kod 77) tüm çalışanları BT departmanına (kod 14) yeniden atayın.
Update Employees
SET Department = 14
WHERE Department = 77;

SELECT * FROM Employees;

-- 2.19 Tablodan BT departmanındaki tüm çalışanları silin (kod 14).
DELETE FROM Employees WHERE Department = 14;

SELECT * FROM Employees;

-- 2.20 Bütçesi 60.000$ veya daha büyük olan departmanlarda çalışan tüm çalışanları tablodan silin.
DELETE FROM Employees
WHERE Department IN (SELECT Code FROM Departments WHERE Budget >= 60000);

SELECT * FROM Employees;

-- 2.21 Tüm çalışanları tablodan silin.
DELETE FROM Employees;

SELECT * FROM Employees;










