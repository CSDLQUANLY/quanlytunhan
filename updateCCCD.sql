use quan_ly_tu_nhan
go
alter table Relative_of_prisoner
add CCCD  varchar(12)
GO
update  Relative_of_prisoner
set CCCD = REPLACE(date_of_birth, '-', '');
go
ALTER TABLE  Relative_of_prisoner
alter COLUMN CCCD  varchar(12) NOT NULL
go
ALTER TABLE Relative_of_prisoner 
ADD CONSTRAINT PK_ROP PRIMARY KEY (CCCD);
go



