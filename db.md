#Tables of Milestone 2

Creazione delle tabelle per ogni entità:

table: User (Utente)
- user_id (PK, INT, UNIQUE, NOT NULL) → Identificatore univoco per l'utente che non può essere nullo.
- username (VARCHAR(25), UNIQUE, NOT NULL) → Nome utente univoco.
- email (VARCHAR(50), UNIQUE, NOT NULL) → Email univoca dell'utente.
- password (VARCHAR(50), NOT NULL) → Password dell'utente.
- created_at (TIMESTAMP, NOT NULL) → Data di registrazione dell'utente (giorno/mese/anno 00:00:00).


Relazioni:
Un utente può creare molti post (user -> One to many -> post);
Un utente può mettere un like per n post (user -> One to many -> like);
Un utente può aggiungere più commenti per n post (user -> One to many -> comment);


table: Post
- post_id (PK, INT, UNIQUE, NOT NULL) → Identificatore univoco per il post.
- user_id (FK, INT, NOT NULL) → Foreign key = Chiave esterna che fa riferimento alla PK di User.user_id.
- content (TEXT) → Testo del post, può essere NULL.
- created_at (TIMESTAMP, NOT NULL) → Data di creazione del post.

Relazioni:
Un post può contenere molti media (post -> One to many -> media);
Un post può essere associato a più tag (post -> One to many -> tag);
Un post può ricevere molti like (post -> One to many -> like);
Un post può ricevere molti commenti (post -> One to many -> comment);


table: Media
- media_id (PK, INT, UNIQUE, NOT NULL) → Identificatore univoco per il media.
- post_id (FK, INT, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.
- media_url (VARCHAR(500), NOT NULL) → URL del media (può essere una foto o un video).
- media_type (ENUM: 'photo', 'video', NOT NULL) → Tipo di media (foto o video).

Relazioni:
Diversi media possono essere presenti in un solo post (post -> One to many -> media);

table: Tag
- tag_id (PK, INT, UNIQUE, NOT NULL) → Identificatore univoco per il tag.
- post_id (FK, INT, UNIQUE, NOT NULL) → Chiave esterna che fa riferimento a Post. post_id.
- tag_name (VARCHAR(25), UNIQUE, NOT NULL) → Nome del tag.

Relazioni:
Un tag può essere associato a molti post (tag -> One to many -> post);

table: Like
- like_id (PK, INT, NOT NULL) → Identificatore univoco per il like.
- user_id (FK, INT, NOT NULL) → Chiave esterna che fa riferimento a User.user_id.
- post_id (FK, INT, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.

Relazioni:
Un utente può mettere un like a molti post,
ma ogni post può ricevere un like solo una volta da uno specifico utente;

table: Comment (Commento)
- comment_id (PK, INT, UNIQUE, NOT NULL) → Identificatore univoco per il commento.
- post_id (FK, INT, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.
- user_id (FK, INT, NOT NULL) → Chiave esterna che fa riferimento a User.user_id.
- content (TEXT, NOT NULL) → Testo del commento.
- created_at (TIMESTAMP, NOT NULL) → Data di creazione del commento.

Relazioni:
Un utente può creare più commenti (user -> One to many -> comment);
e un post può ricevere più commenti (post -> One to many -> comment);


Vincoli:
UNIQUE garantisce l’unicità di campi come username, email, e tag_name.
NOT NULL garantisce che i campi obbligatori come content e media_url non siano vuoti.
PK (Primary Key) e FK (Foreign Key) sono utilizzate per garantire l’integrità referenziale.
