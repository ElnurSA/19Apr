create Table Countries(
    [id] int PRIMARY key IDENTITY(1,1),
    [Name] NVARCHAR(50)
)

create table City(
    [id] int PRIMARY key IDENTITY(1,1),
    [Name] NVARCHAR(50),
    [CountryId] int 
    foreign key (CountryId) REFERENCES countries(id)
)

create table teachers(
    [id] int primary key IDENTITY(1,1),
    [Fullname] NVARCHAR(250),
    [Salary] decimal,
    [CityId] int,
    FOREIGN KEY (CityId) REFERENCES City(id)
)


create Table Groups(
    [id] int primary key IDENTITY(1,1), 
    [name] NVARCHAR(255),
    [RoomId] int,
    FOREIGN key (RoomId) REFERENCES Rooms(id)

)

create table teacherGroups(
    [id] int PRIMARY key IDENTITY(1,1),
    [TeacherId] int,
    FOREIGN key (TeacherId) REFERENCES Teachers(id),
    [GroupId] int,
    FOREIGN key (GroupId) references Groups(id)
)

create table Students(
    [id] int primary key IDENTITY(1,1),
    [Fullname] NVARCHAR(255),
    [Age] int,
    [Email] NVARCHAR(255),
    [CityId] int,
    FOREIGN KEY (CityId) REFERENCES City(id)
)

create Table StudentsGroups(
    [id] int primary key IDENTITY(1,1),
    [GroupId] int,
    FOREIGN key (GroupId) REFERENCES Groups(id),
    [StudentId] int,
    FOREIGN key (StudentId) references Students(id)

)

Create Table Rooms(
    [id] int primary key IDENTITY(1,1),
    [Name] NVARCHAR(255),
    [Capacity] INT
)