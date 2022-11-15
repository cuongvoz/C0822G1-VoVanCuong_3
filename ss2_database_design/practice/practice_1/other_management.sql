create database quan_li_don_hang;
use quan_li_don_hang;

create table don_vi_DH(
ma_don_vi int,
ten_don_vi varchar(50),
dia_chi varchar(50),
dien_thoai int);

create table don_vi_KH(
ma_don_vi int,
ten_don_vi varchar(50)
);

create table nguoi_dat(
ma_so_nguoi_dat int,
ho_ten_nguoi_dat varchar(50)
);

create table noi_giao(
ma_so_dia_diem_giao int,
ten_noi_giao varchar(50)
);

create table nguoi_nhan(
ma_so_nguoi_nhan int,
ho_ten_nguoi_nhan varchar(50)
);

create table nguoi_giao(
ma_so_nguoi_giao int,
ho_ten_nguoi_giao varchar(50)
);

