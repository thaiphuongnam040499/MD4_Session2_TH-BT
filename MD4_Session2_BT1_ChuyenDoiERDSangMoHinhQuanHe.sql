create database DonHang;
use DonHang;
create table phieuXuat(
soPx int auto_increment primary key,
ngayXuat datetime
);
create table vatTu(
maVT int auto_increment primary key,
tenVT varchar(255)
);
create table PhieuNhap(
SoPN int primary key,
NgayNhap datetime
);

create table DonDH(
SoDH int auto_increment primary key,
NgayĐH datetime
);
create table NhaCC(
MaNCC int auto_increment primary key,
TenNCC varchar(255) not null,
DiaChi varchar(255) not null,
SĐT varchar(10) not null
);
create table ChiTietPhieuXuat(
DGXuat float,
SLXUAT int,
maVT int,
SoPx int,
foreign key (maVT) references vatTu(maVT),
foreign key (SoPx) references phieuXuat(soPx)
);


create table ChiTietPhieuNhap(
DGNhap float,
SLNhap int,
maVT int,
SoPN int,
foreign key (maVT) references vatTu(maVT),
foreign key (SoPN) references PhieuNhap(SoPN)
);

create table ChiTietDonDatHang(
maVT int,
SoDH int,
foreign key (maVT) references vatTu(maVT),
foreign key (SoDH) references DonDH(SoDH)
);


create table CungCap(
MaNCC int,
SoDH int,
foreign key (SoDH) references DonDH(SoDH),
foreign key (MaNCC) references NhaCC(MaNCC)
);


