
	# 1.List each country name where the population is larger than that of 'Russia'.

	select name
	from world
	where population > (select population
	                    from world
	                    where name = 'Russia') ;

	# 2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'
	select name
	from world
	where  gdp/population > (select gdp/population
	                        from world
	                        where name = 'United Kingdom') 
	and continent = 'Europe' ;


	#3. List the name and continent of countries in the continents containing either Argentina or Australia.
	#   Order by name of the country.

	select name, continent
	from world
	where continent in (select continent
	from world
	where name in ('Argentina', 'Australia'))
	order by name;

	# 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
	select name, population
	from world 
	where population > (select population
	                    from world
	                    where name = 'Canada') 
	and 
	population < (select population
		          from world
		          where name = 'Poland');


	#5.Germany (population 80 million) has the largest population of the countries in Europe.
	# Austria (population 8.5 million) has 11% of the population of Germany.
	# Show the name and the population of each country in Europe.
	# Show the population as a percentage of the population of Germany.
	select name, concat(round(100*population/(select population
	                                          from world
	                                          where name = 'Germany' )), '%')
	from world
	where continent = 'Europe';


	#7.Find the largest country (by area) in each continent, show the continent, the name and the area:

	SELECT continent, name, area
	from world
	where area in (SELECT MAX(area) 
	                        FROM world 
	                        GROUP BY continent);

	#8. List each continent and the name of the country that comes first alphabetically.
	select continent, min(name)
	from world
	group by continent
	order by 1,2


	# 9. Find the continents where all countries have a population <= 25000000.
	# Then find the names of the countries associated with these continents. Show name, continent and population.

	select name, continent, population
	from world
	where 
	continent in (select t3.c1
	                      from
	                              (select *
	                               from 
	                                       (select count(*) as total_count,
	                                        continent as c1
	                                        from world 
	                                        group by c1) t1
	                                        join
	                                        (select count(*) cond_count,
	                                        continent as c2
	                                        from world  
	                                        where population <= 25000000
	                                        group by c2 ) t2
	                                        on t1.c1 = t2.c2) as t3
	                      where t3.total_count = t3.cond_count) 

	








