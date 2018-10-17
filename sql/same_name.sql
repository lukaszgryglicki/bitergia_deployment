select name, count(id) as cnt from identities where name is not null and name != '' group by name order by cnt desc limit 10;
