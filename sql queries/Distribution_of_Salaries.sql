select 
    salary_range
    ,count(*) as qty
from (
    select 
        case 
            when salary_in_usd between 15000 and 35000 then '15000-35000'
            when salary_in_usd between 35001 and 55000 then '35001-55000'
            when salary_in_usd between 55001 and 75000 then '55001-75000'
            when salary_in_usd between 75001 and 95000 then '75001-95000'
            when salary_in_usd between 95001 and 115000 then '95001-115000'
            when salary_in_usd between 115001 and 135000 then '115001-135000'
            when salary_in_usd between 135001 and 155000 then '135001-155000'
            when salary_in_usd between 155001 and 175000 then '155001-175000'
            when salary_in_usd between 175001 and 195000 then '175001-195000'
            when salary_in_usd between 195001 and 215000 then '195001-215000'
            when salary_in_usd between 215001 and 235000 then '215001-235000'
            when salary_in_usd between 235001 and 255000 then '235001-255000'
            when salary_in_usd between 255001 and 275000 then '255001-275000'
            when salary_in_usd between 275001 and 295000 then '275001-295000'
            when salary_in_usd between 295001 and 315000 then '295001-315000'
            when salary_in_usd between 315001 and 335000 then '315001-335000'
            when salary_in_usd between 335001 and 355000 then '335001-355000'
            when salary_in_usd between 355001 and 375000 then '355001-375000'
            when salary_in_usd between 375001 and 395000 then '375001-395000'
            when salary_in_usd between 395001 and 415000 then '395001-415000'
            when salary_in_usd between 415001 and 435000 then '415001-435000'
            when salary_in_usd between 435001 and 450000 then '435001-450000'
            else 'Others'
        end salary_range
    from jobs_in_data
) as salary_ranges
group by 1
