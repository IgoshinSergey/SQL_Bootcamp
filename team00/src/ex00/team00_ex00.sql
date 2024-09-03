drop table if exists city_distance;

create table city_distance
(   point1 varchar,
    point2 varchar,
    cost integer
    );

insert into city_distance values ('a','b',10);
insert into city_distance values ('b','a',10);
insert into city_distance values ('b','c',35);
insert into city_distance values ('c','b',35);
insert into city_distance values ('c','a',15);
insert into city_distance values ('a','c',15);
insert into city_distance values ('c','d',30);
insert into city_distance values ('d','c',30);
insert into city_distance values ('a','d',20);
insert into city_distance values ('d','a',20);
insert into city_distance values ('b','d',25);
insert into city_distance values ('d','b',25);

select * from city_distance;

with recursive a_traces as (
    select point1 as tour, point1, point2, cost, cost as summ
    from city_distance
    where point1 = 'a'
    union all
    select
            parrent.tour || ',' || child.point1 as trace,
            child.point1,
            child.point2,
            child.cost,
            parrent.summ + child.cost as summ
    from city_distance as child
        join a_traces as parrent on child.point1 = parrent.point2
    where tour not like '%' || child.point1 || '%'
),
    filter as (select summ as total_cost, concat('{', CAST(tour AS text), ',', CAST(a.point2 AS text), '}') as tour
from a_traces a
where length(tour) = 7 and point2 = 'a')

select * from filter f
where f.total_cost = (select min(f.total_cost) from filter f)
order by 1,2;