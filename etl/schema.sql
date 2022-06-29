
--STAR SCHEMA

create table dim_1 (D_id int primary key, name varchar (10));
create table dim_2 (S_id int primary key, name varchar (10));
create table dim_3 (P_id int primary key, name varchar (10));
create table dim_4 (T_id int primary key, name varchar (10));


create table fact (F_ID int, DID int foreign key references dim_1 (D_id),
D_ID int foreign key references dim_2 (S_id)
,PID int foreign key references dim_3 (P_id)
,TID int foreign key references dim_4 (T_id));

--SNOW FLAKES

create table dim_5 (Q_id int, 
PID int foreign key references dim_3 (P_id));

create table dim_6 (R_id int, 
DID int foreign key references dim_1 (D_id));


--galaxy

create table dim_7 (M_id int primary key, name varchar (10));
create table dim_8 (N_id int primary key, name varchar (10));


create table fact1 (F1_id int
,PID int foreign key references dim_3 (P_id)
,TID int foreign key references dim_4 (T_id)
,MID int foreign key references dim_7 (M_id)
,NID int foreign key references dim_8 (N_id));










