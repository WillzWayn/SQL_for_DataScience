/*
Write a query to print the sum of all total investment values in 2016 
(TIV_2016), to a scale of 2 decimal places, for all policy holders who
meet the following criteria:

Have the same TIV_2015 value as one or more other policyholders.
Are not located in the same city as any other policyholder 
(i.e.: the (latitude, longitude) attribute pairs must be unique).

Input Format:
The insurance table is described as follows:
where PID is the policyholder’s policy ID, TIV_2015 is the total 
investment value in 2015, TIV_2016 is the total investment value in 2016,
LAT is the latitude of the policy holder’s city, and LON is the longitude
of the policy holder’s city.

select DISTINCT t1.PID, t1.TIV_2015, t1.TIV_2016, t1.LAT, t1.LON
from insurance t1, insurance t2
where t1.TIV_2015 = t2.TIV_2015 AND 
(t1.PID, t1.LAT, t1.LON) IN (SELECT DISTINCT PID, LAT, LON FROM insurance) 
ORDER BY PID
*/
select sum(d1.TIV_2015) 
from
(
	SELECT distinct t1.PID, 
		t1.TIV_2015
  	FROM insurance t1, insurance t2
  	where t1.TIV_2015 = t2.TIV_2015 AND
    t1.PID != t2.PID AND
  	t1.PID NOT IN
	(
    	SELECT p1.PID
     	FROM insurance p1, insurance p2
     	where p1.LAT=p2.LAT AND
     	p2.LON=p2.LON AND
     	p1.PID != p2.PID
    )

) d1