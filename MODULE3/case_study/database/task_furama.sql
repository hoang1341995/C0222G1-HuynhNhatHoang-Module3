use database_furama;
#2.	Hiển thị thông tin của tất cả nhân viên trong hệ thống
# có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *
from nhan_vien
where (ho_ten like 'h%' 
	or ho_ten like 'k%' 
    or ho_ten like 't%')
and char_length(ho_ten) <= 15;

#3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where (year(current_date()) - year(ngay_sinh) between 18 and 50)
 and dia_chi like '%Quảng Trị%' OR dia_chi like '%Đà Nẵng%';

#4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
#Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang as ma_khach_hang, kh.ho_ten as ten_khach_hang, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
group by hd.ma_khach_hang;

#5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, 
#ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
#với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
#(những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang, kh.ho_ten,
lk.ten_loai_khach,
 hd.ma_hop_dong,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc,
 dv.ten_dich_vu,
 (dv.chi_phi_thue + coalesce(( hdct.so_luong*dvdk.gia),0) )as tong_tien
 FROM hop_dong_chi_tiet hdct
 left JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 left JOIN dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 left JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left JOIN loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach;

#6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
#chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select  dv.ma_dich_vu ,
		dv.ten_dich_vu,
		dv.dien_tich,
		dv.chi_phi_thue,
		ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu 
WHERE  dv.ma_dich_vu not in 
(select  dv.ma_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu WHERE quarter(hd.ngay_lam_hop_dong)=1
 and year(hd.ngay_lam_hop_dong) = 2021) group by dv.ma_dich_vu;
 
 #7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của 
 # tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select  dv.ma_dich_vu ,
		dv.ten_dich_vu,
		dv.dien_tich,
        dv.so_nguoi_toi_da,
		dv.chi_phi_thue,
		ldv.ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu 
WHERE dv.ma_dich_vu in (select  dv.ma_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu WHERE year(hd.ngay_lam_hop_dong) = 2020)
 and 
 dv.ma_dich_vu not in (select  dv.ma_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu WHERE year(hd.ngay_lam_hop_dong) = 2021)
GROUP BY dv.ma_dich_vu;


#8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
# Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
#cach 1:
select ho_ten as ho_ten_khach_hang from khach_hang GROUP BY ho_ten;
#cach 2:
select ho_ten as ho_ten_khach_hang from khach_hang UNION select ho_ten from khach_hang;
#cach 3:
select distinct ho_ten as ho_ten_khach_hang from khach_hang ;

#9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
# thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as thang, count(*) as so_luong_khach_hang from hop_dong hd group by thang;

# 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
# Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
#  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select  hd.ma_hop_dong as ma_hop_dong,
		hd.ngay_lam_hop_dong as ngay_lam_hop_dong,
        hd.ngay_ket_thuc as ngay_ket_thuc,
        hd.tien_dat_coc as tien_dat_coc,
		hdct.so_luong as so_luong_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong GROUP BY so_luong_dich_vu_di_kem;

#11.Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
# ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select  dvdk.ma_dich_vu_di_kem,
		dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
JOIN hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
JOIN loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
WHERE lk.ma_loai_khach = 1 GROUP BY dvdk.ten_dich_vu_di_kem;

#12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
# so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
# (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
# tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
# nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select  hd.ma_hop_dong, kh.ma_khach_hang,
		nv.ho_ten as ho_ten_nhan_vien,
        kh.ho_ten as ho_ten_khach_hang,
        kh.so_dien_thoai as so_dien_thoai_khach_hang,
        dv.ten_dich_vu,hd.ngay_lam_hop_dong,
   sum(hdct.so_luong) as so_luong,
   sum(hd.tien_dat_coc) as tong_tien_dat_coc
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
where hd.ma_khach_hang in (select hd.ma_khach_hang from hop_dong hd where quarter(hd.ngay_lam_hop_dong) = 4 and year(hd.ngay_lam_hop_dong) = 2020)
and hd.ma_khach_hang not in ( select hd.ma_khach_hang from hop_dong hd where quarter(hd.ngay_lam_hop_dong) in (1,2) and year(hd.ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_khach_hang;

#13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select  dvdk.ma_dich_vu_di_kem,
		dvdk.ten_dich_vu_di_kem,
		sum(hdct.so_luong)
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by ma_dich_vu_di_kem 
having sum(hdct.so_luong)  =(select sum(hdct.so_luong) from hop_dong_chi_tiet hdct
group by  hdct.ma_dich_vu_di_kem   order by sum(hdct.so_luong) desc  limit 1 ) ;

#14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
# Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem,
# so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select  hd.ma_hop_dong,
		ldv.ten_loai_dich_vu,
        dvdk.ten_dich_vu_di_kem,
        dvdk.ma_dich_vu_di_kem as so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where dvdk.ma_dich_vu_di_kem = 1;

# 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
# ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select  hd.ma_nhan_vien,
		nv.ho_ten as ho_ten_nv,
        td.ten_trinh_do as trinh_do,
        bp.ten_bo_phan as bo_phan,
        nv.so_dien_thoai,
        nv.dia_chi,
        count(hd.ma_nhan_vien)
from nhan_vien nv
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2020 and 2021
GROUP BY hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3;

#16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

delete from nhan_vien nv 
where nv.ma_nhan_vien not in
(select hd.ma_nhan_vien from hop_dong hd where year(hd.ngay_lam_hop_dong) between 2019 and 2021);

        
#17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
# chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán
# trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang kh set kh.ma_loai_khach = 1 
where kh.ma_khach_hang in 
(select ma_khach_hang from (select hd.ma_khach_hang  from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and kh.ma_loai_khach = 2
and  (dv.chi_phi_thue + (hdct.so_luong * dvdk.gia)) > 10000000) as return_ma_khach_hang);
 
# 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

DELETE from khach_hang kh
 where kh.ma_khach_hang in (select ma_khach_hang FROM hop_dong WHERE year(ngay_lam_hop_dong)<2021   );


#19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem dvdk set gia = gia*2 where dvdk.ma_dich_vu_di_kem 
in (select asd.ma_dich_vu_di_kem from (select  dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem 
having sum(hdct.so_luong) >= 10) as asd);

#20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
# thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai,
# ngay_sinh, dia_chi.

select  nv.ma_nhan_vien as id,
		nv.ho_ten,
        nv.email,
        nv.so_dien_thoai
from nhan_vien nv
union
select  kh.ma_khach_hang as id,
		kh.ho_ten,
        kh.email,
        kh.so_dien_thoai
from khach_hang kh
        
#21.Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
# và đã từng lập hợp đồng cho một hoặc nhiều  khách_hàng bất kì với ngày lập hợp đồng là “12/12/2019”

 
 #create view v_nhan_vien as select 














