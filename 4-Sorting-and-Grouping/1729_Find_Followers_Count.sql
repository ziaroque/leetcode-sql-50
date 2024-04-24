-- Source: https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Followers

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |
-- | follower_id | int  |
-- +-------------+------+
-- (user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the IDs of a user and a follower in a social media app where the follower follows the user.

-- Write a solution that will, for each user, return the number of followers.

-- Return the result table ordered by user_id in ascending order.

------------------------------------------------------------------------------

-- SQL Schema

Create table If Not Exists Followers(user_id int, follower_id int)
Truncate table Followers
insert into Followers (user_id, follower_id) values ('0', '1')
insert into Followers (user_id, follower_id) values ('1', '0')
insert into Followers (user_id, follower_id) values ('2', '0')
insert into Followers (user_id, follower_id) values ('2', '1')

-- MS SQL Server Code

SELECT user_id, COUNT(DISTINCT follower_ID) AS 'followers_count'
FROM followers
GROUP BY user_id
ORDER BY user_id
