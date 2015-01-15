drop schema prom;
create schema prom;
use prom;

create table group_list(
	group_id varchar(50),
	group_name varchar(50),
	PRIMARY KEY(group_id)
)ENGINE=InnoDB;

create table function_list(
	function_list_id varchar(50),
	function_name varchar(50),
	PRIMARY KEY(function_list_id)
)ENGINE=InnoDB;

create table admin(
	admin_id varchar(50),
	user_name varchar(50),
	email varchar(50),
	admin_password varchar(50),
	PRIMARY KEY (admin_id)
)ENGINE=InnoDB;

create table privilege(
	privilege_id varchar(50),
	function_list_id varchar(50),
	group_id varchar(50),
	create_function bit,
	read_function bit,
	update_function bit,
	delete_function bit,
	PRIMARY KEY(privilege_id),
	FOREIGN KEY(function_list_id) REFERENCES function_list(function_list_id),
	FOREIGN KEY(group_id) REFERENCES group_list(group_id)
)ENGINE=InnoDB;

create table province(
    province_id varchar(50),
    province_name varchar(50),
    PRIMARY KEY(province_id)
)ENGINE=InnoDB;

create table city(
    city_id varchar(50),
    province_id varchar(50),
    city_name varchar(50),
    PRIMARY KEY(city_id),
    FOREIGN KEY(province_id) REFERENCES province(province_id)
)ENGINE=InnoDB;

create table category(
	category_id varchar(50),
	category_name varchar(50),
	PRIMARY KEY(category_id)
)ENGINE=InnoDB;

create table style(
	style_id varchar(50),
	style_name varchar(50),
	PRIMARY KEY(style_id)
)ENGINE=InnoDB;

create table menu_cloth(
	menu_cloth_id varchar(50),
	category_id varchar(50),
	style_id varchar(50),
	PRIMARY KEY(menu_cloth_id),
	FOREIGN KEY(category_id) REFERENCES category(category_id),
	FOREIGN KEY(style_id) REFERENCES style(style_id)
)ENGINE=InnoDB;

create table cloth(
    cloth_id varchar(50),
    category_id varchar(50),
    style_id varchar(50),
    cloth_name varchar(50),
    gender bit,
    price real,
    PRIMARY KEY(cloth_id),
    FOREIGN KEY(category_id) REFERENCES category(category_id),
    FOREIGN KEY(style_id) REFERENCES style(style_id)
)ENGINE=InnoDB;

create table size(
    size_id varchar(50),
    size_name varchar(50),
    PRIMARY KEY(size_id)
)ENGINE=InnoDB;


create table color(
	color_id varchar(50),
	color_name varchar(50),
	PRIMARY KEY(color_id)
)ENGINE=InnoDB;

create table cloth_color(
	cloth_color_id varchar(50),
	color_id varchar(50),
	cloth_id varchar(50),
	PRIMARY KEY(cloth_color_id),
	FOREIGN KEY(cloth_id) REFERENCES cloth(cloth_id),
	FOREIGN KEY(color_id) REFERENCES color(color_id)
)ENGINE=InnoDB;

create table view_side(
	view_side_id varchar(50),
	view_name varchar(50),
	PRIMARY KEY(view_side_id)
)ENGINE=InnoDB;

create table cloth_image(
	image_id varchar(50),
	cloth_id varchar(50),
	color_id varchar(50),
	view_side_id varchar(50),
	image_name varchar(500),
	path varchar(500),
	type_image varchar(50),
	content LONGBLOB,
	size_content int,
	is_main bit,
	is_active bit,
	PRIMARY KEY(image_id),
	FOREIGN KEY(color_id) REFERENCES color(color_id),
	FOREIGN KEY(cloth_id) REFERENCES cloth(cloth_id)
)ENGINE=InnoDB;

create table stock(
	stock_id varchar(50),
	cloth_id varchar(50),
	size_id varchar(50),
	color_id varchar(50),
	stock_count int,
	PRIMARY KEY(stock_id),
	FOREIGN KEY(cloth_id) REFERENCES cloth(cloth_id),
	FOREIGN KEY(size_id) REFERENCES size(size_id),
	FOREIGN KEY(color_id) REFERENCES color(color_id)
)ENGINE=InnoDB;

create table AutoIncrement(
	table_name varchar(50),
	prefix varchar(50),
	count_id int,
	PRIMARY KEY(table_name)
)ENGINE=InnoDB;

create table slider(
	slider_id varchar(50),
	slider_name varchar(500),
	path varchar(500),
	isActive bit,
	slider_full_name varchar(50),
	PRIMARY KEY(slider_id)
)ENGINE=InnoDB;

create table customer(
	customer_id varchar(50),
	FirstName varchar(500),
	LastName varchar(500),
	Address varchar(500),
	zip_code varchar(50),
	Phone varchar(500),
	email varchar(200),
	pass varchar(50),
	PRIMARY KEY(customer_id)
)ENGINE=InnoDB;

create table order_cloth(
	order_cloth_id varchar(50),
	customer_id varchar(50),
	date_order datetime,
	stat varchar(100),
	redeem_code varchar(100),
	PRIMARY KEY(order_cloth_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
)ENGINE=InnoDB;

create table order_detail(
	order_detail_id varchar(50),
	order_cloth_id varchar(50),
	cloth_id varchar(50),
	size_id varchar(50),
	color_id varchar(50),
	qty int,
	price real,
	PRIMARY KEY(order_detail_id),
	FOREIGN KEY(order_cloth_id) REFERENCES order_cloth(order_cloth_id),
	FOREIGN KEY(cloth_id) REFERENCES cloth(cloth_id),
	FOREIGN KEY(size_id) REFERENCES size(size_id),
	FOREIGN KEY(color_id) REFERENCES cloth_color(cloth_color_id)
)ENGINE=InnoDB;

/* ------------------------------ Set Default Value --------------------------------- */

insert into AutoIncrement values('category','ctx',0);
insert into AutoIncrement values('city','cty',0);
insert into AutoIncrement values('cloth','clt',0);
insert into AutoIncrement values('cloth_color','cltc',0);
insert into AutoIncrement values('cloth_image','cltimg',0);
insert into AutoIncrement values('color','clr',0);
insert into AutoIncrement values('customer','cust',0);
insert into AutoIncrement values('order_cloth','orc',0);
insert into AutoIncrement values('order_detail','ord',0);
insert into AutoIncrement values('province','prov',0);
insert into AutoIncrement values('size','sz',0);
insert into AutoIncrement values('slider','sld',0);
insert into AutoIncrement values('stock','stc',0);
insert into AutoIncrement values('style','sty',0);
insert into AutoIncrement values('view_side','vis',0);
insert into AutoIncrement values('menu_cloth','mcl',0);


insert into view_side values('main','Front');
insert into view_side values('lf', 'Left');
insert into view_side values('lr','Right');

insert into category values('baju','Baju');
insert into category values('celana', 'Celana');

insert into style values('kaos','Kaos');
insert into style values('kemeja','Kemeja');
insert into style values('jeans','Jeans');

insert into color values('white', 'White');
insert into color values('blue', 'Blue');
insert into color values('green', 'Green');
