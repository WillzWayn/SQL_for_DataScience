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

