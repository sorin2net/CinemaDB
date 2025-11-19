-- 1. Afisare filme programate impreuna cu sala si cinema-ul unde ruleaza
--   join intre Film, Proiectie, Sala, Cinema
SELECT Film.Titlu AS Titlu_Film,
       Film.Gen AS Gen,
       Proiectie.Data AS Data_Proiectiei,
       Proiectie.ora_inceput AS Ora_Inceput,
       Sala.id_sala AS Nr_Sala,
       Cinema.Oras AS Oras,
       Cinema.Strada AS Adresa_Cinema
FROM Proiectie
JOIN Film ON Proiectie.id_film = Film.id_film
JOIN Sala ON Proiectie.id_sala = Sala.id_sala
JOIN Cinema ON Sala.id_cinema = Cinema.id_cinema;

-- 2. Lista rezervarilor unui client pentru un anumit film
--  Join intre Client, Rezervare, Proiectie, Film
SELECT Client.Nume AS Client,
       Client.Email AS Email,
       Film.Titlu AS Film,
       Rezervare.data_rez AS Data_Rezervarii,
       Rezervare.locuri_rezervate AS Locuri
FROM Rezervare
JOIN Client ON Rezervare.id_client = Client.id_client
JOIN Proiectie ON Rezervare.id_proiectie = Proiectie.id_proiectie
JOIN Film ON Proiectie.id_film = Film.id_film;

-- 3. Feedback oferit de clienti pentru filme
--    Join intre Feedback, Rezervare, Proiectie, Film
SELECT Feedback.Recenzie AS Recenzie,
       Feedback.Rating AS Nota,
       Film.Titlu AS Film,
       Feedback.data_recenzie AS Data_Recenzie
FROM Feedback
JOIN Rezervare ON Feedback.id_rezervare = Rezervare.id_rezervare
JOIN Proiectie ON Rezervare.id_proiectie = Proiectie.id_proiectie
JOIN Film ON Proiectie.id_film = Film.id_film;