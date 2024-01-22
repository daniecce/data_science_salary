select	
	job_title 
	,count(*)
from jobs_in_data 
group by 1
order by 2 desc 
limit 10
