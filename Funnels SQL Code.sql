-- Users will “give up” at different points in the survey. Let’s analyze how many users move from Question 1 to Question 2, etc.

SELECT question, count(distinct user_id)
FROM survey
GROUP by 1
ORDER by 1;

-- Let's combine the three tables: quiz, home_try_on and purhcase.

SELECT *
FROM quiz AS q
LEFT JOIN home_try_on AS h on h.user_id = q.user_id
LEFT JOIN purchase AS p on p.user_id = h.user_id
LIMIT 10;

-- Let's add two columns (is_home_try_on)and (is_purhcase). We use this to identify which users didnt home try on or purchase.

SELECT DISTINCT q.user_id
      ,h.user_id IS NOT NULL AS 'is_home_try_on'
      ,h.number_of_pairs
      ,p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
      on h.user_id = q.user_id
LEFT JOIN purchase AS p
      on p.user_id = h.user_id
limit 10;

-- Lets' see how many people tried 3 pairs vs 5 pairs

WITH funnels AS (SELECT DISTINCT q.user_id
      ,h.user_id IS NOT NULL AS 'is_home_try_on'
      ,h.number_of_pairs
      ,p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
      on h.user_id = q.user_id
LEFT JOIN purchase AS p
      on p.user_id = h.user_id)
select number_of_pairs, count(user_id) AS 'NUMBER OF CUSTOMERS'
from funnels
where number_of_pairs IS NOT NULL
group by 1;


-- Let's calculate the difference in purchase rates between customers who had 3 number_of_pairs with ones who had 5.

with funnels AS (SELECT DISTINCT q.user_id
      ,h.user_id IS NOT NULL AS 'is_home_try_on'
      ,h.number_of_pairs
      ,p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS q
LEFT JOIN home_try_on AS h
      on h.user_id = q.user_id
LEFT JOIN purchase AS p
      on p.user_id = h.user_id)
select number_of_pairs, count(user_id)
from funnels
where is_purchase = 1
group by 1;