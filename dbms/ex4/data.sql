use ex4;

insert into employee values ('Udipta', NULL, 'Pathak', 1, '2003-01-14', 'Assam', 'M', 150000, 4, 1);
insert into employee values ('Tarun', 'T', 'Joy', 2, '2002-02-11', 'Tamil Nadu', 'M', 90000, 3, 1);
insert into employee values ('Swati', NULL, 'Parida', 3, '2002-11-21', 'Punjab', 'F', 110000, 2, 2);
insert into employee values ('Tarun', 'K', 'Lywait', 4, '2001-05-26', 'Maharashtra', 'M', 60000, 2, 3);
insert into employee values ('Brintha', NULL, 'M.', 5 , '2003-03-14', 'Tamil Nadu', 'F', 125000, 1, 2);
insert into employee values ('Praveen', 'D', 'Reddy', 6, '2002-08-06', 'Andhra Pradesh', 'M', 90000, 5, 2);
insert into employee values ('Rahul', NULL, 'Raj', 7, '2001-09-09', 'Bihar', 'M', 70000, 5, 1);

insert into department values ('Research', 1, 4, '1992-08-19', 'Hyderabad');
insert into department values ('Development', 2 , 7, '1998-07-06', 'Bangalore');
insert into department values ('Strategy', 3, 5, '1997-11-29', 'Pune');

insert into project values ('Cancer', 1, 'Hyderabad', 2);
insert into project values ('Genetics', 2, 'Pune', 3);
insert into project values ('Cluster', 3, 'Pune', 2);
insert into project values ('Dall-E', 4, 'Bangalore', 1);
insert into project values ('Dentistry', 5, 'Bangalore', 1);
insert into project values ('Soft Body', 6, 'Bangalore', 2);
insert into project values ('Graviton', 7, 'Hyderabad', 3);

insert into workson values (1, 2, 20);
insert into workson values (1, 3, 30);
insert into workson values (2, 3, 30);
insert into workson values (3, 5, 60);
insert into workson values (4, 4, 55);
insert into workson values (5, 5, 20);
insert into workson values (6, 1, 60);
insert into workson values (7, 2, 40);
insert into workson values (5, 2, 10);

insert into dependent values (1, 'Brintha', 'F', '2003-03-14', 'Assisstant');
insert into dependent values (3, 'Tarun', 'M', '2001-05-26', 'Boss');
insert into dependent values (4, 'Praveen', 'M', '2002-08-06', 'Co-worker');
insert into dependent values (4, 'Rahul', 'M', '2001-09-09', 'Supervisor');
insert into dependent values (5, 'Udipta', 'M', '2003-01-14', 'Co-worker');
insert into dependent values (2, 'Swati', 'F', '2002-11-21', 'Assistant');
insert into dependent values (2, 'Tarun' ,'M', '2001-05-26', 'Boss');
