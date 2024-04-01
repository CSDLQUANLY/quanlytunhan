--Tìm tù nhân nào có biểu hiện không tốt
select * from Prisoner where status='Xau'

--tìm các nhân viên có chức vụ là sĩ quan
select * from Prison_staff where position='Si quan'

--Tìm các nhân viên thuộc nhà tù Azure Dragon
select Prison_staff.* from Prison_staff 
inner join Prison_with_Prison_staff on Prison_staff.prison_staff_id =Prison_with_Prison_staff.prison_staff_id
inner join Prison on Prison_with_Prison_staff.prison_id=Prison.prison_id
where prison_name='Azure Dragon'

--tìm những tù nhân phạm tội cướp giật tài sản với mức độ nghiêm trọng là mức 3
select Prisoner.* from Prisoner inner join Prisoner_with_Crime on Prisoner.prisoner_id=Prisoner_with_Crime.prisoner_id
inner join Crime on Prisoner_with_Crime.crime_id=Crime.crime_id
where Crime.crime_name='Cuop giat tai san'  and Crime.crime_level=3

--tìm những người thân của tù nhân có mã 01
select * from Relative_of_prisoner inner join Prisoner ON relationship_with_prisoner.prisoner_id=Prisoner.prisoner_id
where prisoner_id=1

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
select Prison.* ,count(Prisoner.prisoner_id ) as so_tu_nhan from Prison inner join Prisoner_with_Prison on Prison.prison_id=Prisoner_with_Prison.prison_id
inner join Prisoner on Prisoner_with_Prison.prisoner_id=Prisoner.prisoner_id
where Prison.prison_capacity>8000
group by Prison.prison_id,Prison.prison_name,Prison.prison_capacity,Prison.prison_address,Prison.chief_warden_name
having Prison.prison_capacity - count(Prisoner.prisoner_id ) >1000

--Tìm những tù nhân phòng 5 phạm ít nhất 2 tội trở lên
select  Prisoner.prisoner_id,Prisoner.last_name,Prisoner.first_name,Prisoner.gender,count(Crime.crime_id) as so_toi from Prisoner 
inner join Prisoner_with_Crime on Prisoner.prisoner_id=Prisoner_with_Crime.prisoner_id
inner join Crime on Prisoner_with_Crime.crime_id=Crime.crime_id
where Prisoner.cell_room=5
group by Prisoner.prisoner_id,Prisoner.last_name,Prisoner.first_name,Prisoner.gender
having COUNT(Crime.crime_id) > 1

--Tìm những nhà tù ở Ha noi có tren 8 nhan vien
select Prison.prison_id,Prison.prison_name ,count(Prison_staff.prison_staff_id) as so_nhan_vien from Prison_staff 
inner join Prison_with_Prison_staff on Prison_staff.prison_staff_id =Prison_with_Prison_staff.prison_staff_id
inner join Prison on Prison_with_Prison_staff.prison_id=Prison.prison_id
where Prison.prison_address='Ha Noi city'
group by Prison.prison_id,Prison.prison_name
having count(Prison_staff.prison_staff_id)>8

