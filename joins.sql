/*
 Write a query that counts the number of companies acquired within 3 years, 5 years, and 10 years of being 
 founded (in 3 separate columns). Include a column for total companies acquired as well.
 Group by category and limit to only rows with a founding date.
*/


 SELECT companies.category_code,
       COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '3 years'
                       THEN 1 ELSE NULL END) AS acquired_3_yrs,
       COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '5 years'
                       THEN 1 ELSE NULL END) AS acquired_5_yrs,
       COUNT(CASE WHEN acquisitions.acquired_at_cleaned <= companies.founded_at_clean::timestamp + INTERVAL '10 years'
                       THEN 1 ELSE NULL END) AS acquired_10_yrs,
       COUNT(1) AS total
  FROM tutorial.crunchbase_companies_clean_date companies
  JOIN tutorial.crunchbase_acquisitions_clean_date acquisitions
    ON acquisitions.company_permalink = companies.permalink
 WHERE founded_at_clean IS NOT NULL
 GROUP BY 1
 ORDER BY 5 DESC



SELECT *
FROM
SELECT LEFT(sub.date, 2),
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