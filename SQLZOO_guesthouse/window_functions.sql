SELECT *
FROM
SELECT DATENAME(
                year, sub.date::timestamp),
       sub.day_of_week,
       AVG(sub.incidents) AS average_incidents
FROM
  ( SELECT day_of_week, date, COUNT(incidnt_num) AS incidents
   FROM tutorial.sf_crime_incidents_2014_01
   GROUP BY 1,
            2 ) sub
GROUP BY 1,
         2
ORDER BY 1,
         2

 /*
Write a query modification of the above example query that shows the duration of each ride as a percentage
of the total time accrued by riders from each start_terminal
*/

SELECT  start_terminal,
        SUM(duration_seconds) OVER(PARTITION BY start_terminal) as total_time,
        (duration_seconds/SUM(duration_seconds) OVER(partition by start_terminal))*100 as pcnt_total_time
FROM tutorial.dc_bikeshare_q1_2012;

/*
Write a query that shows a running total of the duration of bike rides (similar to the last example),
but grouped by end_terminal, and with ride duration sorted in descending order.
*/


SELECT end_terminal,
       duration_seconds,
       SUM(duration_seconds) OVER(PARTITION BY end_terminal ORDER BY duration_seconds DESC) as total_duration 
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08'



/*
Write a query that shows the 5 longest rides from each starting terminal, ordered by terminal,
and longest to shortest rides within each terminal. Limit to rides that occurred before Jan. 8, 2012.
*/

SELECT t.top_5,
       start_terminal,
       duration_seconds        
FROM
(SELECT start_terminal,
       duration_seconds,
       RANK() OVER(PARTITION BY start_terminal ORDER BY duration_seconds DESC ) as top_5
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08') t
WHERE t.top_5 <= 5








