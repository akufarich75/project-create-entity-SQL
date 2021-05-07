CREATE TABLE kelompokfilm (
jenis VARCHAR(15),
harga_sewa INT,
FOREIGN KEY (jenis) REFERENCES film (jenis)
);
CREATE TABLE film (
kode_film VARCHAR(5),
jenis VARCHAR(15),
judul VARCHAR(25),
jml_keping INT NOT NULL,
jml_film INT NOT NULL,
PRIMARY KEY (kode_film),
FOREIGN KEY (jenis) REFERENCES kelompokfilm (jenis)
);
CREATE TABLE customer (
no_identitas INT,
jenis_identitas VARCHAR(8),
nama VARCHAR(25),
alamat VARCHAR(50),
PRIMARY KEY (no_identitas),
FOREIGN KEY (no_identitas) REFERENCES menyewa (no_identitas)
);
CREATE TABLE menyewa (
kode_sewa VARCHAR(10),
no_identitas INT,
tgl_sewa DATE,
tot_film INT,
tgl_kembali DATE,
PRIMARY KEY (no_identitas),
FOREIGN KEY (no_identitas) REFERENCES customer (no_identitas)
);
CREATE TABLE detailmenyewa (
kode_film VARCHAR(5),
kode_sewa VARCHAR(10),
FOREIGN KEY (kode_film) REFERENCES film (kode_film)
);

ALTER TABLE customer
ADD no_hp INT;

ALTER TABLE customer
CHANGE no_hp no_wa INT;

ALTER TABLE menyewa
MODIFY COLUMN tgl_sewa DATETIME;

ALTER TABLE menyewa
ADD tot_harga INT;

ALTER TABLE menyewa
CHANGE denda tot_harga INT;

ALTER TABLE menyewa
CHANGE tot_harga denda INT;

ALTER TABLE customer
DROP COLUMN jenis_identitas;

ALTER TABLE customer
CHANGE no_identitas No_Customer INT;

INSERT INTO kelompokfilm VALUES ('action','3000')
INSERT INTO kelompokfilm VALUES ('drama','3500')
INSERT INTO kelompokfilm VALUES ('horror','3000')
INSERT INTO kelompokfilm VALUES ('komedi','50000')

INSERT INTO film VALUES ('A01','action','spiderman','2','3')
INSERT INTO film VALUES ('A02','action','spiderman 2','2','5')
INSERT INTO film VALUES ('D01','drama','love story','2','3')
INSERT INTO film VALUES ('H01','horror','evil death','2','2')
INSERT INTO film VALUES ('K01','komedi','kapan kawin','10','2')
INSERT INTO film VALUES ('K02','komedi','takut kawin','6','3')
INSERT INTO film VALUES ('D02','drama','ayat ayat cinta','8','3')
INSERT INTO film VALUES ('D03','drama','tiga doa tiga cinta','5','2')
INSERT INTO film VALUES ('H02','horror','resident evil','7','4')


INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0001','A01')
INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0001','A02')
INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0002','D01')
INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0003','A02')
INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0003','D01')
INSERT INTO detailmenyewa  (kode_sewa, kode_film) VALUES ('S0003','H01')

INSERT INTO menyewa VALUES ('S0001','001','01/01/2007','2','02/01/2007','6000','0')
INSERT INTO menyewa VALUES ('S0002','002','03/01/2007','1','03/01/2007','3500','0')
INSERT INTO menyewa VALUES ('S0003','001','06/01/2007','3','08/01/2007','9500','0')

INSERT INTO customer VALUES ('001','SIM','Andi','Pontianak')
INSERT INTO customer VALUES ('002','SIM','Budi','Pontianak')

UPDATE kelompokfilm SET harga_sewa =  '30000' 
WHERE harga_sewa = '3000' 
UPDATE kelompokfilm SET harga_sewa =  '35000' 
WHERE harga_sewa = '3500'

UPDATE menyewa SET denda = '5000' WHERE tot_film = '1'
UPDATE menyewa SET denda = '10000' WHERE tot_film = '2'
UPDATE menyewa SET denda = '15000' WHERE tot_film = '3'
UPDATE menyewa SET tot_hrg = '60000' WHERE tot_hrg = '6000'
UPDATE menyewa SET tot_hrg = '35000' WHERE tot_hrg = '3500'
UPDATE menyewa SET tot_hrg = '95000' WHERE tot_hrg = '9500'


INSERT INTO customer VALUES ('003','SIM','Santi','surabaya')
INSERT INTO menyewa VALUES ('S0004','003','2007/01/03','2','','0','85000')
INSERT INTO menyewa VALUES ('S0005','003','2007/01/06','2','2007/01/08','40000','80000')

SELECT no_identitas, denda FROM menyewa WHERE denda > 5000 
SELECT nama, alamat FROM customer WHERE no_identitas = 1
SELECT nama, alamat FROM customer WHERE no_identitas = 3

SELECT jenis
FROM kelompokfilm
WHERE harga_sewa>30000

SELECT nama, alamat
FROM customer, menyewa
WHERE menyewa.no_identitas=customer.no_identitas, denda>5000

SELECT * FROM film 
WHERE judul LIKE “cinta” 

SELECT * FROM film 
WHERE jenis="komedi" AND jml_film>2

SELECT kode_sewa FROM menyewa WHERE tgl_sewa = '2007-01-03'
SELECT judul FROM film WHERE kode_film = 'D01'

SELECT no_identitas FROM menyewa WHERE tgl_kembali IS NULL 
SELECT nama FROM customer WHERE no_identitas=003

CREATE TABLE kategori_film (
kode_film VARCHAR (15),
kategori_film VARCHAR (15),
rating VARCHAR (15),
FOREIGN KEY (kode_film) REFERENCES film (kode_film)
);

UPDATE kelompokfilm SET harga_sewa = 3/5 * harga_sewa

SELECT kode_sewa
FROM menyewa
WHERE tot_hrg >=6000

SELECT jenis, judul FROM film WHERE jenis='action' AND jml_film = jml_film < 5













