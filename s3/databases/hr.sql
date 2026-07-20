SELECT * FROM countries;

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM employees
WHERE LAST_NAME LIKE '%ne%';

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM employees
WHERE DEPARTMENT_ID IN (50, 60, 80)
AND SALARY > 6000;

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '01-JAN-05' AND '31-DEC-06';

SELECT FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80
ORDER BY LAST_NAME DESC;


SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, &COLUMN_NAME
FROM EMPLOYEES
WHERE &CONDITION
ORDER BY &ORDER_COLUMN;

SELECT employee_id, last_name, location_id, department_id
FROM employees JOIN departments
USING (department_id);

SELECT employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d
ON e.department_id=d.department_id;

SELECT employee_id, city, department_name
FROM employees e
JOIN departments d
ON d.department_id=e.department_id
JOIN locations l
ON d.location_id = l.location_id;

SELECT c.country_name, r.region_name
FROM countries c JOIN regions r
ON c.region_id = r.region_id;

SELECT d.department_name, avg(salary) Salary
FROM employees e
JOIN departments d
ON d.department_id=e.department_id
GROUP BY department_name;

SELECT e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN jobs j
ON e.job_id=j.job_id
GROUP BY 
HAVING e.salary>avg(salary);




