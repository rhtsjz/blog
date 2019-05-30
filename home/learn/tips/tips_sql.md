## 跨表更新 
#### PostgreSQL
```
UPDATE
    animal_attribute_values aav
SET
    animal_attribute_value_name = 'Some new value'
FROM animals aa
WHERE aa.animal_id = 458
AND aa.animal_attrib_value_id = aav.animal_attrib_value_id;

UPDATE "Likes_copy" l1
SET "likedUserId" = d1."UserId"
FROM
	"Drawings" d1
WHERE
	l1."DrawingId" = d1."id";
```

参考: [Postgres update with an inner join across 2 tables?](http://www.cnblogs.com/jndream/archive/2012/03/20/2407955.html)

#### MySQL
```
UPDATE T1, T2
SET T1.c2 = T2.c2,
      T2.c3 = expr
WHERE T1.c1 = T2.c1 AND condition;

UPDATE T1,T2
INNER JOIN T2 ON T1.C1 = T2.C1
SET T1.C2 = T2.C2,
      T2.C3 = expr
WHERE condition;
```
参考: [MySQL UPDATE JOIN](http://www.mysqltutorial.org/mysql-update-join/)


## 有子查询的跨表更新

#### PostgreSQL
```
UPDATE table1
SET
    col1 = subquery.min_value,
    col2 = subquery.max_value
FROM
(

    SELECT
        1001 AS col4,
        MIN (ship_charge) AS min_value,
        MAX (ship_charge) AS max_value
    FROM orders
) AS subquery
WHERE table1.col4 = subquery.col4
```

参考: [PostgreSQL - Using a Subquery to Update Multiple Column Values](http://stackoverflow.com/questions/7460102/postgresql-using-a-subquery-to-update-multiple-column-values/7460264#7460264)


#### MySQL
```
Update

  Competition as C
  inner join (
    select CompetitionId, count(*) as NumberOfTeams
    from PicksPoints as p
    where UserCompetitionID is not NULL
    group by CompetitionID
  ) as A on C.CompetitionID = A.CompetitionID
set C.NumberOfTeams = A.NumberOfTeams;
```
参考: [mysql update query with sub query](http://stackoverflow.com/questions/11588710/mysql-update-query-with-sub-query)
