create database parentsSchoolApi

use parentsSchoolApi

create table contacts(
id_contact int identity(1,1),
email varchar(30),
phone int
constraint pk_id_contact primary key (id_contact)
)

create table type_docs(
id_type_doc int identity(1,1),
description varchar (30)
constraint pk_id_type_doc primary key (id_type_doc)
)

create table teachers(
id_teacher int identity(1,1),
name varchar(30),
last_name varchar(30),
title varchar (40),
id_type_doc int,
nro_doc int,
id_contact int
constraint pk_id_techer primary key (id_teacher),
constraint fk_id_type_doc foreign key (id_type_doc) references type_docs,
constraint fk_id_contact foreign key (id_contact) references contacts
)


create table school_subjects(
id_subject int identity(1,1),
id_teacher int,
name varchar (30),
grade int,
level int
constraint pk_id_subject primary key (id_subject),
constraint fk_id_teacher foreign key (id_teacher) references teachers
)

create table tutors(
id_tutor int identity(1,1),
relationship varchar(20),
name varchar (30),
last_name varchar(30),
id_type_doc int,
id_contact int,
nro_doc int
constraint pk_id_tutor primary key (id_tutor),
constraint fk_id_type_doc_tutor foreign key (id_type_doc) references type_docs(id_type_doc),
constraint fk_id_contact_tutor foreign key (id_contact) references contacts (id_contact)
)

create table student(
nro_file int identity (1,1),
name varchar(30),
last_name varchar(30),
age int,
grade int,
id_subject int,
id_type_doc int,
nro_doc int,
id_tutor int
constraint pk_nro_file primary key (nro_file),
constraint fk_id_subject_student foreign key (id_subject) references school_subjects,
constraint fk_id_type_doc_student foreign key (id_type_doc) references type_docs,
constraint fk_id_tutor_student foreign key (id_tutor) references tutors
)