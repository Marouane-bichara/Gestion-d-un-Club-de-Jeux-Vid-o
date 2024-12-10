CREATE DATABASE gamesclub;

USE gamesclub;

-- Table: members
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) ,
    email VARCHAR(100),
    join_date DATE ,
    subscription_id INT,
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(id) ON DELETE CASCADE
);


-- Déchargement des données de la table `members`
--

INSERT INTO members (name, email, join_date, subscription_id) VALUES
(1, 'John Doe', 'johndoe@example.com', '2024-01-10', 1),
(2, 'Jane Smith', 'janesmith@example.com', '2024-06-05', 2),
(3, 'Alice Brown', 'alicebrown@example.com', '2024-09-20', 3),
(4, 'Bob White', 'bobwhite@example.com', '2024-03-25', 1);

-- Table: subscriptions
CREATE TABLE subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_type VARCHAR(20),
    start_date DATE,
    end_date DATE
);



-- Déchargement des données de la table `subscriptions`
--

INSERT INTO subscriptions (id, subscription_type, start_date, end_date) VALUES
(1, 'Basic', '2024-01-01', '2025-01-01'),
(2, 'Premium', '2024-06-01', '2025-06-01'),
(3, 'VIP', '2024-09-15', '2025-09-15');





-- Table: video_games
CREATE TABLE video_games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    development_studio VARCHAR(100),
    release_date DATE,
    multiplayer ENUM('YES', 'NO')
);



-- Déchargement des données de la table `video_games`
--

INSERT INTO video_games (id, title, development_studio, release_date, multiplayer) VALUES
(1, 'Battlefield 2042', 'DICE', '2021-11-19', 'YES'),
(2, 'Minecraft', 'Mojang', '2011-11-18', 'YES'),
(3, 'The Legend of Zelda: Tears of the Kingdom', 'Nintendo', '2023-05-12', 'NO'),
(4, 'Cyberpunk 2077', 'CD Projekt Red', '2020-12-10', 'YES');



-- Table: loans
CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_member INT ,
    game_id INT ,
    loan_date DATE ,
    expected_return_date DATE ,
    actual_return_date DATE,
    FOREIGN KEY (id_member) REFERENCES members(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES video_games(id) ON DELETE CASCADE
);


-- Déchargement des données de la table `loans`
--

INSERT INTO loans (id, id_member, game_id, loan_date, expected_return_date, actual_return_date) VALUES
(1, 1, 1, '2024-10-05', '2024-10-12', '2024-10-11'),
(2, 2, 3, '2024-07-15', '2024-08-15', '2024-08-14'),
(3, 4, 2, '2024-11-01', '2024-11-15', '2024-11-12'),
(4, 3, 4, '2024-09-18', '2024-09-25', '2024-09-24');


-- Table: tournaments
CREATE TABLE tournaments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) ,
    date_tournament DATE ,
    prizes TEXT,
    game_id INT ,
    FOREIGN KEY (game_id) REFERENCES video_games(id) ON DELETE CASCADE
);



-- Déchargement des données de la table `tournaments`
--

INSERT INTO tournaments (id, name, date_tournament, prizes, game_id) VALUES
(1, 'Battle Royale Showdown', '2024-12-20', 'Gold Trophy, $500', 1),
(2, 'Minecraft Build-Off', '2024-12-10', 'Minecraft Skins, $300', 2),
(3, 'Cyberpunk 2077 Races', '2024-12-18', 'Digital Artbook, $1000', 4);


-- Table: tournament_participation
CREATE TABLE tournament_participation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT ,
    id_member INT ,
    ranking INT,
    FOREIGN KEY (tournament_id) REFERENCES tournaments(id) ON DELETE CASCADE,
    FOREIGN KEY (id_member) REFERENCES members(id) ON DELETE CASCADE
);



-- Déchargement des données de la table `tournament_participation`
--

INSERT INTO tournament_participation (id, tournament_id, id_member, ranking) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1),
(4, 2, 4, 2),
(5, 3, 1, 2),
(6, 3, 4, 1);