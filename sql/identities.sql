select
  u.uuid,
  count(distinct i.id) as cnt
from
  uidentities u,
  identities i
where
  u.uuid = i.uuid
group by
  u.uuid
order by
  cnt desc
limit
  10
;
