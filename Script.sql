//HW_2_3(qa_ddl_31_152)
create table roles (
id  Serial  primary key,
role_name varchar(30) not null unique
);
insert into roles (role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');
select * from roles;
create table roles_employee(
 id Serial  primary key,
 employee_id Int  not null unique, 
role_id Int not null 
);
insert into roles_employee (employee_id,role_id)
values(2,20),(1,18),(5,3),(4,3),(3,1),(6,15),(7,12),(9,13),(8,3),(10,2),(11,1),(13,19),(14,16),(12,9),(15,8),(17,11),(16,7),(18,5),
(19,19),(20,4),(21,7),(22,17),(23,18),(24,11),(25,12),(26,13),(27,14),(28,16),(29,6),(30,1),(31,8),(32,4),(33,5),(34,20),(35,1),(36,2),
(37,9),(38,12);


//1.Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами
select employee_name, monthly_salary from employees
inner join employee_salary on  employees.id = employee_salary.employee_id
inner join salary on employee_salary.salary_id =  salary.id;
//2.Вывести всех работников у которых ЗП меньше 2000
select employee_name, monthly_salary from employees
inner join employee_salary on  employees.id = employee_salary.employee_id
inner join salary on employee_salary.salary_id =  salary.id
where  monthly_salary < 2000;
//3. Вывести все зарплатные позиции, но работник по ним не назначен.
select  monthly_salary, employee_name from salary 
left join employee_salary   on   salary.id = employee_salary.salary_id 
left join employees   on employee_salary.employee_id  =  employees.id
where employee_name is null
;
//4.Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. 
select  monthly_salary, employee_name from salary 
left join employee_salary   on   salary.id = employee_salary.salary_id 
left join employees   on employee_salary.employee_id  =  employees.id
where employee_name is null and monthly_salary < 2000
;
//5.Найти всех работников кому не начислена ЗП
select employee_name, monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where monthly_salary is null;
//6.Вывести всех работников с названиями их должности
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
;
//7.Вывести имена и должность только Java разработчиков.
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Java %';
//8.Вывести имена и должность только Python разработчиков
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Python %';
//9. Вывести имена и должность всех QA инженеров
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% QA %';
//10.Вывести имена и должность ручных QA инженеров
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Manual QA %';
//11.Вывести имена и должность автоматизаторов QA 
select employee_name, role_name  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Automation QA %';
//12. Вывести имена и зарплаты Junior специалистов
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Junior %');
//13.Вывести имена и зарплаты Middle специалистов 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Middle %');
//14.. Вывести имена и зарплаты Senior специалистов 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Senior %');
//15.Вывести зарплаты Java разработчиков
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Java %');
//16. Вывести зарплаты Python разработчиков 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% Python %');
//17.  Вывести имена и зарплаты Junior Python разработчиков 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Junior Python %');
//18.Вывести имена и зарплаты Middle JS разработчиков 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Middle JavaScript %');
//19.Вывести имена и зарплаты Senior Java разработчиков 
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Senior Java %');
//20.Вывести зарплаты Junior QA инженеров
select employee_name,  monthly_salary from employees
left join employee_salary on  employees.id = employee_salary.employee_id
left  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Junior % QA %');
//21.Вывести среднюю зарплату всех Junior специалистов 
select avg(  monthly_salary) from employees
 join employee_salary on  employees.id = employee_salary.employee_id
  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like 'Junior %');
//22. Вывести сумму зарплат JS разработчиков 
select sum(  monthly_salary) from employees
 join employee_salary on  employees.id = employee_salary.employee_id
  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% JavaScript %');
//23.Вывести минимальную ЗП QA инженеров 
select min(  monthly_salary) from employees
 join employee_salary on  employees.id = employee_salary.employee_id
  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% QA %');
//24.Вывести максимальную ЗП QA инженеров 
select max (  monthly_salary) from employees
 join employee_salary on  employees.id = employee_salary.employee_id
  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% QA %');
//25.Вывести количество QA инженеров 
select  count(role_name)  from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% QA %';
//26.Вывести количество Middle специалистов
select  count(role_name)  from employees
 join roles_employee  on  employees.id = roles_employee.employee_id
 join roles  on roles_employee.role_id = roles.id
where role_name like 'Middle %';
//27.Вывести количество разработчиков 
select  count(role_name)  from employees
 join roles_employee  on  employees.id = roles_employee.employee_id
 join roles  on roles_employee.role_id = roles.id
where role_name like '% developer';
//28.. Вывести фонд (сумму) зарплаты разработчиков
select sum(  monthly_salary) from employees
 join employee_salary on  employees.id = employee_salary.employee_id
  join salary on employee_salary.salary_id =  salary.id
where employee_name in(
select employee_name from employees
left join roles_employee  on  employees.id = roles_employee.employee_id
left  join roles  on roles_employee.role_id = roles.id
where role_name like '% developer')
//29. . Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name , role_name, monthly_salary from salary
 right join employee_salary on  salary.id = employee_salary.salary_id
  right  join employees  on employee_salary.employee_id = employees.id
 left join roles_employee on employees.id = roles_employee.employee_id
 left  join roles on roles_employee.role_id = roles.id 
order by 3;
//30.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300 
select employee_name , role_name, monthly_salary from salary
 right join employee_salary on  salary.id = employee_salary.salary_id
  right  join employees  on employee_salary.employee_id = employees.id
 left join roles_employee on employees.id = roles_employee.employee_id
 left  join roles on roles_employee.role_id = roles.id 
 where monthly_salary between 1700 and 3000
order by 3;

 //31.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300 
 select employee_name , role_name, monthly_salary from salary
 right join employee_salary on  salary.id = employee_salary.salary_id
  right  join employees  on employee_salary.employee_id = employees.id
 left join roles_employee on employees.id = roles_employee.employee_id
 left  join roles on roles_employee.role_id = roles.id 
 where monthly_salary  < 2300
order by 3;
//32.Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name , role_name, monthly_salary from salary
 right join employee_salary on  salary.id = employee_salary.salary_id
  right  join employees  on employee_salary.employee_id = employees.id
 left join roles_employee on employees.id = roles_employee.employee_id
 left  join roles on roles_employee.role_id = roles.id 
 where monthly_salary=1100  or monthly_salary=1500 or monthly_salary=2000
order by 3;
 