with 
total_jobs	as 
(
select 
	count(work_setting)											as total_jobs
from jobs_in_data
),
nr_of_work_models as 
(
select
	work_setting
	,count(*)													as nr_of_work_models	
from jobs_in_data
group by 1
)
select 
	nowm.work_setting											as work_model
	,round(nowm.nr_of_work_models/js.total_jobs * 100, 2)		as work_model_ratio
from nr_of_work_models nowm
join total_jobs			js
order by 2 desc

