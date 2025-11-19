DELETE FROM Feedback;
DELETE FROM Rezervare;
DELETE FROM Profil_Client;
DELETE FROM Client;
DELETE FROM Proiectie;
DELETE FROM Film;
DELETE FROM Sala;
DELETE FROM Cinema;


INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Iasi', 'Strada Palas 67', '0756789012', 'iasi.cinema@iulius.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (170, 12, 14, (SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro'));


-- A. Testare PRIMARY KEY
-- PK: nu putem introduce doua randuri cu acelasi id_film
-- folosim id_film generat automat, dar testam eroarea prin duplicare manuala
INSERT INTO Film(Titlu, Durata, Gen) VALUES ('Sinister', 110, 'Horror'); 

-- încercare duplicat PK cu ID hardcodat, pentru test (va da ORA-00001)
INSERT INTO Film(id_film, Titlu, Durata, Gen) VALUES (1, 'The Truman Show', 103, 'Drama');
-- ORA-00001: unique constraint (FILM_PK) violated


-- B. Testare UNIQUE
-- UK: nu putem avea doua filme cu acelasi titlu
INSERT INTO Film(Titlu, Durata, Gen) VALUES ('Sinister', 103, 'Comedie');
-- ORA-00001: unique constraint (FILM_TITLU_UN) violated


-- C. Testare NOT NULL
-- NN: coloana Nume din Client nu poate fi NULL
INSERT INTO Client(Email, Telefon) 
VALUES ('denisache@gmail.com', '0712345678');
-- ORA-01400: cannot insert NULL into ("CLIENT"."NUME")


-- D. Testare CHECK
-- CK: durata filmului trebuie sa fie intre 60 si 240
INSERT INTO Film(Titlu, Durata, Gen)
VALUES ('film mult prea scurt', 30, 'Actiune');
-- ORA-02290: check constraint (DURATA_CK) violated

-- CK: gen invalid
INSERT INTO Film(Titlu, Durata, Gen)
VALUES ('Am uitat sa pun mister', 120, 'Mister');
-- ORA-02290: check constraint (GEN_CK) violated


-- E. Testare FOREIGN KEY
-- Dezactivare temporară trigger pentru durata filmului
ALTER TRIGGER verifica_durata_film DISABLE;

-- Test FK: adaugam proiectie cu film inexistent
INSERT INTO Proiectie(Data, ora_inceput, ora_sfarsit, id_film, id_sala)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'),
    '10:00',
    '12:00',
    9999, 
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro'))
);
-- ORA-02291: integrity constraint (PROIECTIE_FILM_FK) violated

-- Reactivare trigger
ALTER TRIGGER verifica_durata_film ENABLE;


INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-12-15','YYYY-MM-DD'),   
    '12:00',                              
    '14:00',                               
    (SELECT id_film FROM Film WHERE Titlu='Sinister'),  
    (SELECT id_sala FROM Sala WHERE id_cinema = 
        (SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro') 
    ),
    '3D'                                   
);


-- G. Testare DELETE + FK
-----------------------------
-- Nu putem sterge un film care are proiectii asociate
DELETE FROM Film WHERE id_film = (SELECT id_film FROM Film WHERE Titlu='Sinister');
-- Mesaj: ORA-02292: integrity constraint (PROIECTIE_FILM_FK) violated

-- H. Testare UPDATE + Constrangere Date
-----------------------------
--nu putem avea o data din trecut
UPDATE Proiectie
SET Data = TO_DATE('2023-01-01', 'YYYY-MM-DD')  
WHERE id_film = (SELECT id_film FROM Film WHERE Titlu='Sinister');


-- SUBINTEROGARI



-- 1. Inserare proiectie care se suprapune cu alta proiectie in aceeasi sala
INSERT INTO Proiectie (id_proiectie, Data, ora_inceput, ora_sfarsit, id_film, id_sala)
VALUES (303, TO_DATE('2025-12-15','YYYY-MM-DD'), '13:00', '15:00', (SELECT id_film FROM Film WHERE Titlu='Sinister'),(SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro')));
-- -> ar trebui sa dea ORA-20001: suprapunere



INSERT INTO Client (Email, Nume, Telefon)
VALUES ('unombun@gmail.com', 'Emilian', '0722222222');

INSERT INTO Client (Email, Nume, Telefon)
VALUES ('unomdiferit@gmail.com', 'Emanuel', '0733333333');


INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    2,'R1-C1',TO_DATE('2025-12-15','YYYY-MM-DD'),'REZERVAT',                             
    (SELECT id_proiectie FROM Proiectie WHERE id_film = (SELECT id_film FROM Film WHERE Titlu='Sinister')),
    (SELECT id_client FROM Client WHERE Email = 'unombun@gmail.com')
);


-- 2. Inserare rezervare pentru loc deja rezervat
INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    2,'R1-C1',TO_DATE('2025-12-15','YYYY-MM-DD'),'ACHITAT',                             
    (SELECT id_proiectie FROM Proiectie WHERE id_film = (SELECT id_film FROM Film WHERE Titlu='Sinister')),
    (SELECT id_client FROM Client WHERE Email = 'unomdiferit@gmail.com')
);
-- -> ar trebui sa dea ORA-20004: loc deja rezervat

-- 3. Inserare proiectie cu film care depaseste durata intervalului
INSERT INTO Proiectie ( Data, ora_inceput, ora_sfarsit, id_film, id_sala)
VALUES ( TO_DATE('2025-12-26','YYYY-MM-DD'), '10:00', '11:00', (SELECT id_film FROM Film WHERE Titlu='Sinister'), 
(SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro')));
-- -> ar trebui sa dea ORA-20003: durata filmului depaseste intervalul