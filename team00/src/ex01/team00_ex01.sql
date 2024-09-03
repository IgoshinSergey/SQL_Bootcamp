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
order by 1,2;