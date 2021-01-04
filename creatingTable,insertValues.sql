create database universityprojectv4
use universityprojectv4;

/* -------------------------------------------------------------------------- */
/*                               creating table                               */
/* -------------------------------------------------------------------------- */

/* ------------------------------ faculty table ----------------------------- */

create table Faculty(
  FID int primary key IDENTITY,
  FName NVARCHAR(50) not NULL
);

insert into Faculty VALUES  ('Engineering'), ( 'Medicine'), ( 'Arts') ;
select * from Faculty
/* ---------------------------- department table ---------------------------- */
create table Department(
    DID int PRIMARY KEY IDENTITY ,
    DName NVARCHAR(50) not NULL,
    FID int not NULL REFERENCES Faculty(FID)
);
insert into Department VALUES ('computer engineering and automatic control',1),('civil engineering',1),('history',3),('anatomy',2);
select * from Department
select Fname from Faculty where FID=(
    select FID from Department where Dname='civil engineering'
);

/* ------------------------------- staff table ------------------------------ */
create table Staff(
    STAFFID int PRIMARY KEY IDENTITY,
    StaffName NVARCHAR(50) not NULL ,
    StaffEmail NVARCHAR(60) not NULL,
    DID int REFERENCES Department(DID),
    StaffSalary int not NULL
);
INSERT into Staff VALUES('mohamed wagdy','123@fEng',1,5000),('wlaid','123@feng',2,4000),('wlaid','123@farts',3,3000);
select * from Staff;

select Dname from Department where DID=(
    select DID from Staff where STAFFID=3
);


/* ------------------------------ student table ----------------------------- */
create table Student(
    STUDENTID int PRIMARY KEY IDENTITY,
    DID int REFERENCES Department(DID),
    StudentName NVARCHAR(50) not NULL,
    StudentEmail NVARCHAR(50) not NULL,
    StudentLevel NVARCHAR(50) not NULL,
    
);
insert into Student VALUES(1,'khaled','231@feng',' undergradu level 1'),(2,'wjlks','231@feng',' undergradu level 2');
select * from Student;
select Dname from Department where DID=(
    select DID from Student where STUDENTID=2
);

/* ------------------------------ course table ------------------------------ */
create table Course(
    COURSEID int PRIMARY KEY IDENTITY,
    DID int REFERENCES Department(DID),
    CourseName NVARCHAR(50) not NULL,
    CreditHours int not NULL,
    RequiredCourses NVARCHAR(200),
);
insert into Course VALUES (1,'Os',13,'nothing'), (2,'DB',15,'nothing');
select * from Course;
select Dname from Department where DID=(
    select DID from Course where COURSEID=2
);
/* ----------------------------- teaching table ----------------------------- */
create table Teaching(
    COURSEID INT NOT NULL REFERENCES Course(COURSEID),
    STAFFID int NOT NULL REFERENCES Staff(STAFFID),
);
insert into Teaching VALUES(1,1);
select * from Teaching;
/* ------------------------------ Enroll table ------------------------------ */
create table Enroll(
    STUDENTID INT not NULL REFERENCES  Student(STUDENTID),
    COURSEID INT  not NULL REFERENCES Course(COURSEID),
    EnrollDate DATETIME,
);
INSERT into Enroll VALUES(1,1,'2016-02-20 ');
select * from Enroll;

/* ----------------------------- lecture table ----------------------------- */
create table Lecture(
    LECTUREID INT PRIMARY KEY IDENTITY,
    COURSEID INT NOT NULL REFERENCES Course(COURSEID),
    STAFFID int NOT NULL REFERENCES Staff(STAFFID),
    LectTitle NVARCHAR(300) not NULL,
    Semster NVARCHAR(60) not NULL,
    LecDate NVARCHAR(20) ,
    Room NVARCHAR(50),
    LectTime NVARCHAR(10) not NULL
);
insert into Lecture VALUES (1,1,'automotion','first semester','29/2/2020','hall 1','11 am')
select * from Lecture

/* ------------------------------ section table ----------------------------- */
create table Section(
    SECTIONID INT PRIMARY KEY IDENTITY,
    COURSEID INT NOT NULL REFERENCES Course(COURSEID),
    STAFFID int NOT NULL REFERENCES Staff(STAFFID),
    SectTitle NVARCHAR(300) not NULL,
    Semster NVARCHAR(60) not NULL,
    SecDate NVARCHAR(20) ,
    Room NVARCHAR(50),
    SectTime NVARCHAR(10) not NULL
);
insert into Section VALUES (1,1,'automotion','first semester','1/3/2020','hall 1','11 am');
select * from Section;

/* ------------------------------ StudentDegree ----------------------------- */
create table StudentDegree(
        STUDENTID INT not NULL REFERENCES  Student(STUDENTID),
        COURSEID INT  not NULL REFERENCES Course(COURSEID),
        FullDegree int not null ,
        StudDegree int not null,
        StudLevelAtCourse NVARCHAR(20)
);

insert into StudentDegree VALUES(1,1,150,150,'Exellent');
insert into StudentDegree VALUES(1,2,140,150,'Exellent')

select * from StudentDegree