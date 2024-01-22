select 	
	job_title 
	,round(avg(salary_in_usd),0)
from jobs_in_data 
group by 1
order by 2 desc
limit 10
