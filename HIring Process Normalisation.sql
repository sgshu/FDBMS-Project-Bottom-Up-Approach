drop drop database if exists amazon_hiring;
create database amazon_hiring ;
use amazon_hiring;


drop table applicant_details;
create table applicant_details (
				email varchar (30) check (email like '%_@__%.__%') primary key,
				name varchar(30) not null,
				phn_no bigint(10) not null,
				dob date not null,
				linkdIn varchar(100) not null,
				10th_score float(2) not null,
				12th_score float(2) not null,
				highest_qualf varchar(20) not null,
				CGPA_q float(2) not null
				);
create index name on applicant_details(name);
create index phn_no on applicant_details(phn_no);
create index dob on applicant_details(dob);
create index linkdIn on applicant_details(linkdIn);
create index 10th_score on applicant_details(10th_score);
create index 12th_score on applicant_details(12th_score);
create index highest_qualf on applicant_details(highest_qualf);
create index CGPA_q on applicant_details(CGPA_q);

insert into applicant_details values ("025015@fsm.ac.in" ,"Ekansh Vashistha" , 9876543210 ,"1998-11-06" ,"www.linkdin.com/in/ekanshvashistha" , 9.8 , 82.4,"PGDM",9.5);

select * from applicant_details;
/*
| email            | name             | phn_no     | dob        | linkdIn                            | 10th_score | 12th_score | highest_qualf | CGPA_q |
+------------------+------------------+------------+------------+------------------------------------+------------+------------+---------------+--------+
| 025015@fsm.ac.in | Ekansh Vashistha | 9876543210 | 1998-11-06 | www.linkdin.com/in/ekanshvashistha |        9.8 |       82.4 | PGDM          |    9.5 |
*/
create table job_details (
			job_id varchar(7) primary key,
			role_pref varchar(50) not null,
			job_position varchar(50) not null,
			location_pref1 varchar(10) not null,
			location_pref2 varchar(10),
			location_pref3 varchar(10),
			location_pref4 varchar(10),
			job_platform  varchar(30) not null
			);
create index role_pref on job_details(role_pref);
create index job_position on job_details(job_position);
create index location_pref1 on job_details(location_pref1);
create index location_pref2 on job_details(location_pref2);
create index location_pref3 on job_details(location_pref3);
create index location_pref4 on job_details(location_pref4);
create index job_platform on job_details(job_platform);

			
insert into job_details values ('112328','Product Analysts','Operation Engineer','New Delhi','NYC',' ',' ','Monster Jobs');

select * from job_details;

/*
| job_id | role_pref        | job_position       | location_pref1 | location_pref2 | location_pref3 | location_pref4 | job_platform |
+--------+------------------+--------------------+----------------+----------------+----------------+----------------+--------------+
| 112328 | Product Analysts | Operation Engineer | New Delhi      | NYC            |                |                | Monster Jobs |
*/
drop table requirements;
create table requirements(
			job_id varchar(7) not null,
			email varchar (30) check (email like '%_@__%.__%') not null ,
			skills varchar(100) not null,
			work_exp float(2) not null,
			current_salary varchar(10) not null,
			start_date date not null,
			expected_hike float(2) not null,
			CV_submission varchar(3) not null,
			primary key(job_id, email)
			);
create index skills on requirements(skills);
create index work_exp on requirements(work_exp);
create index current_salary on requirements(current_salary);
create index start_date on requirements(start_date);
create index expected_hike on requirements(expected_hike);
create index CV_submission on requirements(CV_submission);
create index email on requirements(email);
create index job_id on requirements(job_id);

insert into requirements values('112328','025015@fsm.ac.in','Python, Excel, SQL','4','920000','2022-03-25','30','YES');
/*
| job_id | email            | skills             | work_exp | current_salary | start_date | expected_hike | CV_submission |
+--------+------------------+--------------------+----------+----------------+------------+---------------+---------------+
| 112328 | 025015@fsm.ac.in | Python, Excel, SQL |        4 | 920000         | 2022-03-25 |            30 | YES           |
*/
drop table rel_job_requirements;
create table rel_job_requirements(
				job_id varchar(7) not null,
				role_pref varchar(50) not null,
				job_position varchar(50) not null,
				location_pref1 varchar(10) not null,
				location_pref2 varchar(10),
				location_pref3 varchar(10),
				location_pref4 varchar(10),
				job_platform  varchar(30) not null,
				email varchar (30) check (email like '%_@__%.__%') not null ,
				skills varchar(100) not null,
				work_exp float(2) not null,
				current_salary varchar(10) not null,
				start_date date not null,
				expected_hike float(2) not null,
				CV_submission varchar(3) not null,
				foreign key (job_id) references job_details(job_id),
				foreign key (role_pref) references job_details(role_pref),
				foreign key (job_position) references job_details(job_position),
				foreign key (location_pref1) references job_details(location_pref1),
				foreign key (location_pref2) references job_details(location_pref2),
				foreign key (location_pref3) references job_details(location_pref3),
				foreign key (location_pref4) references job_details(location_pref4),
				foreign key (job_platform) references job_details(job_platform),
				foreign key (email) references requirements(email),
				foreign key (skills) references requirements(skills),
				foreign key (work_exp) references requirements(work_exp),
				foreign key (current_salary) references requirements(current_salary),
				foreign key (start_date) references requirements(start_date),
				foreign key (expected_hike) references requirements(expected_hike),
				foreign key (CV_submission) references requirements(CV_submission),
				primary key(email, job_id)
				);
drop table rel_applicant_requirements;
create table rel_applicant_requirements(
			job_id varchar(7) not null,
			email varchar (30) check (email like '%_@__%.__%') not null ,
			skills varchar(100) not null,
			work_exp float(2) not null,
			current_salary varchar(10) not null,
			start_date date not null,
			expected_hike float(2) not null,
			CV_submission varchar(3) not null,
			name varchar(30) not null,
			phn_no bigint(10) not null,
			dob date not null,
			linkdIn varchar(100) not null,
			10th_score float(2) not null,
			12th_score float(2) not null,
			highest_qualf varchar(20) not null,
			CGPA_q float(2) not null,
			foreign key (job_id) references job_details(job_id),
			foreign key (email) references requirements(email),
			foreign key (skills) references requirements(skills),
			foreign key (work_exp) references requirements(work_exp),
			foreign key (current_salary) references requirements(current_salary),
			foreign key (start_date) references requirements(start_date),
			foreign key (expected_hike) references requirements(expected_hike),
			foreign key (CV_submission) references requirements(CV_submission),
			foreign key (name) references applicant_details(name),
			foreign key (phn_no) references applicant_details(phn_no),
			foreign key (dob) references applicant_details(dob),
			foreign key (linkdIn) references applicant_details(linkdIn),
			foreign key (10th_score) references applicant_details(10th_score),
			foreign key (12th_score) references applicant_details(12th_score),
			foreign key (highest_qualf) references applicant_details(highest_qualf),
			foreign key (CGPA_q) references applicant_details(CGPA_q),
			primary key (email, job_id)
			);
			
create table rel_applicant_job(
			job_id varchar(7) not null,
			email varchar (30) check (email like '%_@__%.__%') not null ,
			role_pref varchar(50) not null,
			job_position varchar(50) not null,
			location_pref1 varchar(10) not null,
			location_pref2 varchar(10),
			location_pref3 varchar(10),
			location_pref4 varchar(10),
			job_platform  varchar(30) not null,
			foreign key (job_id) references job_details(job_id),
			foreign key (role_pref) references job_details(role_pref),
			foreign key (job_position) references job_details(job_position),
			foreign key (location_pref1) references job_details(location_pref1),
			foreign key (location_pref2) references job_details(location_pref2),
			foreign key (location_pref3) references job_details(location_pref3),
			foreign key (location_pref4) references job_details(location_pref4),
			foreign key (job_platform) references job_details(job_platform),
			foreign key (email) references applicant_details(email),
			primary key(job_id, email)
			);
			


CREATE USER 'empire'@'localhost' IDENTIFIED BY 'gupta' ;
CREATE USER 'empire2'@'localhost' IDENTIFIED BY 'ekansh' ;
CREATE USER 'empire3'@'localhost' IDENTIFIED BY 'muskan' ;


-- dba
grant create,drop,select on *.* to 'empire'@'localhost' with grant option ;

--customer
grant select, insert, delete, update on amazon_hiring.applicant_details to 'empire2'@'localhost';
grant select, insert on amazon_hiring.job_details to 'empire2'@'localhost';
grant insert, delete, select, update on amazon_hiring.requirements to 'empire2'@'localhost';
grant update on amazon_hiring.rel_applicant_job to 'empire2'@'localhost';
grant update on amazon_hiring.rel_applicant_requirements to 'empire2'@'localhost';
grant select on amazon_hiring.rel_job_requirements to 'empire2'@'localhost';

--recruiter
grant select, update on amazon_hiring.applicant_details to 'empire3'@'localhost';
grant select, insert, delete, update on amazon_hiring.job_details to 'empire3'@'localhost';
grant select on amazon_hiring.requirements to 'empire3'@'localhost';
grant select, update on amazon_hiring.rel_applicant_job to 'empire3'@'localhost';
grant select on amazon_hiring.rel_applicant_requirements to 'empire3'@'localhost';
grant select, insert, delete, update on amazon_hiring.rel_job_requirements to 'empire3'@'localhost';


