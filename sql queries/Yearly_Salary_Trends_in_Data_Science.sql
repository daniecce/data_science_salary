with avg_salary as (
    select 
        work_year,
        round(avg(salary_in_usd), 0) as average_of_salary
    from 
        jobs_in_data
    group by 
        work_year
),
median_salary as (
    select 
        work_year
        ,avg(salary_in_usd) as median
    from (
        select 
            work_year
            ,salary_in_usd
            ,row_number() over (partition by work_year order by salary_in_usd) as rownum
            ,count(*) over (partition by work_year) as total_rows
        from 
            jobs_in_data
    ) as sorted
    where 
        rownum = ceil(total_rows / 2) or rownum = ceil(total_rows / 2) + 1
    group by 
        work_year
)
select 
    all_years.work_year
    ,avs.average_of_salary
    ,ms.median
from (
    select distinct work_year from jobs_in_data
) as all_years
left join 
    avg_salary avs on all_years.work_year = avs.work_year
left join 
    median_salary ms on all_years.work_year = ms.work_year
order by all_years.work_year
