select email, count(id) as cnt from identities where email is not null and email != '' group by email order by cnt desc limit 10;
