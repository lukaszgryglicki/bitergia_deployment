select username, count(id) as cnt from identities where username is not null and username != '' group by username order by cnt desc limit 10;
