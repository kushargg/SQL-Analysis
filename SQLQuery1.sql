--CREATE DATABASE EMPLOYEE
SELECT * FROM dbo.employee_attrition_test
--1 write an SQL query to find the details of employees under attrition having 5+ years of experience in between the age group of  27-35
select count(*)
select *
 FROM dbo.employee_attrition_test
 where age between 27 and 35
 and TotalWorkingYears > 5;
 --2 Fetch the details of emloyees having maximum and minimum salary working in different departments who received less than 13% salary hike
 select*
 from dbo.employee_attrition_test
   where percentsalaryhike < 13
   group by JobRole;
 
 
 
 select department,
 max (MonthlyIncome),
 min (MonthlyIncome)
  from dbo.employee_attrition_test
  where percentsalaryhike < 13
  group by department
  order by max (MonthlyIncome) desc;

 --3n Calculate the average monthly income of all the employees who worked more than 3 years whose education  background is medical
 select avg  (MonthlyIncome)
 from dbo.employee_attrition_test
 where YearsAtCompany > 3
 and EducationField = 'Medical'
 group by EducationField;

 select avg  (MonthlyIncome)
 from dbo.employee_attrition_test
 where YearsAtCompany > 3
 and EducationField = 'Medical';

 --4 Identify the total no of male and female employees under attrition whose martial status is married  and  haven't received promotion in the last 2 years
 select Gender, count(EmployeeNumber)
 from dbo.employee_attrition_test
where  MaritalStatus = 'Married'
 and YearsSinceLastPromotion = 2
 group by Gender;

 --5 employees with max  performance rating but no promotion for 4 years  and above
 select max(PerformanceRating)
 from dbo.employee_attrition_test
 
 
 select*
 from dbo.employee_attrition_test
 where PerformanceRating = (select max(PerformanceRating) from dbo.employee_attrition_test)
 and YearsSinceLastPromotion >= 4;
 ---6  Who max and min percentage salary hike
 select PerformanceRating, OverTime,
      max (PercentSalaryHike),
	  min  (PercentSalaryHike)
	  from dbo.employee_attrition_test
	  group by PerformanceRating, OverTime
	  order by  max (PercentSalaryHike) desc,  min (PercentSalaryHike) asc;

	  --- 7 employees working overtime but given min salary hike and are more than 5 yrs with company 
	  select *
	  from dbo.employee_attrition_test
	  where OverTime ='1'
	  and PercentSalaryHike = (select min(PercentSalaryHike) From dbo.employee_attrition_test)
	  and YearsAtCompany > 5;
	
	select *
from dbo.employee_attrition_test
where OverTime = '0'
and PercentSalaryHike = (select max(PercentSalaryHike) from dbo.employee_attrition_test)
and YearsAtCompany < 5;

select MaritalStatus,max (RelationshipSatisfaction),min (RelationshipSatisfaction)
from dbo.employee_attrition_test
group by MaritalStatus;