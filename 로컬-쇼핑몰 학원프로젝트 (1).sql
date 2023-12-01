-- 테이블 전체 삭제
drop table cart;
drop table favorites;
drop table inquiries;
drop table ordersd_details;
drop table orders;
drop table products_size;
drop table size_table;
drop table products_color;
drop table products_img;
drop table color;
drop table products;
drop table admins;
drop table categories;
drop table members;

-- 시퀀스 전체 삭제
drop SEQUENCE member_sequence;
drop SEQUENCE member_shipping_sequence;
drop SEQUENCE product_sequence;
drop SEQUENCE category_sequence;
drop SEQUENCE inquiry_sequence;
drop SEQUENCE favorites_sequence;
drop SEQUENCE order_sequence;
drop SEQUENCE cart_sequence;
drop SEQUENCE admin_sequence;
drop SEQUENCE color_sequence;
drop SEQUENCE size_sequence;
drop SEQUENCE order_details_sequence;
drop SEQUENCE products_img_sequence;

-- 전체 시퀀스
create SEQUENCE member_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;

create SEQUENCE member_shipping_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE product_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE category_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE inquiry_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE favorites_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    
    create SEQUENCE order_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    
    create SEQUENCE order_details_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    
    create SEQUENCE cart_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
     create SEQUENCE admin_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE color_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE size_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    create SEQUENCE products_img_sequence
    INCREMENT by 1
    start with 1
    MINVALUE 1
    MAXVALUE 9999999999999
    nocache;
    
    

-- 회원 테이블
create table members (
    members_idx        number              DEFAULT member_sequence.nextval primary key,
    members_id         varchar2(30)        UNIQUE not null,
    members_password         varchar2(50)        not null,
    members_nickname         varchar2(100)       UNIQUE not null,
    members_email            varchar2(100)       UNIQUE not null,
    members_address          varchar2(300)       not null,
    members_detailed_address varchar2(300)       not null,
    members_phone_number     varchar2(13)        not null,
    members_name             varchar2(50)        not null,
    members_ssn              number              not null,
    members_is_withdrawn     varchar2(1)         DEFAULT 'N',
    members_points           number              DEFAULT 0,
    members_join_date        date                DEFAULT sysdate
);

-- ALTER TABLE members
-- ADD join_date DATE DEFAULT sysdate;

-- 카테고리 테이블
-- 상위 카테고리가 존재 하고
-- 하위 카테고리는 parentcategotyid 를 받는다.
create table categories (
    categories_idx      number          DEFAULT category_sequence.nextval PRIMARY key not null,
    categories_name    varchar2(255)    UNIQUE not null,
    parentcategoty_idx    number,  
    
    FOREIGN KEY (parentcategoty_idx) REFERENCES Categories(categories_idx)
);

-- 관리자 테이블
create table admins (
    admins_idx        number          DEFAULT admin_sequence.nextval primary key not null,
    admins_username  varchar2(100)   UNIQUE,
    admins_password  varchar2(100)   not null,
    admins_name      varchar2(100)   not null
);

-- 상품 테이블
create table products (
    products_idx       number          DEFAULT product_sequence.nextval primary key not null,
    products_name     varchar2(300)   UNIQUE not null,
    products_description      varchar2(500)   not null,
    products_price            number          not null,
    products_registration_date date            DEFAULT sysdate not null,
    products_stock            number          not null,
    products_is_deleted       varchar2(1)     DEFAULT 'N',

    categories_idx      number          not null,
    FOREIGN key(categories_idx) 
    REFERENCES categories (categories_idx) on delete CASCADE
);

-- 상품 색상 테이블
create table color(
    color_idx   number          DEFAULT color_sequence.nextval primary key not null,
    color       VARCHAR2(50)    not null
);

-- 상품 색상 관계 테이블
create table products_color(
    products_idx    number      not null,
    FOREIGN key(products_idx) 
    REFERENCES products (products_idx) on delete CASCADE,
    
    color_idx        number       not null,
    FOREIGN key(color_idx) 
    REFERENCES color (color_idx) on delete CASCADE,
    
    PRIMARY key (products_idx,color_idx) 
);

-- 상품 사이즈 테이블
create table size_table(
    size_idx            number          DEFAULT size_sequence.nextval primary key not null,
    size_product       VARCHAR2(50)    not null
);

-- 상품 사이즈 관계 테이블
create table products_size(
    products_idx    number      not null,
    FOREIGN key(products_idx) 
    REFERENCES products (products_idx) on delete CASCADE,
    
    size_idx        number       not null,
    FOREIGN key(size_idx) 
    REFERENCES size_table (size_idx) on delete CASCADE,
    
    PRIMARY key (products_idx,size_idx) 
);

-- 상품 이미지 테이블
create table products_img(
    products_img_idx           number          DEFAULT products_img_sequence.nextval primary key not null,
    
    products_idx    number      not null,
    FOREIGN key(products_idx) 
    REFERENCES products (products_idx) on delete CASCADE,

    img_url         varchar2(500)   not null
 
);



-- 주문 테이블
create table orders (
    orders_idx           number          DEFAULT order_sequence.nextval primary key not null,
    orders_date         date            DEFAULT sysdate not null,
    orders_status       varchar2(100)   DEFAULT '배송 준비중',
    orders_recipient_name     varchar2(50)    not null,
    orders_recipient_address  varchar2(300)   not null,
    orders_detailed_address   varchar2(300)   not null,
    orders_recipient_phone    varchar2(13)    not null,
    orders_delivery_notes     varchar2(300),
    orders_total_price       number          not null,
    
    members_idx          number          not null,
    FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE
);

-- 주문 상세 테이블
-- 각 주문에 포함된 상품들에 대한 세부사항
create table ordersd_details(
    ordersd_details      number      DEFAULT order_details_sequence.nextval primary key not null,
    quantity            number       not null,
    
    orders_idx         number          not null,
    FOREIGN KEY(orders_idx)
    REFERENCES orders(orders_idx) on delete CASCADE,

    products_idx         number          not null,
    FOREIGN KEY(products_idx)
    REFERENCES products(products_idx) on delete CASCADE,
    
    color_idx         number          not null,
    FOREIGN KEY(color_idx)
    REFERENCES color(color_idx) on delete CASCADE,
    
    size_idx        number          not null,
    FOREIGN KEY (size_idx) REFERENCES size_table (size_idx)
    
);

-- 문의 테이블
-- inquiries_category 여기에 상품문의 or 구매후기 or 입금배송문의 or 교환반품문의 
-- 4개중 한개로 데이터를 받아야 한다.
create table inquiries (
    inquiries_idx         number                  DEFAULT inquiry_sequence.nextval primary key not null,
    inquiries_title              varchar2(200)           not null,
    inquiries_registration_date  date                    DEFAULT sysdate not null,
    inquiries_content            varchar2(500)           not null,
    inquiries_image_url          varchar2(500),
    inquiries_category           varchar2(100)            not null,
    
    products_idx         number                  not null,
    FOREIGN KEY(products_idx) 
    REFERENCES products(products_idx) on delete CASCADE,
    
    members_idx          number                  not null,
    FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE
);

-- 찜 테이블
create table favorites (
    favorites_idx        number              DEFAULT favorites_sequence.nextval PRIMARY key not null,
    products_idx         number              not null,
    members_idx          number              not null,
    
    UNIQUE(products_idx, members_idx),
   
    FOREIGN KEY(products_idx) 
    REFERENCES products(products_idx) on delete CASCADE,
    
    FOREIGN KEY(members_idx) 
    REFERENCES members(members_idx) on delete CASCADE
);

-- 장바구니 테이블
create table cart (
    cart_idx            number      DEFAULT cart_sequence.nextval primary key not null,
    added_date         date        DEFAULT sysdate not null,
    quantity           number      not null,
    
    products_idx         number      not null,
    FOREIGN KEY(products_idx)
    REFERENCES products(products_idx) on delete CASCADE,
    
    members_idx          number      not null,
    FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE,
    
    color_idx         number          not null,
    FOREIGN KEY(color_idx)
    REFERENCES color(color_idx) on delete CASCADE,
    
    size_idx        number          not null,
    FOREIGN KEY (size_idx) REFERENCES size_table (size_idx)
);


-- 회원 데이터
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user1', '1234', 'nick1', 'user1@example.com', 'Address 1', 'Detailed Address 1', '010-0000-0001', 'Name1', 1234567890);
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user2', '12345', 'nick2', 'user2@example.com', 'Address 2', 'Detailed Address 2', '010-0000-0002', 'Name2', 1234567891);
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user3', '123456', 'nick3', 'user3@example.com', 'Address 3', 'Detailed Address 3', '010-0000-0003', 'Name3', 1234567892);

-- 상위 카테고리 데이터
INSERT INTO categories (categories_name) VALUES ('아우터');
INSERT INTO categories (categories_name) VALUES ('상의');
INSERT INTO categories (categories_name) VALUES ('하의');
INSERT INTO categories (categories_name) VALUES ('악세사리');

-- 상위 카테고리 데이터
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('자켓',1);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('점퍼',1);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('코트',1);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('패딩',1);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('무스탕',1);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('레더',1);

INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('셔츠',2);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('티셔츠',2);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('맨투맨',2);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('후드티',2);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('후드집업',2);

INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('팬츠',3);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('데님',3);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('슬랙스',3);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('카고팬츠',3);

INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('벨트',4);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('가방',4);
INSERT INTO categories (categories_name, parentcategoty_idx) VALUES ('머플러',4);

-- 관리자 데이터
INSERT INTO admins (admins_username, admins_password, admins_name)
VALUES ('admin1', 'adminpass1', 'Admin One');
INSERT INTO admins (admins_username, admins_password, admins_name) 
VALUES ('admin2', 'adminpass2', 'Admin Two');
INSERT INTO admins (admins_username, admins_password, admins_name)
VALUES ('admin3', 'adminpass3', 'Admin Three');


-- 상품 데이터
INSERT INTO products (products_name, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 1', 'Description 1', 1000, 10, 1);
INSERT INTO products (products_name, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 2', 'Description 2', 2000, 20, 2);
INSERT INTO products (products_name, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 3', 'Description 3', 3000, 30, 3);

-- 상품 색상 데이터
insert into color(color) values('red');
insert into color(color) values('blue');
insert into color(color) values('black');

-- 상품 색상 관계 데이터
insert into products_color (products_idx, color_idx) values(1,1);
insert into products_color (products_idx, color_idx) values(1,2);
insert into products_color (products_idx, color_idx) values(1,3);
insert into products_color (products_idx, color_idx) values(2,1);
insert into products_color (products_idx, color_idx) values(2,2);
insert into products_color (products_idx, color_idx) values(2,3);
insert into products_color (products_idx, color_idx) values(3,1);
insert into products_color (products_idx, color_idx) values(3,2);
insert into products_color (products_idx, color_idx) values(3,3);

-- 상품 사이즈 데이터
insert into size_table(size_product) values('S');
insert into size_table(size_product) values('M');
insert into size_table(size_product) values('L');
insert into size_table(size_product) values('XL');

-- 상품 사이즈 관계 데이터
insert into products_size (products_idx, size_idx) values(1,1);
insert into products_size (products_idx, size_idx) values(1,2);
insert into products_size (products_idx, size_idx) values(1,3);
insert into products_size (products_idx, size_idx) values(1,4);
insert into products_size (products_idx, size_idx) values(2,1);
insert into products_size (products_idx, size_idx) values(2,2);
insert into products_size (products_idx, size_idx) values(2,3);
insert into products_size (products_idx, size_idx) values(2,4);
insert into products_size (products_idx, size_idx) values(3,1);
insert into products_size (products_idx, size_idx) values(3,2);
insert into products_size (products_idx, size_idx) values(3,3);
insert into products_size (products_idx, size_idx) values(3,4);

-- 상품 이미지 데이터
insert into products_img (products_idx , img_url) values(1,'url 정보');


-- 주문 데이터
INSERT INTO orders (orders_total_price, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, members_idx) 
VALUES (5000, '홍길동', '서울시 강남구 강남대로 123', '아파트 101호', '010-1234-5678', 1);

INSERT INTO orders (orders_total_price, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, members_idx) 
VALUES (10000, '김철수', '서울시 서초구 서초대로 456', '빌라 202호', '010-2345-6789', 2);

INSERT INTO orders (orders_total_price, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, members_idx) 
VALUES (15000, '이영희', '서울시 송파구 송파대로 789', '연립주택 303호', '010-3456-7890', 3);


-- 주문 상세 데이터
INSERT INTO ordersd_details (quantity, orders_idx, products_idx, color_idx, size_idx) 
VALUES (1, 1, 1, 1, 1);

INSERT INTO ordersd_details (quantity, orders_idx, products_idx, color_idx, size_idx) 
VALUES (2, 1, 2, 2, 2);

INSERT INTO ordersd_details (quantity, orders_idx, products_idx, color_idx, size_idx) 
VALUES (2, 2, 2, 2, 2);

INSERT INTO ordersd_details (quantity, orders_idx, products_idx, color_idx, size_idx) 
VALUES (3, 3, 3, 3, 3);


-- 문의 데이터
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('상품문의', 'Content 1', '상품문의', 1, 1);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('구매후기', 'Content 1', '구매후기', 1, 1);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('입금배송문의', 'Content 1', '입금배송문의', 1, 1);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('교환반품문의', 'Content 1', '교환반품문의', 1, 1);

INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('Inquiry 2', 'Content 2', '구매후기', 2, 2);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('Inquiry 3', 'Content 3', '입금배송문의', 3, 3);



-- 찜 데이터
INSERT INTO favorites (products_idx, members_idx) VALUES (1, 1);
INSERT INTO favorites (products_idx, members_idx) VALUES (2, 2);
INSERT INTO favorites (products_idx, members_idx) VALUES (3, 3);


-- 장바구니 데이터
INSERT INTO cart (quantity, products_idx, members_idx, color_idx, size_idx) 
VALUES (1, 1, 1, 1, 1);

INSERT INTO cart (quantity, products_idx, members_idx, color_idx, size_idx) 
VALUES (2, 2, 1, 3, 2);

INSERT INTO cart (quantity, products_idx, members_idx, color_idx, size_idx) 
VALUES (2, 2, 2, 2, 2);

INSERT INTO cart (quantity, products_idx, members_idx, color_idx, size_idx) 
VALUES (3, 3, 3, 3, 3);



commit;













