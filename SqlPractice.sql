select [Fullname] from Student
union 
select[fullname] from Teachers

select [Fullname] from Student
union all
select[fullname] from Teachers

select [Fullname] from Student
EXCEPT 
select[fullname] from Teachers

select [Fullname] from Teachers
EXCEPT 
select[fullname] from Student

DELETE from Doctors

TRUNCATE TABLE Doctors

Select COUNT(*) as 'Count', Age
from Students
Group by Age
Order By Age desc 

declare @Counter INT
set @Counter=1
While ( @Counter <= 10)
BEGIN
    print 'The counter value is = ' + CONVERT(NVARCHAR,@Counter)
    SET @Counter = @Counter + 1
END


SELECT GETDATE()

create table StudentLogs(
    [Id] int primary key identity(1,1),
    [StudentId] int,
    [Operation] NVARCHAR(20),
    [Date] DATETIME
)

select * from StudentLogs

create trigger trg_writeLogAfterCreate on Students
after INSERT
as
begin 
    insert into StudentLogs([StudentId], [Operation],[Date])
    select [Id], 'Insert', GetDate() from inserted
end

insert into Students([name],[email])
values('Omer Elesgerli', 'omer@code.edu.az')

create trigger trg_writeLogAfterEditFixed on Students
after update 
as
begin 
    insert into StudentLogs([StudentId], [Operation],[Date])
    select [Id], 'Update', GetDate() from deleted
end



update Students
set [Email] = 'test2@gmail.com'
where [id] = 1

select * from StudentLogs WHERE [Operation] = 'update'
order by [Date] desc

create trigger trg_writeLogAfterEditEmail on Students
after UPDATE
as 
BEGIN
    insert into StudentLogs([StudentId],[Operation],[Date])
    select [id], 'Update', GetDate() from deleted
END

create table EmployeeLogs(
    [Id] int primary key identity(1,1),
    [EmployeeName] NVARCHAR(100),
    [OldEmail] NVARCHAR(100),
    [NewEmail] NVARCHAR(100),
    [Operation] NVARCHAR(20),
    [Date] DATETIME
)

