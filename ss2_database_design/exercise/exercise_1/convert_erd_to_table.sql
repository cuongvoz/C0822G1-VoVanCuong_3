create database convert_erd_to_table;
use convert_erd_to_table;
create table phieu_xuat(
  so_px int auto_increment primary key, 
  ngay_xuat date
);
create table vat_tu(
  ma_vat_tu int auto_increment primary key, 
  ten_vat_tu varchar(50)
);
create table phieu_nhap(
  so_phieu_nhap int auto_increment primary key, 
  ngay_nhap date
);
create table don_dat_hang(
  so_don_hang int auto_increment primary key, 
  ngay_dat_hang date
);
create table nha_cung_cap(
  ma_nha_cung_cap int auto_increment primary key, 
  ten_nha_cung_cap varchar(50), 
  dia_chi varchar(50), 
  so_dien_thoai int
);
create table chi_tiet_phieu_xuat(
  don_gia_xuat int, 
  so_luong_xuat int, 
  so_phieu_xuat int, 
  ma_vat_tu int, 
  primary key(don_gia_xuat, so_luong_xuat), 
  foreign key(so_phieu_xuat) references phieu_xuat(so_px), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_phieu_nhap(
  don_gia_nhap int, 
  so_luong_nhap int, 
  ma_vat_tu int, 
  so_phieu_nhap int, 
  primary key(don_gia_nhap, so_luong_nhap), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu), 
  foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);
create table chi_tiet_don_dat_hang(
  ma_vat_tu int, 
  so_don_hang int, 
  primary key(ma_vat_tu, so_don_hang), 
  foreign key(ma_vat_tu) references vat_tu(ma_vat_tu), 
  foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);
