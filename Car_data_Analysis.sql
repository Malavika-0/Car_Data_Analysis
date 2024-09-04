use car_dekho;
select *from car_table;
select count(*) from car_table;  #6722
describe car_table;
select distinct(fuel) from car_table;
update car_table set transmission='Automatic' where transmission=' Automatic';
update car_table set Name=trim(Name);
select Name from car_table order by Name;
select count(*) from car_table where fuel='Diesel' order by name;   #3658
select fuel,count(*) as cof from car_table group by fuel order by cof;
select fuel from car_table group by fuel;
select * from car_table limit 6228,1;
select *from car_table order by km_driven desc limit 10;
select fuel,avg(selling_price) as avg_sp from car_table group by fuel order by avg_sp;
alter table car_table add column Company varchar(50);
update car_table set Company=substring_index(name,' ',1);
alter table car_table modify company varchar(50) first;
alter table car_table modify name text after seats;
alter table car_table add column bhp int;
update car_table set bhp=trim(substring_index(max_power,'n',1));
alter table car_table modify bhp varchar(10) after max_power;
alter table car_table modify bhp int;
delete from car_table where name='Maruti Omni CNG';
update car_table set torque=trim(substring_index(torque,' ',1));
alter table car_table modify torque int;
select km_driven, case when km_driven<10000 then 'Less than 10k'
when km_driven>=10000 and km_driven<=100000 then 'between 10k and 100k'
else 'Above 100k' end as category_km from car_table;
alter table car_table add column km_driven_category varchar(50);
update car_table set km_driven_category=case when km_driven<10000 then 'Less than 10k'
when km_driven>=10000 and km_driven<=100000 then 'between 10k and 100k'
else 'Above 100k' end;
select max(kmpl) from car_table;
delete from car_table where kmpl=0;
alter table car_table add column mileage_category varchar(50);
update car_table set mileage_category=case when kmpl<10 then 'Low'
when kmpl>=10 and kmpl<=20 then 'Average'
else 'High' end;
select mileage_category,avg(selling_price) from car_table group by mileage_category;
select *from car_table where fuel like 'P%';
select mileage_category,count(*) from car_table group by mileage_category;

	#avg selling price of each company
select company,max(selling_price) from car_table group by company order by max(selling_price) desc;
	#count of each transmission vehicles
select transmission,count(transmission) from car_table group by transmission;
	#count of vehicles with bhp=110.5
select count(bhp) from car_table where bhp=100.5;
	#avg seeling price of owner
select owner,avg(selling_price) from car_table group by owner order by avg(selling_price);
	#count of vehicles of each company
select company,count(*) from car_table group by company;
	#vehicles with year=2023,owner=Firstowner and CC>1000
select *from car_table where year=2023 and owner='First Owner' and CC>1000;
	#count of vehicles in each category of seats
select seats,count(*) from car_table group by seats;
select company,max(seats) from car_table group by company;

create temporary table table1 select company,year,selling_price,km_driven,fuel,seller_type,transmission,owner,mileage,kmpl,engine,CC,max_power,bhp,torque,seats,name,km_driven_category,mileage_category from car_table group by company,year,selling_price,km_driven,fuel,seller_type,transmission,owner,mileage,kmpl,engine,CC,max_power,bhp,torque,seats,name,km_driven_category,mileage_category;
delete from car_table;
select count(*)from table1;
insert into car_table select *from table1;

create table table2 select company,year,fuel,kmpl from car_table;
insert into table2 select company,year,fuel,kmpl from car_table;
select * from table2;
drop table table2;

alter table car_table add column current_date1 date;
update car_table set current_date1=current_date();

select company,avg(torque) from car_table group by company order by avg(torque);
select sum(selling_price) from car_table;
select company,km_driven from car_table order by km_driven desc ;
select seller_type,count(*) from car_table group by seller_type order by count(*) desc;