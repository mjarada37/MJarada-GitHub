-- What are the Top 25 shcools (edu. domains)?

SELECT * from users
limit 25;

-- How many .edu learners are located in New York?

SELECT count(user_id) from users
WHERE email_domain like '%.edu' AND city = 'New York';

-- The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?
SELECT count(user_id) from users
WHERE mobile_app = 'mobile-user';

-- Query for the sign up counts for each hour.

SELECT count(sign_up_at),
   strftime('%H', sign_up_at)
FROM users
GROUP BY 2;

-- Do different schools (.edu domains) prefer different courses?

SELECT email_domain, learn_cpp,learn_html,learn_java,learn_javascript,learn_sql from users
JOIN progress on users.user_id = progress.user_id
GROUP by 1;

-- What courses are the New Yorkers students taking?
SELECT email_domain, city, learn_cpp,learn_html,learn_java,learn_javascript,learn_sql from users
JOIN progress on users.user_id = progress.user_id
WHERE city = 'New York'
GROUP by 1;

-- What courses are the Chicago students taking?

SELECT email_domain, city, learn_cpp,learn_html,learn_java,learn_javascript,learn_sql from users
JOIN progress on users.user_id = progress.user_id
WHERE city = 'Chicago'
GROUP by 1;