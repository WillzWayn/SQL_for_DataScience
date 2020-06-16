SELECT t1.score, IFNULL(COUNT(DISTINCT t2.score), 1) `rank`
FROM scores t1 LEFT JOIN scores t2 ON t1.score <= t2.score
GROUP BY t1.id, t1.score
ORDER BY t1.score DESC;
