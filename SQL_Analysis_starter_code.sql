-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT SUM(backers_count) as backers_count,
cf_id
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY cf_id DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(backers_count) as backers_count,
cf_id
FROM campaign
WHERE outcome = 'live'
GROUP BY cf_id
ORDER BY cf_id DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
DROP TABLE IF EXISTS email_contacts_remaining_goal_amount;

SELECT b.first_name,
b.last_name,
b.email,
c.goal - c.pledged AS amount_left
into email_contacts_remaining_goal_amount 
FROM backers as b
LEFT JOIN campaign AS c
	ON b.cf_id = c.cf_id
WHERE c.outcome = 'live'
ORDER BY amount_left DESC;

-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

DROP TABLE IF EXISTS email_backers_remaining_goal_amount;

SELECT b.first_name,
b.last_name,
b.email,
c.description,
c.end_date,
c.goal - c.pledged AS Left_of_Goal
into email_backers_remaining_goal_amount 
FROM backers as b
LEFT JOIN campaign AS c
	ON b.cf_id = c.cf_id
ORDER BY Left_of_Goal DESC;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount;


