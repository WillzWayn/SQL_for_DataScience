/* In facebook, there is a follow table with two columns:
followee, follower.
Please write a sql query to get the amount of each follower’s 
follower if he/she has one.
*/

select count(follower),followee
from follow
where followee in (select distinct follower from follow)
group by followee