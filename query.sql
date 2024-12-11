-- List all members' information (username, email, registration date).

SELECT name , email , join_date 
from members;

-- View the list of available games, with their title, genre, and development studio.

SELECT title , development_studio , genre 
FROM video_games;


-- Show details of a specific tournament from its name.

SELECT * FROM tournaments
WHERE tournaments.name = "Minecraft Build";


-- List current loans, including member's username and game title.

SELECT members.name, video_games.title , loans.id_member,loans.game_id,loans.loan_date,loans.expected_return_date,loans.actual_return_date
from loans
JOIN members on loans.id_member = members.id
JOIN video_games on loans.game_id = video_games.id;

-- List members who participated in a tournament, with their nickname, tournament name, and final rank.

SELECT members.name as members_name , tournaments.name as tournaments_name , tournament_participation.ranking
FROM tournament_participation
JOIN members on members.id = tournament_participation.id_member
JOIN tournaments on tournaments.id = tournament_participation.tournament_id;


-- Find members who have subscribed to an annual membership.


SELECT members.id , members.name , members.email, subscriptions.subscription_type
from members
JOIN subscriptions on members.subscription_id = subscriptions.id
WHERE subscriptions.subscription_type = "Annual";



-- Find games borrowed by a specific member (via their nickname).

SELECT  video_games.title , loans.loan_date , loans.expected_return_date , loans.actual_return_date
FROM loans
JOIN video_games on loans.game_id = video_games.id
JOIN members on members.id = loans.id_member 
WHERE members.name = "Jane Smith";


-- List all loans, including the member's username and game information (title and development studio).

SELECT members.name as username , video_games.title , video_games.development_studio
FROM loans
JOIN members on loans.id_member = members.id
JOIN video_games on loans.game_id = video_games.id;

-- View the list of members and the type of subscription they are associated with.

SELECT members.name ,members.email, members.join_date, subscriptions.subscription_type
FROM members
JOIN subscriptions on subscriptions.id = members.subscription_id;

-- Calculate the total number of games available by genre


SELECT genre, COUNT(*) as total_jeux
FROM video_games
GROUP BY 
genre;

--  Find the tournament with the highest number of participants







--  Display the number of borrows made by each member.

SELECT members.name , COUNT(loans.id)
FROM members
join loans on loans.id_member = members.id
GROUP by 
members.id , members.name