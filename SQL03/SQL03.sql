/*
문제 1. 
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
*/
select emp.employee_id as "사원",
       emp.first_name as "이름",
       dep.department_name as "부서명",
       mag.first_name as "매니저이름"
  from employees emp, departments dep, employees mag
 where emp.department_id = dep.department_id
   and emp.manager_id = mag.employee_id;

/*
문제2.
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.
//25개국
*/
  select cou.country_name as "나라이름",
         reg.region_name as "지역이름"
    from countries cou, regions reg
   where cou.region_id=reg.region_id
order by reg.region_name desc, cou.country_name desc;


/*
문제3.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
//11개
*/
  select dep.department_id as "부서번호",
         dep.department_name as "부서이름",
         emp.first_name as "매니저이름",
         loc.city as "위치한도시",
         cou.country_name as "나라",
         reg.region_name as "지역명"
    from departments dep,
         employees emp,
         locations loc,
         countries cou,
         regions reg
   where dep.manager_id = emp.employee_id
     and dep.location_id = loc.location_id
     and loc.country_id = cou.country_id
     and cou.region_id = reg.region_id
order by dep.department_id asc;



/*
문제4.
‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
(현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력합니다.
//2명
*/
select e.employee_id as "사번",
       e.first_name ||' '||e.last_name as "이름"
  from jobs j, job_history jh, employees e
 where j.job_id=jh.job_id
   and jh.employee_id = e.employee_id
   and job_title='Public Accountant';



/*
문제5.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서 이름을 조회하여 성(last_name)순서로 오름차순 정렬하세요
//106명
*/
  select e.employee_id as "사번",
         e.first_name as "이름",
         e.last_name as "성",
         d.department_name as "부서이름"
    from employees e, departments d
   where e.department_id=d.department_id
order by e.last_name asc;


/*
문제6.
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하세요 
*/
select e.employee_id, e.last_name, e.hire_date, m.last_name, m.hire_date
  from employees e, employees m
  where e.manager_id = m.employee_id
  and e.hire_date <  m.hire_date;

