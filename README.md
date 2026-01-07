# 🎬 Sistem de Gestiune Cinematograf (Cinema Management System)

[cite_start]Acest proiect reprezintă o soluție completă de bază de date pentru administrarea unui lanț de cinematografe[cite: 13]. [cite_start]Sistemul permite gestionarea locațiilor, a sălilor de proiecție, a programului de filme, a clienților și a procesului de rezervare, integrând totodată un sistem de feedback[cite: 13].

[cite_start]Proiectul a fost dezvoltat utilizând **Oracle SQL Developer Data Modeler** pentru proiectarea logică și relațională, urmată de implementarea fizică în **Oracle Database 11g**[cite: 12].

---

## 🖼️ Schemele Proiectului

### Modelul Logic


### Modelul Relațional


---

## 🚀 Caracteristici Principale

* [cite_start]**Gestiune Multi-Locație:** Administrarea mai multor cinematografe și a sălilor aferente acestora[cite: 13].
* [cite_start]**Programare Proiecții:** Control riguros asupra intervalelor orare pentru filme, evitând suprapunerile în săli[cite: 13, 277].
* [cite_start]**Sistem de Rezervări:** Permite clienților să rezerve locuri specifice (format R-C) pentru proiecții viitoare[cite: 17, 266].
* [cite_start]**Profiluri Clienți:** Gestionarea datelor personale, adreselor și securizarea prin parole[cite: 13, 241].
* [cite_start]**Analiză și Feedback:** Colectarea recenziilor și rating-urilor (1-10) pentru experiența de vizionare[cite: 274].

---

## 🏗️ Arhitectura Bazei de Date

[cite_start]Baza de date este compusă din **8 tabele interconectate** [cite: 64][cite_start], respectând regulile normalizării (**1NF, 2NF, 3NF**) pentru a asigura integritatea datelor și eliminarea redundanței[cite: 73, 212].

### 📊 Tabele și Relații

* [cite_start]**Cinema:** Stochează locația și datele de contact ale cinematografelor[cite: 213].
* [cite_start]**Sala:** Detalii despre capacitate, rânduri și coloane, aparținând unui cinema (relație 1:N)[cite: 67, 222].
* [cite_start]**Client & Profil_Client:** Separarea datelor de bază de detaliile extinse ale profilului (relație 1:1)[cite: 72, 227, 235].
* [cite_start]**Film:** Catalogul de filme cu detalii despre gen, durată și restricții de vârstă[cite: 245].
* [cite_start]**Proiectie:** Entitatea centrală care leagă filmele de săli și intervale orare (relație 1:N)[cite: 68, 256].
* [cite_start]**Rezervare:** Gestionează locurile ocupate de clienți pentru proiecții specifice[cite: 208, 263].
* [cite_start]**Feedback:** Recenzii oferite de clienți pentru rezervările efectuate (relație 1:1)[cite: 71, 270].

---

## 🛠️ Detalii de Implementare (Constrângeri și Triggere)

[cite_start]Sistemul include logică de business avansată implementată direct la nivelul bazei de date prin Triggere și Check Constraints[cite: 21]:

### Validarea Datelor
* [cite_start]**Format Contact:** Verificarea numerelor de telefon (RO: 07xx) și a adreselor de email prin expresii regulate[cite: 219, 221].
* [cite_start]**Restricții Vârstă:** Valori predefinite (3, 7, 12, 15, 18 ani) pentru filme[cite: 255].
* [cite_start]**Rating:** Punctaj obligatoriu între 1 și 10 pentru feedback[cite: 274].

### Automatizare și Integritate
* [cite_start]**Auto-Increment:** Utilizarea secvențelor (`SEQUENCE`) și a triggerelor pentru generarea automată a ID-urilor[cite: 214, 223].
* [cite_start]**Integritate Temporală:** Triggere care asigură că datele proiecțiilor și rezervărilor sunt întotdeauna în viitor[cite: 258, 267].

### Prevenirea Erorilor de Programare
* [cite_start]**Trigger `verifica_durata_film`:** Verifică dacă durata filmului se încadrează în intervalul orar al proiecției[cite: 277].
* [cite_start]**Trigger `verifica_suprapunere_proiectie`:** Împiedică programarea a două filme în aceeași sală în același timp[cite: 277].
* [cite_start]**Trigger `verifica_loc_unic`:** Garantează că un loc nu poate fi rezervat de două ori pentru aceeași proiecție[cite: 277].

---

## 📋 Cerințe Sistem

* **SGBD:** Oracle Database 11g sau mai nou.
* **Tool Recomandat:** Oracle SQL Developer / Data Modeler.

---

## 🧑‍💻 Autor

* [cite_start]**Student:** Dumitriu Denis-Gabriel, Grupa 1311A[cite: 2].
* [cite_start]**Coordonator:** Mironeanu Catalin[cite: 3].

---

## 📄 Documentație Completă

Pentru detalii tehnice aprofundate privind pașii normalizării și structura detaliată a fiecărei coloane, consultați fișierul **DocumentatiePDF.pdf**.
