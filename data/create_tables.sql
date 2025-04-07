BEGIN;

-- Suppression des tables existantes si elles sont déjà présentes
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS family;
DROP TABLE IF EXISTS association;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS ask;
DROP TABLE IF EXISTS conversation; 
DROP TABLE IF EXISTS message; 

-- Création de la table des utilisateurs
CREATE TABLE "user" (
  id                  SERIAL PRIMARY KEY,
  lastname            VARCHAR(50) NOT NULL,
  firstname           VARCHAR(50) NOT NULL,
  email               VARCHAR(100) NOT NULL UNIQUE,
  password            VARCHAR(255) NOT NULL,
  confirmationtoken   VARCHAR(255), -- Jeton de confirmation (nullable)
  tokenexpiration     TIMESTAMP, -- Date d'expiration
  isverified          BOOLEAN DEFAULT FALSE, -- Email vérifié (false par défaut)
  failed_attempts     INTEGER DEFAULT 0 NOT NULL, -- Tentatives échouées
  blocked_until       TIMESTAMP, -- Date jusqu'à laquelle l'utilisateur est bloqué
  rgpd_consent        BOOLEAN DEFAULT FALSE NOT NULL, -- Consentement RGPD obligatoire
  created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role                VARCHAR(50) CHECK (role IN ('family', 'association', 'admin')) NOT NULL
);


-- Création de la table des familles
CREATE TABLE family (
  id                 SERIAL PRIMARY KEY,
  address            VARCHAR(255) NOT NULL,
  postal_code        CHAR(5) NOT NULL, 
  city               VARCHAR(50) NOT NULL, 
  phone              VARCHAR(15) NOT NULL,
  number_of_children INT,
  number_of_animals  INT,
  garden             BOOLEAN,
  description        TEXT,
  profile_photo      VARCHAR(255),
  id_user            INT NOT NULL UNIQUE REFERENCES "user"(id) ON DELETE CASCADE,
  created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Création de la table des associations
CREATE TABLE association (
  id                 SERIAL PRIMARY KEY,
  rna_number         VARCHAR(42) UNIQUE NOT NULL,
  representative     VARCHAR(100) NOT NULL,
  address            VARCHAR(255) NOT NULL,
  postal_code        CHAR(5) NOT NULL, 
  city               VARCHAR(50) NOT NULL, 
  phone              VARCHAR(15) NOT NULL,
  description        TEXT,
  status             VARCHAR(15) NOT NULL,
  profile_photo      VARCHAR(255),
  id_user            INT NOT NULL UNIQUE REFERENCES "user"(id) ON DELETE CASCADE,
  created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table des animaux
CREATE TABLE animal (
  id               SERIAL PRIMARY KEY,
  name             VARCHAR(50) NOT NULL,
  species          VARCHAR(30) NOT NULL,
  breed            VARCHAR(50) NOT NULL,
  gender           CHAR(1) NOT NULL,
  age              INT NOT NULL,
  size             VARCHAR(30) NOT NULL,
  description      TEXT,
  profile_photo    VARCHAR(255),
  photo1           VARCHAR(255),
  photo2           VARCHAR(255),
  photo3           VARCHAR(255),
  is_paused        BOOLEAN DEFAULT FALSE,
  id_family        INT REFERENCES family(id),
  id_association   INT NOT NULL REFERENCES association(id) ON DELETE CASCADE,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table des demandes entre familles et animaux
CREATE TABLE ask (
  id         SERIAL PRIMARY KEY,
  status     VARCHAR(15) NOT NULL CHECK (status IN ('en attente', 'validée', 'rejetée')),
  id_family  INT NOT NULL REFERENCES family(id) ON DELETE CASCADE,
  id_animal  INT NOT NULL REFERENCES animal(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Gère les échanges entre familles et associations
CREATE TABLE conversation (
  id SERIAL PRIMARY KEY,
  id_family INT REFERENCES family(id) ON DELETE CASCADE,
  id_association INT REFERENCES association(id) ON DELETE CASCADE,
  last_message_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Dernier message envoyé
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Empêcher la création de plusieurs conversations entre une même famille et une même association
ALTER TABLE conversation ADD CONSTRAINT unique_conversation UNIQUE (id_family, id_association);

-- Stocke les messages échangés dans les conversations
CREATE TABLE message (
  id SERIAL PRIMARY KEY,
  id_conversation INT REFERENCES conversation(id) ON DELETE CASCADE, -- Conversation liée
  id_sender INT REFERENCES "user"(id) ON DELETE CASCADE, -- Expéditeur du message (utilisateur)
  content TEXT NOT NULL, -- Contenu du message
  is_read BOOLEAN DEFAULT FALSE, -- Message lu ou non
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 🔥 Index pour optimiser les requêtes sur la table des messages
CREATE INDEX idx_message_conversation ON message(id_conversation);
CREATE INDEX idx_message_sender ON message(id_sender);


-- TRIGGER : Mise à jour automatique du dernier message dans une conversation
CREATE OR REPLACE FUNCTION update_last_message()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE conversation
    SET last_message_at = CURRENT_TIMESTAMP
    WHERE id = NEW.id_conversation;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_last_message_trigger
AFTER INSERT ON message
FOR EACH ROW
EXECUTE FUNCTION update_last_message();

-- Fonction pour mettre à jour le timestamp automatiquement lors des modifications
CREATE OR REPLACE FUNCTION update_timestamp() 
RETURNS TRIGGER AS $$ 
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;

-- Triggers pour mettre à jour les timestamps lors des modifications
CREATE TRIGGER update_animal_timestamp
BEFORE UPDATE ON animal
FOR EACH ROW 
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_association_timestamp
BEFORE UPDATE ON association
FOR EACH ROW 
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_family_timestamp
BEFORE UPDATE ON family
FOR EACH ROW 
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_user_timestamp
BEFORE UPDATE ON "user"
FOR EACH ROW 
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_ask_timestamp
BEFORE UPDATE ON ask
FOR EACH ROW 
EXECUTE FUNCTION update_timestamp();

COMMIT;
