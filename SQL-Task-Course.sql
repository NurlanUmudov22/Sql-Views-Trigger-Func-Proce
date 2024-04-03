create database CourseDB

use CourseDB

--Course databazasi olacaq. Students table (Id, Name,Surname,Age,Email,Address) yaradirsiz,
--Student table-dan hansisa data silinende  silinmish data  StudentArchives table-na  yazilmalidir.
--Silinme prosesini procedure sekilinde yazmalisiz.   Qeyd : Butun her sheyi kodlar     
--vasitesile yazirsiz, butun sorgular faylda olsun. (Databaza yaratmaq daxil olmaq shertile)

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(50),
[Age] int,
[Email] nvarchar(100) unique,
[Address] nvarchar(200) 
)

select * from Students



create procedure usp_createStudents
@name nvarchar(100),
@surname nvarchar(100),
@age int,
@email nvarchar(100),
@address nvarchar(200)
as
begin
	insert into Students([Name], [Surname],[Age], [Email], [Address])
	values(@name,@surname,@age, @email, @address)
end


exec  usp_createStudents 'Ismayil', 'Ceferli',24, 'ismayil@gmail.com', 'Xezer'
exec  usp_createStudents 'Ayxan', 'Aghayev',23, 'ayxan@gmail.com', '20 Yanvar'
exec  usp_createStudents 'Behruz', 'Eliyev',27, 'behruz@gmail.com', 'Kurdexani'
exec  usp_createStudents 'Elmir', 'Qafarzade',21, 'elmir@gmail.com', 'Sahil'
exec  usp_createStudents 'Sirac', 'Memmedov',22, 'sirac@gmail.com', 'Maszir'
exec  usp_createStudents 'Nesir', 'Dadashov',28, 'nesir@gmail.com', 'Nesimi'
exec  usp_createStudents 'Reshad', 'Aghayev',21, 'reshad@gmail.com', 'Neftciler'
exec  usp_createStudents 'Esgerxan','Bayramov',26,'esgerxan@gmil.com', 'Yasamal'
exec  usp_createStudents 'Huseyn','Bayramov',26,'huseyn@gmil.com', 'Yasamal'
exec  usp_createStudents 'Eli','Semedov',24,'eli@gmil.com', 'Ehmedli'
exec  usp_createStudents 'Hesen','Hesenov',36,'hesen@gmil.com', 'Elmler'


select * from Students




create procedure usp_deleteStudentById
@id int 
as
begin
   delete from Students where [Id] = @id
end


--exec  usp_deleteStudentById 11



create table StudentLogs(
[Id] int primary key identity(1,1),
[StudentId] int,
[StudentName] nvarchar(50),
[StudentSurname] nvarchar(50),
[Operation] nvarchar(20),
[Date] datetime
)




create trigger trg_deleteStudentLogs on Students
after delete 
as
begin
  insert into StudentLogs([StudentId],[StudentName],[StudentSurname],[Operation],[Date])
  select [Id], [Name], [Surname], 'Delete', GETDATE() from deleted
end


exec usp_deleteStudentById  11
exec usp_deleteStudentById  10


select * from Students

select * from StudentLogs



