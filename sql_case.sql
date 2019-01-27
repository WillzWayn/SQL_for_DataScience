/*
Write a query that counts the number of 300lb+ players for each of the following regions: 
West Coast (CA, OR, WA), Texas, and Other (Everywhere else).
*/

SELECT count(*),
       CASE WHEN state = 'CA' THEN 'California West Coast'
            WHEN state = 'OR' THEN 'Oregon West Coast'
            WHEN state = 'WA' THEN 'Washington West Coast'
       ELSE 'Other' END AS State_wise_dist
FROM benn.college_football_players
WHERE weight > 300
GROUP BY 2
ORDER BY 2; 
