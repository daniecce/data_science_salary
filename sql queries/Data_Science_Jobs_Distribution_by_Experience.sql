
with 
total_jobs	as 
(
select 
	count(experience_level)							as total_jobs
from jobs_in_data 
),
nr_of_jobs_experience as
(
select
	experience_level
	,count(*)										as nr_of_jobs
from jobs_in_data 
group by 1
)
select 
	nof.experience_level
	,round(nof.nr_of_jobs/tj.total_jobs * 100, 2)	as job_ratio	
from nr_of_jobs_experience	nof
join total_jobs 			tj
order by 2 desc
