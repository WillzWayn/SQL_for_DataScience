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
WHERE weight >= 300
GROUP BY 2
ORDER BY 2; 


/*
Write a query that calculates the combined weight of all underclass players (FR/SO) in California
as well as the combined weight of all upperclass players (JR/SR) in California.
*/


SELECT CASE
           WHEN year IN ('FR', 'SO') THEN 'Underclass'
           WHEN year IN ('JR', 'SR') THEN 'Upperclass'
           ELSE NULL END AS class,
           SUM(weight) as combined_weight
FROM benn.college_football_players
WHERE state = 'CA'
GROUP BY 1;



/*
Write a query that displays the number of players in each state, with FR, SO, JR, and SR players 
in separate columns and another column for the total number of players.
Order results such that states with the most players come first.
*/

SELECT  state,
        COUNT(CASE WHEN year = 'FR' THEN 'FR' ELSE NULL END) as freshmen_count,
        COUNT(CASE WHEN year = 'SO' THEN 'SO' ELSE NULL END) as sophomore_count,
        COUNT(CASE WHEN year = 'JR' THEN 'JR' ELSE NULL END) as junior_count,
        COUNT(CASE WHEN year = 'SR' THEN 'SR' ELSE NULL END) as senior_count,
        COUNT(1) as total_players
FROM benn.college_football_players
GROUP BY state
ORDER BY total_players DESC ;

