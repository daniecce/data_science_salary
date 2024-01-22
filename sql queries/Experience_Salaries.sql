select 
    experience_level
    ,max(case when work_year = 2020 then average_salary end) as avg_salary_2020
    ,max(case when work_year = 2021 then average_salary end) as avg_salary_2021
    ,max(case when work_year = 2022 then average_salary end) as avg_salary_2022
    ,max(case when work_year = 2023 then average_salary end) as avg_salary_2023
from (
    select 
        experience_level
        ,work_year
        ,round(avg(salary_in_usd), 0) as average_salary
    from 
        jobs_in_data
    group by 
        experience_level, work_year
) as subquery
group by 
    experience_level
order by 
    experience_level
