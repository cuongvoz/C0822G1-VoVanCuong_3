use furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có 
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự
select * from nhan_vien where ho_ten like 'H%' or ho_ten like 'T%' ;

-- 3. 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 
-- 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT ho_ten, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), ngay_sinh)), '%Y') + 0 AS tuoi,dia_chi
FROM khach_hang where DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), ngay_sinh)), '%Y') + 0 between 18 and 50
and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.ma_khach_hang,k.ho_ten, count(h.ma_khach_hang) as 'so_lan_dat_phong'
 from khach_hang k join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
join hop_dong h on h.ma_khach_hang = k.ma_khach_hang 
where l.ten_loai_khach like 'Diamond'
group by k.ho_ten order by count(h.ma_khach_hang);
  
 -- 55.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu,
 -- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
 -- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
 -- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
 select k.ma_khach_hang,k.ho_ten,l.ten_loai_khach,h.ma_hop_dong,d.ten_dich_vu,h.ngay_lam_hop_dong,h.ngay_ket_thuc
 , (ifnull(d.chi_phi_thue,0) + sum(ifnull(hd.so_luong,0) * ifnull(dv.gia,0 )) ) as "tổng tiền"
 from khach_hang k left join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
 left join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
 left join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
 left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
 left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem
 group by h.ma_hop_dong, k.ma_khach_hang ;
 

  