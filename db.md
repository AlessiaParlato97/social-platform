#Tables of Milestone 2

Creazione delle tabelle per ogni entità:

table: User (Utente)
- user_id (PK, UNIQUE, NOT NULL) → Identificatore univoco per l'utente.
- username (VARCHAR, UNIQUE, NOT NULL) → Nome utente univoco.
- email (VARCHAR, UNIQUE, NOT NULL) → Email univoca dell'utente.
- password (VARCHAR, NOT NULL) → Password dell'utente.
- created_at (TIMESTAMP, NOT NULL) → Data di registrazione dell'utente.


Relazioni:
Un utente può creare molti post (user -> One to many -> post);
Un utente può mettere molti like su post (user -> One to many -> like);
Un utente può aggiungere commenti ai post (user -> One to many -> comment);


table: Post
- post_id (PK, UNIQUE, NOT NULL) → Identificatore univoco per il post.
- user_id (FK, NOT NULL) → Chiave esterna che fa riferimento a User.user_id.
- content (TEXT, NOT NULL) → Testo del post.
- created_at (TIMESTAMP, NOT NULL) → Data di creazione del post.

Relazioni:
Un post può contenere molti media (post -> One to many -> media);
Un post può essere associato a più tag (post -> One to many -> tag);
Un post può ricevere molti like (post -> One to many -> like);
Un post può ricevere molti commenti (post -> One to many -> comment);


table: Media
- media_id (PK, UNIQUE, NOT NULL) → Identificatore univoco per il media.
- post_id (FK, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.
- media_url (VARCHAR, NOT NULL) → URL del media (può essere una foto o un video).
- media_type (ENUM: 'photo', 'video', NOT NULL) → Tipo di media (foto o video).

Relazioni:
Un media appartiene a un solo post (media -> One to one -> post);

table: Tag
- tag_id (PK, UNIQUE, NOT NULL) → Identificatore univoco per il tag.
- tag_name (VARCHAR, UNIQUE, NOT NULL) → Nome del tag.

Relazioni:
Un tag può essere associato a molti post (tag -> One to many -> post);

table: Like
- user_id (PK,FK, NOT NULL) → Chiave esterna che fa riferimento a User.user_id.
- post_id (PK,FK, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.

Relazioni:
Un utente può mettere un like a molti post,
ma ogni post può ricevere un like solo una volta da uno specifico utente
(Risoluzione con tabella Post_Tag);

table: Comment (Commento)
- comment_id (PK, UNIQUE, NOT NULL) → Identificatore univoco per il commento.
- post_id (FK, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.
- user_id (FK, NOT NULL) → Chiave esterna che fa riferimento a User.user_id.
- content (TEXT, NOT NULL) → Testo del commento.
- created_at (TIMESTAMP, NOT NULL) → Data di creazione del commento.

Relazioni:
Un utente può creare più commenti, (user -> One to many -> comment);
e un post può ricevere più commenti (post -> One to many -> comment);


table: Post_Tag
- post_id (PK,FK, NOT NULL) → Chiave esterna che fa riferimento a Post.post_id.
- tag_id (PK,FK, NOT NULL) → Chiave esterna che fa riferimento a Tag.tag_id.


Vincoli:
UNIQUE garantisce l’unicità di campi come username, email, e tag_name.
NOT NULL garantisce che i campi obbligatori come content e media_url non siano vuoti.
PK (Primary Key) e FK (Foreign Key) sono utilizzate per garantire l’integrità referenziale.
Relazioni M:N:
La relazione tra Post e Tag è M
e può essere risolta con una tabella intermedia chiamata Post_Tag.