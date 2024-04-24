--Tìm tù nhân nào có biểu hiện không tốt
select * from Prisoner where status='Xau'

--tìm các nhân viên có chức vụ là sĩ quan
select * from Prison_staff where position='Si quan'

--Tìm các nhân viên thuộc nhà tù Azure Dragon
select ps.* from Prison_staff ps
inner join Prison p on ps.prison_id = p.prison_id
where prison_name='Azure Dragon'

--tìm những tù nhân phạm tội cướp giật tài sản với mức độ nghiêm trọng là mức 3
select Prisoner.* from Prisoner inner join Prisoner_with_Crime on Prisoner.prisoner_id=Prisoner_with_Crime.prisoner_id
inner join Crime on Prisoner_with_Crime.crime_id=Crime.crime_id
where Crime.crime_name='Cuop giat tai san'  and Crime.crime_level=3

--tìm những người thân của tù nhân có mã 01
select rp.* from Relative_of_prisoner rp inner join Prisoner ON rp.prisoner_id=Prisoner.prisoner_id
where rp.prisoner_id=1

--tìm số lượng tù nhân của phòng 1 đến phòng 5
select cell_room ,COUNT(prisoner_id) as so_tu_nhan from Prisoner
where cell_room between 1 and 5
group by cell_room

--Tìm số từ nhân phạm phải tội cướp giật tài sản với từng mức độ
select Crime.crime_id,Crime.crime_name,Crime.crime_level ,COUNT(Prisoner.prisoner_id) as so_tu_nhan 
from Prisoner 
inner join Prisoner_with_Crime on Prisoner.prisoner_id=Prisoner_with_Crime.prisoner_id
inner join Crime on Prisoner_with_Crime.crime_id=Crime.crime_id
where Crime.crime_name='Cuop giat tai san' 
group by Crime.crime_id,Crime.crime_name,Crime.crime_level


--Tìm nhà tù mà có sức chứa trên 8000 tù nhân và có ít nhất 1000 chỗ ở cho tù nhân còn trống 
select Prison.* ,count(Prisoner.prisoner_id ) as so_tu_nhan from Prison  
inner join Prisoner on Prison.prison_id=Prisoner.prison_id
where Prison.prison_capacity>8000
group by Prison.prison_id,Prison.prison_name,Prison.prison_capacity,Prison.prison_address,Prison.prison_staff_id
having Prison.prison_capacity - count(Prisoner.prisoner_id ) >1000

--Tìm những tù nhân phòng 5 phạm ít nhất 2 tội trở lên
select  Prisoner.prisoner_id,Prisoner.last_name,Prisoner.first_name,Prisoner.gender,count(Crime.crime_id) as so_toi from Prisoner 
inner join Prisoner_with_Crime on Prisoner.prisoner_id=Prisoner_with_Crime.prisoner_id
inner join Crime on Prisoner_with_Crime.crime_id=Crime.crime_id
where Prisoner.cell_room=5
group by Prisoner.prisoner_id,Prisoner.last_name,Prisoner.first_name,Prisoner.gender
having COUNT(Crime.crime_id) > 1

--Tìm những nhà tù ở Ha noi có tren 8 nhan vien
select p.prison_id,p.prison_name ,count(ps.prison_staff_id) as so_nhan_vien from Prison_staff ps
inner join Prison p on ps.prison_id = p.prison_id
where p.prison_address='Ha Noi city'
group by p.prison_id,p.prison_name
having count(ps.prison_staff_id)>8

/*02 câu lệnh gồm select có where, group by, having và order by*/
-- tìm nhà tù có nhiều hơn 2 tù nhân nam và sắp xếp theo số lượng tù nhân nam trong độ tuổi từ 20 đến 25 giảm dần
select Prison.prison_name, Prison.prison_address, Prison.prison_capacity, Prison.prison_staff_id from Prison 
inner join Prisoner on Prisoner.prison_id = Prison.prison_id
where DATEDIFF(YEAR, Prisoner.date_of_birth, GETDATE()) between 40 and 45 and Prisoner.gender = N'Nam'
group by prison_name, prison_address, prison_capacity, prison_staff_id
having count(Prisoner.prisoner_id) > 2
order by count(Prisoner.prisoner_id) desc

-- tìm nhà tù có nhiều hơn 6 tù nhân nam và được sắp xếp theo chiều tăng dần về thời gian chịu án

select Prison.prison_name, Prison.prison_address, Prison.prison_capacity, Prison.prison_staff_id from Prison 
inner join Prisoner on Prisoner.prison_id = Prison.prison_id
WHERE Prisoner.gender = N'Nam' 
GROUP BY prison_name, prison_address, prison_capacity, prison_staff_id
HAVING COUNT(Prisoner.prisoner_id) > 6 
ORDER BY DATEDIFF(YEAR, MIN(Prisoner.start_day), MAX(Prisoner.end_day)) ASC;

/* 02 câu lệnh gồm select có where, group by, having và truy vấn con*/
-- Tìm những nhà tù có capacity > 9000 và số lượng tù nhân > 5,
--chứa ít nhất 1 tù nhân mang tội danh 'Cuop giat tai san' 
SELECT Prison.prison_name, Prison.prison_address, Prison.prison_capacity, Prison.prison_staff_id,Crime.crime_name,
       COUNT(Prisoner.prisoner_id) AS num_prisoners FROM Prison 
INNER JOIN Prisoner ON Prison.prison_id = Prisoner.prisoner_id 
INNER JOIN Prisoner_with_Crime ON Prisoner.prisoner_id = Prisoner_with_Crime.prisoner_id 
INNER JOIN Crime ON Crime.crime_id = Prisoner_with_Crime.crime_id 
INNER JOIN (
    SELECT DISTINCT p.prison_id
    FROM Prisoner p
    INNER JOIN Prisoner_with_Crime pwc ON p.prisoner_id = pwc.prisoner_id
    INNER JOIN Crime c ON pwc.crime_id = c.crime_id
    WHERE c.crime_name = N'Cuop giat tai san'
) AS T ON Prison.prison_id = T.prison_id
GROUP BY Prison.prison_name, Prison.prison_address, Prison.prison_capacity, Prison.prison_staff_id, Crime.crime_name
HAVING COUNT(Prisoner.prisoner_id) > 5
AND Prison.prison_capacity > 9000;


-- cho biết những tù nhân ở nhà tù "White Tiger" lớn hơn 30 tuổi và không mang tội danh "Hiep dam"
SELECT prs.first_name, prs.last_name, DATEDIFF(YEAR, prs.date_of_birth, GETDATE()) as AGE from Prisoner as prs
inner join Prison as ps on ps.prison_id = prs.prison_id
where ps.prison_name = N'White Tiger' 
					   and prs.prisoner_id Not in (
					   select prs1.prisoner_id from Prisoner as prs1
					   inner join Prisoner_with_Crime as pwc on pwc.prisoner_id = prs1.prisoner_id
					   inner join Crime as cr on cr.crime_id = pwc.crime_id
					   where cr.crime_name = N'Hiep dam')
					   group by prs.first_name, prs.last_name, prs.date_of_birth
					   Having max(DATEDIFF(YEAR, prs.date_of_birth, GETDATE())) > 30

/* 02 câu câu lệnh insert có điều kiện*/
-- Tạo một bảng tên "Sentence_Reduction" chứa những người đi tù nhiều hơn 2 năm 
CREATE TABLE Sentence_Reduction (
    prisoner_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
    reduction_amount INT
);

-- Thêm dữ liệu vào bảng Sentence_Reduction
INSERT INTO Sentence_Reduction (prisoner_id,first_name,last_name, reduction_amount)
SELECT p.prisoner_id, 
		p.first_name,
		p.last_name,
       2 AS reduction_amount
FROM Prisoner AS p
WHERE EXISTS (
    SELECT 1
    FROM Prisoner_with_Crime AS pwc
    INNER JOIN Crime AS c ON pwc.crime_id = c.crime_id
    WHERE pwc.prisoner_id = p.prisoner_id
    GROUP BY pwc.prisoner_id
    HAVING DATEDIFF(YEAR, p.start_day, p.end_day) >= 2
);

-- Tạo một bảng chỉ những người có tội danh giết người
CREATE TABLE Killing (
	prisoner_id INT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    start_day DATE,
    end_day DATE
);

INSERT INTO Killing (prisoner_id, first_name, last_name, start_day, end_day)
SELECT p.prisoner_id, p.first_name, p.last_name, p.start_day, p.end_day
FROM Prisoner p
INNER JOIN Prisoner_with_Crime pwc ON p.prisoner_id = pwc.prisoner_id
INNER JOIN Crime c ON pwc.crime_id = c.crime_id
WHERE c.crime_name = N'Giet nguoi';


/*- 02 câu lệnh update có điều kiện*/
-- giảm thời gian chịu án 2 năm với những tù nhân có tình trạng cải tạo tốt

UPDATE Prisoner
SET end_day = DATEADD(YEAR, -2, end_day) -- Giảm thời gian chịu án 2 năm
WHERE prisoner_id IN (
    SELECT p.prisoner_id
    FROM Prisoner p
    WHERE p.status = 'Tot' -- Tình trạng cải tạo tốt
) 
AND DATEDIFF(YEAR, start_day, end_day) > 2

-- thêm cột số người thân của tù nhân trong bảng tù nhân
ALTER TABLE Prisoner
ADD num_family_members INT;

UPDATE Prisoner
SET num_family_members = (
    SELECT COUNT(Relative_of_prisoner.prisoner_id)
    FROM Relative_of_prisoner
    WHERE Relative_of_prisoner.prisoner_id = Prisoner.prisoner_id
	GROUP BY Prisoner.prisoner_id
)
WHERE EXISTS (
    SELECT 1
    FROM Relative_of_prisoner
    WHERE prisoner_id = Prisoner.prisoner_id
);

update Prisoner 
set num_family_members = Songuoithan from(
select Relative_of_prisoner.prisoner_id, count(Relative_of_prisoner.first_name) as Songuoithan from Relative_of_prisoner
group by Relative_of_prisoner.prisoner_id
) as new_Table
where new_Table.prisoner_id = Prisoner.prisoner_id


/*- 02 câu lệnh delete có điều kiện*/
-- xóa tù nhân có tình trạng cải tạo tốt và mức độ '1'
DELETE FROM Prisoner 
WHERE prisoner_id IN (
    SELECT prisoner_id FROM Prisoner as prs
	inner join Prisoner_with_Crime as pwc on pwc.prisoner_id = Prisoner.prisoner_id
	inner join Crime on Crime.crime_id = pwc.crime_id
    WHERE prs.status = 'Tot' AND Crime.crime_level = '1'
);

-- Xóa những người thân tù nhân đã ra tù
DELETE FROM Relative_of_prisoner
WHERE prisoner_id NOT IN (
    SELECT prisoner_id
    FROM Prisoner
);
