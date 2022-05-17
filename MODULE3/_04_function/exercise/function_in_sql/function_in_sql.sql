use student_management;
#1.Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject`  where credit = (select max(credit) from `subject`);

#2. Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from mark m 
JOIN `subject` s on m.sub_id = s.sub_id 
WHERE mark = (SELECT MAX(mark) FROM mark);

#3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên,
#xếp hạng theo thứ tự điểm giảm dần

SELECT s.student_id, s.student_name, s.address, AVG(m.mark)
FROM (mark  m
INNER JOIN student s ON m.student_id = s.student_id)
GROUP BY s.student_id
ORDER BY AVG(m.mark) DESC, s.student_name ASC;