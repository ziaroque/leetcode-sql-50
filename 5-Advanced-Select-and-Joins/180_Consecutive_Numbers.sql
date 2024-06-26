-- Source: https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.

------------------------------------------------------------------------------

-- SQL Schema

Create table If Not Exists Logs (id int, num int)
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')

-- MS SQL Server Code

SELECT DISTINCT l.num AS 'ConsecutiveNums'
FROM (
    SELECT  id,
            LAG(id, 2) OVER(ORDER BY id) AS id3,
            num,
            LAG(num, 1) OVER(ORDER BY id) AS num2,
            LAG(num, 2) OVER(ORDER BY id) AS num3
    FROM Logs
) AS l
WHERE   l.num = l.num2
    AND l.num = l.num3
    AND id - 2 = id3;
