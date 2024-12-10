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
(4, 'Bob White', 'bobwhite@example.com', '2024-03-25', 1),
('Sam Harris', 'sam.harris@example.com', '2024-12-05', 1),
('Emily Clark', 'emily.clark@example.com', '2024-12-06', 2),
('Oliver Black', 'oliver.black@example.com', '2024-12-07', 3),
('Sophia Green', 'sophia.green@example.com', '2024-12-08', 1),
('Liam Brown', 'liam.brown@example.com', '2024-12-09', 2),
('Mia White', 'mia.white@example.com', '2024-12-10', 3),
('James Lee', 'james.lee@example.com', '2024-12-11', 1),
('Ava Walker', 'ava.walker@example.com', '2024-12-12', 2),
('Benjamin Adams', 'benjamin.adams@example.com', '2024-12-13', 3),
('Grace Harris', 'grace.harris@example.com', '2024-12-14', 1),
('Lucas Carter', 'lucas.carter@example.com', '2024-12-15', 2),
('Charlotte Scott', 'charlotte.scott@example.com', '2024-12-16', 3),
('Henry Davis', 'henry.davis@example.com', '2024-12-17', 1),
('Ella Nelson', 'ella.nelson@example.com', '2024-12-18', 2),
('William King', 'william.king@example.com', '2024-12-19', 3),
('Zoe Wright', 'zoe.wright@example.com', '2024-12-20', 1),
('Sebastian Hall', 'sebastian.hall@example.com', '2024-12-21', 2),
('Oliver Young', 'oliver.young@example.com', '2024-12-22', 3),
('Chloe Lewis', 'chloe.lewis@example.com', '2024-12-23', 1);

-- Table: subscriptions
CREATE TABLE subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_type VARCHAR(20),
    start_date DATE,
    end_date DATE
);



-- Déchargement des données de la table `subscriptions`
--

INSERT INTO subscriptions (subscription_type, start_date, end_date) VALUES
('Basic', '2024-01-01', '2025-01-01'),
('Premium', '2024-06-01', '2025-06-01'),
('VIP', '2024-09-15', '2025-09-15');





-- Table: video_games
CREATE TABLE video_games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    development_studio VARCHAR(100),
    release_date DATE,
    multiplayer ENUM('YES', 'NO'),
    genre varchar(50)
);



-- Déchargement des données de la table `video_games`
--

INSERT INTO video_games (title, development_studio, release_date, multiplayer) VALUES
('Battlefield 2042', 'DICE', '2021-11-19', 'YES'),
('Minecraft', 'Mojang', '2011-11-18', 'YES'),
('The Legend of Zelda: Tears of the Kingdom', 'Nintendo', '2023-05-12', 'NO'),
('Cyberpunk 2077', 'CD Projekt Red', '2020-12-10', 'YES'),
('Halo Infinite', '343 Industries', '2021-11-15', 'YES', 'Shooter'),
('Minecraft Dungeons', 'Mojang Studios', '2020-05-26', 'YES', 'Action RPG'),
('Red Dead Redemption 2', 'Rockstar Games', '2018-10-26', 'YES', 'Action'),
('Among Us', 'InnerSloth', '2018-06-15', 'YES', 'Party'),
('FIFA 23', 'EA Sports', '2022-09-30', 'YES', 'Sports'),
('Call of Duty: Modern Warfare 2', 'Infinity Ward', '2022-10-28', 'YES', 'Shooter'),
('Genshin Impact', 'miHoYo', '2020-09-28', 'YES', 'Action RPG'),
('Apex Legends', 'Respawn Entertainment', '2019-02-04', 'YES', 'Battle Royale'),
('League of Legends', 'Riot Games', '2009-10-27', 'YES', 'MOBA'),
('Fortnite', 'Epic Games', '2017-07-25', 'YES', 'Battle Royale'),
('Valorant', 'Riot Games', '2020-06-02', 'YES', 'Shooter'),
('Hades', 'Supergiant Games', '2020-09-17', 'NO', 'Action RPG');



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

INSERT INTO loans (id_member, game_id, loan_date, expected_return_date, actual_return_date) VALUES
( 1, 1, '2024-10-05', '2024-10-12', '2024-10-11'),
( 2, 3, '2024-07-15', '2024-08-15', '2024-08-14'),
( 4, 2, '2024-11-01', '2024-11-15', '2024-11-12'),
( 3, 4, '2024-09-18', '2024-09-25', '2024-09-24'),
(1, 2, '2024-12-01', '2024-12-10', '2024-12-09'),
(2, 4, '2024-12-02', '2024-12-11', '2024-12-10'),
(3, 1, '2024-12-03', '2024-12-12', '2024-12-11'),
(4, 6, '2024-12-04', '2024-12-13', '2024-12-12'),
(5, 5, '2024-12-05', '2024-12-14', '2024-12-13'),
(6, 3, '2024-12-06', '2024-12-15', '2024-12-14'),
(7, 8, '2024-12-07', '2024-12-16', '2024-12-15'),
(8, 7, '2024-12-08', '2024-12-17', '2024-12-16'),
(9, 9, '2024-12-09', '2024-12-18', '2024-12-17'),
(10, 10, '2024-12-10', '2024-12-19', '2024-12-18');


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

INSERT INTO tournaments (name, date_tournament, prizes, game_id) VALUES
('Battle Royale Showdown', '2024-12-20', 'Gold Trophy, $500', 1),
('Minecraft Build-Off', '2024-12-10', 'Minecraft Skins, $300', 2),
('Cyberpunk 2077 Races', '2024-12-18', 'Digital Artbook, $1000', 4),
('Battle Royale', '2024-12-20', 'Gold Trophy, $500', 1),
('Minecraft Build', '2024-12-10', 'Minecraft Skins, $300', 2),
('Cyberpunk 2077', '2024-12-18', 'Digital Artbook, $1000', 4),
('Halo Infinite Championship', '2024-12-25', 'Exclusive Skins, $1000', 1),
('FIFA 23 World Cup', '2024-12-28', 'Championship Trophy, $2000', 5),
('Apex Legends Battle Royale', '2024-12-30', 'Cash Prizes, Exclusive Skins', 8);


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

INSERT INTO tournament_participation (tournament_id, id_member, ranking) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 2),
(3, 1, 2),
(3, 4, 1),
(2, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 1, 1),
(6, 2, 3),
(7, 1, 4),
(8, 2, 5),
(9, 3, 1),
(7, 4, 2);