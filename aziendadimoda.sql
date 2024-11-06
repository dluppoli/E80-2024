USE master
DROP DATABASE IF EXISTS AziendaDiModa
CREATE DATABASE AziendaDiModa
USE AziendaDiModa

CREATE TABLE Filati(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) NOT NULL,
    CostoAcquisto FLOAT
)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cotone Nero',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cotone Grigio',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cotone Bianco',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cotone Rosso',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cotone Verde',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in cottone Blu',40)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Nero',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Grigio',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Bianco',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Rosso',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Verde',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato in lana Blu',50)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Nero',45)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Grigio',45)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Bianco',45)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Rosso',45)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Verde',45)
INSERT INTO Filati(Nome,CostoAcquisto) VALUES('Filato misto Blu',45)

CREATE TABLE Taglie(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(10) NOT NULL,
    AumentoFilati FLOAT NOT NULL DEFAULT 0,
    Ordinamento INT NOT NULL
)
INSERT INTO Taglie(Nome,AumentoFilati,Ordinamento) VALUES('S',0.95,2)
INSERT INTO Taglie(Nome,AumentoFilati,Ordinamento) VALUES('M',1,3)
INSERT INTO Taglie(Nome,AumentoFilati,Ordinamento) VALUES('L',1.05,4)
INSERT INTO Taglie(Nome,AumentoFilati,Ordinamento) VALUES('XL',1.1,5)
INSERT INTO Taglie(Nome,AumentoFilati,Ordinamento) VALUES('XS',0.9,1)

CREATE TABLE CategorieArticoli(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) NOT NULL
)
INSERT INTO CategorieArticoli(Nome) VALUES('Pantalone')
INSERT INTO CategorieArticoli(Nome) VALUES('Maglia')
INSERT INTO CategorieArticoli(Nome) VALUES('Cappotto')

CREATE TABLE StatiOrdini(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(200) NOT NULL
)
INSERT INTO StatiOrdini(Nome) VALUES('Confermato')
INSERT INTO StatiOrdini(Nome) VALUES('In Produzione')
INSERT INTO StatiOrdini(Nome) VALUES('Prodotto')
INSERT INTO StatiOrdini(Nome) VALUES('Spedito')


CREATE TABLE Clienti(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Nominativo VARCHAR(1024) NOT NULL,
    Indirizzo VARCHAR(1024),
    Città VARCHAR(1024),
    Provincia VARCHAR(200),
    Stato VARCHAR(200),
    CAP VARCHAR(50),
    VAT VARCHAR(50)
)
INSERT INTO Clienti(Nominativo,Stato) VALUES('Mario Rossi','Italy')
INSERT INTO Clienti(Nominativo,Stato) VALUES('Luigi Verdi','Italy')
INSERT INTO Clienti(Nominativo,Stato,VAT) VALUES('La boutique del vestito','Italy','0943900129')
INSERT INTO Clienti(Nominativo,Stato,VAT) VALUES('Centro commerciale Centovetrine','Italy','0233300129')
INSERT INTO Clienti(Nominativo,Stato) VALUES('Italian dresses','United States of America')
INSERT INTO Clienti(Nominativo,Stato) VALUES('Italian firms','United States of America')
INSERT INTO Clienti(Nominativo,Stato) VALUES('Ropa italiana','Spain')
INSERT INTO Clienti(Nominativo,Stato) VALUES('Italienische Kleidung ','Germany')


CREATE TABLE Ordini(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Data Date NOT NULL,
    IdCliente INT NOT NULL,
    IdStato INT NOT NULL,
    FOREIGN KEY(IdCliente) REFERENCES Clienti(Id),
    FOREIGN KEY(IdStato) REFERENCES StatiOrdini(Id)
)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-01',1,4)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-03',5,4)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-04',4,3)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-05',6,3)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-10',3,2)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-10',3,2)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-15',3,1)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-15',8,1)
INSERT INTO Ordini(Data, IdCliente,IdStato) Values('2022-01-15',3,1)

CREATE TABLE Articoli(
	Id INT PRIMARY KEY IDENTITY(1,1),
    Descrizione VARCHAR(1024) NOT NULL,
    Prezzo FLOAT CHECK(Prezzo > 0),
    IdCategoria INT NOT NULL,
    FOREIGN KEY(IdCategoria) REFERENCES CategorieArticoli(Id)
)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Pantalone elegante nero',100,1)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Pantalone elegante bianco',100,1)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Pantalone sportivo grigio',90,1)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Pantalone sportivo blu',90,1)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica lunga bianca',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica lunga rossa',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica lunga verde',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica corta bianca',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica corta rossa',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Polo a manica corta verde',60,2)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Cappotto lungo nero',200,3)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Cappotto lungo grigio',200,3)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Cappotto lungo bianco',200,3)
INSERT INTO Articoli(Descrizione, Prezzo, IdCategoria) VALUES('Cappotto doppio petto nero',250,3)

CREATE TABLE FilatiArticoli(
	Id INT PRIMARY KEY IDENTITY(1,1),
    IdArticolo INT NOT NULL,
    IdFilato INT NOT NULL,
    Qta FLOAT CHECK(Qta > 0),
    FOREIGN KEY(IdArticolo) REFERENCES Articoli(Id),
    FOREIGN KEY(IdFilato) REFERENCES Filati(Id)
)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(1,1,0.5)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(1,13,0.4)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(2,3,0.5)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(2,15,0.4)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(3,14,0.9)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(4,18,0.9)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(5,3,0.7)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(5,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(6,4,0.7)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(6,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(7,5,0.7)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(7,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(8,3,0.55)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(8,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(9,4,0.55)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(9,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(10,5,0.55)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(10,16,0.01)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(11,7,2)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(12,8,2)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(13,9,2)
INSERT INTO FilatiArticoli(IdArticolo,IdFilato,Qta) VALUES(14,7,2.4)

CREATE TABLE ArticoliOrdini(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdOrdine INT NOT NULL,
    IdArticolo INT NOT NULL,
    IdTaglia INT NOT NULL,
    Qta FLOAT CHECK(Qta > 0),
    FOREIGN KEY(IdOrdine) REFERENCES Ordini(Id),
    FOREIGN KEY(IdArticolo) REFERENCES Articoli(Id),
    FOREIGN KEY(IdTaglia) REFERENCES Taglie(Id)
)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(1,1,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(1,5,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(2,3,3,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(2,8,3,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,5,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,5,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,5,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,5,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,5,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,6,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,6,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,6,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,6,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,6,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,7,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,7,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,7,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,7,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,7,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,8,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,8,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,8,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,8,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,8,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,9,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,9,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,9,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,9,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,9,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,10,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,10,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,10,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,10,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(3,10,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,11,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,11,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,11,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,11,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,11,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,12,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,12,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,12,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,12,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,12,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,13,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,13,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,13,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,13,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,13,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,14,1,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,14,2,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,14,3,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,14,4,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(4,14,5,10)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,1,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,2,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,3,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,4,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,5,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,6,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,7,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,8,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,9,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,10,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,11,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,12,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,13,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(5,14,2,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,2,1,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,2,2,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,2,3,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,2,4,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,2,5,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,5,1,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,5,2,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,5,3,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,5,4,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,5,5,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,8,1,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,8,2,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,8,3,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,8,4,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(6,8,5,20)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(7,10,5,1)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,1,1,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,1,2,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,1,3,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,1,4,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,1,5,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,2,1,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,2,2,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,2,3,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,2,4,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(8,2,5,2)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,3,1,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,3,2,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,3,3,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,3,4,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,3,5,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,4,1,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,4,2,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,4,3,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,4,4,7)
INSERT INTO ArticoliOrdini(IdOrdine,IdArticolo,IdTaglia,Qta) VALUES(9,4,5,7)


CREATE TABLE Magazzini(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nome VARCHAR(100) NOT NULL,
	Indirizzo VARCHAR(1000) NOT NULL)

INSERT INTO Magazzini(Nome,Indirizzo) VALUES('Magazzino Centrale', 'Via di qua 12')

CREATE TABLE MovimentiArticoli (
	Id INT PRIMARY KEY IDENTITY(1,1),
    Data DATE NOT NULL,
    IdArticolo INT NOT NULL,
    IdTaglia INT NOT NULL,
    IdMagazzino INT NOT NULL,
    Qta FLOAT NOT NULL,
	Nota VARCHAR(1024),
    FOREIGN KEY (IdArticolo) REFERENCES Articoli(Id),
    FOREIGN KEY (IdTaglia) REFERENCES Taglie(Id),
    FOREIGN KEY (IdMagazzino) REFERENCES Magazzini(Id)
)

INSERT INTO MovimentiArticoli(Data,IdArticolo,IdTaglia, IdMagazzino,Qta, Nota)
SELECT DATEADD(DAY,10,O.Data) As Data,AO.IdArticolo,AO.Idtaglia,1 AS IdMagazzino, AO.Qta, CONCAT('Rif OdV ',O.Id) As Nota 
FROM ArticoliOrdini AO INNER JOIN Ordini O ON AO.IdOrdine = O.Id
WHERE O.IdStato IN (3,4)

INSERT INTO MovimentiArticoli(Data,IdArticolo,IdTaglia, IdMagazzino,Qta, Nota)
SELECT DATEADD(DAY,12,O.Data) As Data,AO.IdArticolo,AO.Idtaglia,1 AS IdMagazzino, -1*AO.Qta, CONCAT('Rif OdV ',O.Id) As Nota 
FROM ArticoliOrdini AO INNER JOIN Ordini O ON AO.IdOrdine = O.Id
WHERE O.IdStato = 4;

CREATE TABLE MovimentiFilati (
	Id INT PRIMARY KEY IDENTITY(1,1),
    Data DATE NOT NULL,
    IdFilato INT NOT NULL,
    IdMagazzino INT NOT NULL,
    Qta FLOAT NOT NULL,
	Nota VARCHAR(1024),
    FOREIGN KEY (IdFilato) REFERENCES Filati(Id),
    FOREIGN KEY (IdMagazzino) REFERENCES Magazzini(Id)
)

INSERT INTO MovimentiFilati(Data,IdFilato, IdMagazzino,Qta)
SELECT '2024-01-01' AS Data, F.Id AS IdFilato,1 AS IdMagazzino, 230
FROM filati F

INSERT INTO MovimentiFilati(Data,IdFilato, IdMagazzino, Qta, Nota)
SELECT DATEADD(DAY,10,O.Data) As Data, FA.IdFilato AS Id,1 AS IdMagazzino, -1*SUM(AO.Qta*FA.Qta*T.AumentoFilati) AS Qta, CONCAT('Rif Odv ',O.Id) As Nota
FROM ArticoliOrdini AO 
INNER JOIN FilatiArticoli FA ON FA.IdArticolo = AO.IdArticolo
INNER JOIN Taglie T ON AO.IdTaglia = T.Id
INNER JOIN Ordini O ON O.Id = AO.IdOrdine
WHERE O.IdStato IN (3,4)
GROUP BY FA.IdFilato,O.Id,O.Data
ORDER BY Qta DESC