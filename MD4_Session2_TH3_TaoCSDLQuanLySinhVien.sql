-- THUC HANH 
CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME,
    Status    BIT
);
CREATE TABLE Student(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);
CREATE TABLE Mark(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

--  
insert into Class(ClassName,StartDate,Status) values
("A1","2008-12-20",1),
("A2","2008-12-22",1),
("B3",current_date(),0);

insert into Student(StudentName,Address,Phone,Status,ClassId) values
("Hung", "HN", "0912113113", 1,1),
("Hoa", "HP", null, 1,1),
("Manh", "HCM", "0123123123", 0,2);

insert into Subject(SubName,Credit,Status) values
("CF",5,1),
("C",6,1),
("HDJ",5,1),
("RDBMS",10,1);

insert into Mark(SubId,StudentId,Mark,ExamTimes) values
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);


-- Truy vấn dữ liệu quản lí sinh viên 
select * from Student;

select * from Student where Status = true;

select * from Subject where Credit < 10;

select S.StudentId, S.StudentName, C.ClassName 
from Student S join Class C on S.ClassID = C.ClassID;

select S.StudentId, S.StudentName, C.ClassName
from Student S join Class C on S.ClassID = C.ClassID
where C.ClassName = "A1";

select S.StudentId , S.StudentName, sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join
Subject sub on M.SubId = sub.SubId;

select S.StudentId , S.StudentName, sub.SubName, M.Mark
from Student S join Mark M on S.StudentId = M.StudentId join
Subject sub on M.SubId = sub.SubId
where sub.SubName = "CF";
-- END THUC HANH

-- BAITAP
-- BAI 1
-- •	Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ 
select * from Student where StudentName like "h%";
-- •	Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from Class where extract(month from StartDate)  = "12";
-- •	Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject where Credit  between 3 and 5;
-- •	Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update Student set ClassId = 2 where StudentName = "Hung";
select * from Student where StudentName = "Hung";
-- •	Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select S.StudentName , Sub.SubName , M.Mark from Student S join Subject Sub join Mark M on Sub.SubId = M.SubId  order by M.Mark desc; 
-- END BAI1