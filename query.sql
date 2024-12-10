-- List all members' information (username, email, registration date).

SELECT name , email , join_date 
from members;

-- View the list of available games, with their title, genre, and development studio.

SELECT title , development_studio , genre 
FROM video_games;

-- Find members who have subscribed to an annual membership.


SELECT * 
FROM members
WHERE subscription_id IN (
    SELECT id 
    FROM subscriptions 
    WHERE subscription_type = "Annual"
);






--  View details of a specific tournament based on its name.

