DELETE FROM Feedback;
DELETE FROM Rezervare;
DELETE FROM Profil_Client;
DELETE FROM Client;
DELETE FROM Proiectie;
DELETE FROM Film;
DELETE FROM Sala;
DELETE FROM Cinema;




-- cinema 1 cu sala pt acesta

INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Bucuresti', 'Strada Victoriei 10', '0723456789', 'contact@cinemavictoriei.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (200, 12, 16, (SELECT id_cinema FROM Cinema WHERE Email='contact@cinemavictoriei.ro'));


-- cinema 2 cu sala pt acesta

INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Cluj-Napoca', 'Strada Memorandumului 5', '0734567890', 'info@cinemamemorandum.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (180, 12, 15, (SELECT id_cinema FROM Cinema WHERE Email='info@cinemamemorandum.ro'));



-- cinema 3 cu sala pt acesta


INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Timisoara', 'Bulevardul Take Ionescu 12', '0745678901', 'office@cinemataxeionescu.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (160, 11, 14, (SELECT id_cinema FROM Cinema WHERE Email='office@cinemataxeionescu.ro'));


-- cinema 4 cu sala pt acesta


INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Iasi', 'Strada Palas 67', '0756789012', 'iasi.cinema@iulius.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (170, 12, 14, (SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro'));


-- cinema 5 cu sala pt acesta


INSERT INTO Cinema (Oras, Strada, Telefon, Email) 
VALUES ('Brasov', 'Strada Republicii 3', '0767890123', 'contact@cinemarepublicii.ro');

INSERT INTO Sala (Capacitate, nr_rand, nr_col, id_cinema)
VALUES (190, 12, 16, (SELECT id_cinema FROM Cinema WHERE Email='contact@cinemarepublicii.ro'));



-- client 1 cu profil 

INSERT INTO Client (Nume, Telefon, Email)
VALUES ('Ciorbea', '0723123456', 'victor.ciorbea@gmail.com');

INSERT INTO Profil_Client (nume, prenume, numar_telefon, data_nasterii, parola, adresa, email, id_client)
VALUES ('Ciorbea', 'Victor', '0723123456', TO_DATE('1954-02-26','YYYY-MM-DD'), 'Victor123!', 'Bucuresti, Strada Eminescu 10', 'victor.ciorbea@gmail.com',(SELECT id_client FROM Client WHERE Email='victor.ciorbea@gmail.com'));


-- client 2 cu profil 

INSERT INTO Client (Nume, Telefon, Email)
VALUES ('Ciolos', '0734234567', 'dacian.ciolos@yahoo.com');

INSERT INTO Profil_Client (nume, prenume, numar_telefon, data_nasterii, parola, adresa, email, id_client)
VALUES ('Ciolos', 'Dacian', '0734234567', TO_DATE('1969-07-27','YYYY-MM-DD'), 'Dacian456@', 'Cluj, Strada Libertatii 5', 'dacian.ciolos@yahoo.com',(SELECT id_client FROM Client WHERE Email='dacian.ciolos@yahoo.com'));


-- client 3 cu profil 

INSERT INTO Client (Nume, Telefon, Email)
VALUES ('Orban', '0745345678', 'ludovic.orban@hotmail.com');

INSERT INTO Profil_Client (nume, prenume, numar_telefon, data_nasterii, parola, adresa, email, id_client)
VALUES ('Orban', 'Ludovic', '0745345678', TO_DATE('1963-05-25','YYYY-MM-DD'), 'Ludovik789#', 'Timisoara, Strada Strazilor 12', 'ludovic.orban@hotmail.com',(SELECT id_client FROM Client WHERE Email='ludovic.orban@hotmail.com'));


-- client 4 cu profil 

INSERT INTO Client (Nume, Telefon, Email)
VALUES ('Klaus', '0756456789', 'klaus.iohannis@gmail.com');

INSERT INTO Profil_Client (nume, prenume, numar_telefon, data_nasterii, parola, adresa, email, id_client)
VALUES ('Klaus', 'Iohannis', '0756456789', TO_DATE('1959-06-13','YYYY-MM-DD'), 'Klaus321$', 'Sibiu, Strada Sfanta 7', 'klaus.iohannis@gmail.com',(SELECT id_client FROM Client WHERE Email='klaus.iohannis@gmail.com'));


-- client 5 cu profil 

INSERT INTO Client (Nume, Telefon, Email)
VALUES ('Ciuca', '0767567890', 'nicolae.ciuca@student.com');

INSERT INTO Profil_Client (nume, prenume, numar_telefon, data_nasterii, parola, adresa, email, id_client)
VALUES ('Ciuca', 'Nicolae', '0767567890', TO_DATE('1967-02-22','YYYY-MM-DD'), 'Nicolae654&', 'Brasov, Strada Republicii 3', 'nicolae.ciuca@student.com',(SELECT id_client FROM Client WHERE Email='nicolae.ciuca@student.com'));


--Filme

INSERT INTO Film (Titlu, Durata, Gen, Descriere, Restrictie_varsta)
VALUES ('Inception', 148, 'Science-Fiction', 'Un hoț abil fură secrete din visele oamenilor folosind tehnologii avansate.', 12);

INSERT INTO Film (Titlu, Durata, Gen, Descriere, Restrictie_varsta)
VALUES ('Titanic', 195, 'Drama', 'Povestea celebrului vas Titanic și a iubirii imposibile dintre Jack și Rose.', 7);

INSERT INTO Film (Titlu, Durata, Gen, Descriere, Restrictie_varsta)
VALUES ('The Conjuring', 112, 'Horror', 'Ed și Lorraine Warren investighează evenimente paranormale în case bântuite și misterioase.', 18);

INSERT INTO Film (Titlu, Durata, Gen, Descriere, Restrictie_varsta)
VALUES ('Avengers: Endgame', 171, 'Actiune', 'Supereroii universului Marvel se reunesc pentru a înfrunta amenințarea finală a lui Thanos.', 15);

INSERT INTO Film (Titlu, Durata, Gen, Descriere, Restrictie_varsta)
VALUES ('La La Land', 98, 'Romantic', 'Un muzician și o actriță încearcă să-și urmeze visurile în Los Angeles, în timp ce se îndrăgostesc.', 7);



-- Proiectie 1: Inception în sala cinema 1
INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'), 
    '11:00', 
    '14:00',
    (SELECT id_film FROM Film WHERE Titlu='Inception'),
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='contact@cinemavictoriei.ro')),
    '3D'
);

-- Proiectie 2: Titanic în sala cinema 2
INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'), 
    '12:00', 
    '16:00',
    (SELECT id_film FROM Film WHERE Titlu='Titanic'),
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='info@cinemamemorandum.ro')),
    '2D'
);

-- Proiectie 3: The Conjuring în sala cinema 3
INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'), 
    '14:00', 
    '16:00',
    (SELECT id_film FROM Film WHERE Titlu='The Conjuring'),
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='office@cinemataxeionescu.ro')),
    '4DX'
);

-- Proiectie 4: Avengers: Endgame în sala cinema 4
INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'), 
    '15:00', 
    '18:00',
    (SELECT id_film FROM Film WHERE Titlu='Avengers: Endgame'),
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='iasi.cinema@iulius.ro')),
    'IMAX'
);

-- Proiectie 5: La La Land în sala cinema 5
INSERT INTO Proiectie (Data, ora_inceput, ora_sfarsit, id_film, id_sala, tip_proiectie)
VALUES (
    TO_DATE('2025-11-20','YYYY-MM-DD'), 
    '16:00', 
    '18:00',
    (SELECT id_film FROM Film WHERE Titlu='La La Land'),
    (SELECT id_sala FROM Sala WHERE id_cinema=(SELECT id_cinema FROM Cinema WHERE Email='contact@cinemarepublicii.ro')),
    '3D'
);


-- Rezervari

INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    2,
    'R1-C1',
    TO_DATE('2025-12-19','YYYY-MM-DD'),
    'REZERVAT',
    (SELECT id_proiectie FROM Proiectie WHERE id_film=(SELECT id_film FROM Film WHERE Titlu='Inception')),
    (SELECT id_client FROM Client WHERE Email='victor.ciorbea@gmail.com')
);

INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    4,
    'R2-C2',
    TO_DATE('2026-01-27','YYYY-MM-DD'),
    'REZERVAT',
    (SELECT id_proiectie FROM Proiectie WHERE id_film=(SELECT id_film FROM Film WHERE Titlu='Titanic')),
    (SELECT id_client FROM Client WHERE Email='dacian.ciolos@yahoo.com')
);

INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    1,
    'R1-C3',
    TO_DATE('2025-12-25','YYYY-MM-DD'),
    'REZERVAT',
    (SELECT id_proiectie FROM Proiectie WHERE id_film=(SELECT id_film FROM Film WHERE Titlu='The Conjuring')),
    (SELECT id_client FROM Client WHERE Email='ludovic.orban@hotmail.com')
);

INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    3,
    'R10-C12',
    TO_DATE('2025-12-03','YYYY-MM-DD'),
    'REZERVAT',
    (SELECT id_proiectie FROM Proiectie WHERE id_film=(SELECT id_film FROM Film WHERE Titlu='Avengers: Endgame')),
    (SELECT id_client FROM Client WHERE Email='klaus.iohannis@gmail.com')
);

INSERT INTO Rezervare (numar_locuri, locuri_rezervate, data_rez, status_rezervare, id_proiectie, id_client)
VALUES (
    2,
    'R6-C7',
    TO_DATE('2025-12-08','YYYY-MM-DD'),
    'REZERVAT',
    (SELECT id_proiectie FROM Proiectie WHERE id_film=(SELECT id_film FROM Film WHERE Titlu='La La Land')),
    (SELECT id_client FROM Client WHERE Email='nicolae.ciuca@student.com')
);



-- Feedback-uri


INSERT INTO Feedback ( Recenzie, data_recenzie,Rating, id_rezervare)
VALUES (
    
    'Filmul a fost extraordinar de bun si de smecher, experienta 3D excelenta, parca ieseau din ecran!',
    TO_DATE('2025-12-19','YYYY-MM-DD'),
    5,
    (SELECT id_rezervare FROM Rezervare 
     WHERE id_client=(SELECT id_client FROM Client WHERE Email='victor.ciorbea@gmail.com')
     )
);

INSERT INTO Feedback ( Recenzie, data_recenzie,Rating, id_rezervare)
VALUES (
    
    'Filmul a fost emotionant si oamenii s-au inecat, dar sala putea fi mai confortabila. Nu mai vin la 2D',
    TO_DATE('2026-01-27','YYYY-MM-DD'),
    4,
    (SELECT id_rezervare FROM Rezervare 
     WHERE id_client=(SELECT id_client FROM Client WHERE Email='dacian.ciolos@yahoo.com')
     )
);

INSERT INTO Feedback ( Recenzie, data_recenzie,Rating, id_rezervare)
VALUES (
    
    'Filmul a fost infricosator, dar prea scurt. Pulsul nu a stat ridicat prea mult',
    TO_DATE('2025-12-25','YYYY-MM-DD'),
    3,
    (SELECT id_rezervare FROM Rezervare 
     WHERE id_client=(SELECT id_client FROM Client WHERE Email='ludovic.orban@hotmail.com')
     )
);

INSERT INTO Feedback ( Recenzie, data_recenzie,Rating, id_rezervare)
VALUES (
    
    'Impresionant! Experienta IMAX incredibila, merita revazut. Mai vin o data maine sa il vad din nou',
    TO_DATE('2025-12-03','YYYY-MM-DD'),
    5,
    (SELECT id_rezervare FROM Rezervare 
     WHERE id_client=(SELECT id_client FROM Client WHERE Email='klaus.iohannis@gmail.com')
     )
);

INSERT INTO Feedback ( Recenzie, data_recenzie, Rating, id_rezervare)
VALUES (
    
    'Muzica si coregrafia superbe, dar sala era putin aglomerata. Mi-a placut actorul principal, era frumos',
    TO_DATE('2025-12-08','YYYY-MM-DD'),
    4,
    (SELECT id_rezervare FROM Rezervare 
     WHERE id_client=(SELECT id_client FROM Client WHERE Email='nicolae.ciuca@student.com')
     )
);
