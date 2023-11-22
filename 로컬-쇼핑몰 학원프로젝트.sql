
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
    


create table members (
    members_idx        number              DEFAULT member_sequence.nextval primary key,
    members_id         varchar2(30)        UNIQUE not null,
    members_password         varchar2(50)        not null,
    members_nickname         varchar2(100)       UNIQUE not null,
    members_email            varchar2(100)       not null,
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

create table categories (
    categories_idx      number          DEFAULT category_sequence.nextval PRIMARY key not null,
    categories_name    varchar2(100)   not null
);

create table admins (
    admins_idx        number          DEFAULT admin_sequence.nextval primary key not null,
    admins_username  varchar2(100)   UNIQUE,
    admins_password  varchar2(100)   not null,
    admins_name      varchar2(100)   not null
);

create table products (
    products_idx       number          DEFAULT product_sequence.nextval primary key not null,
    products_name     varchar2(300)   UNIQUE not null,
    products_image_url        varchar2(500)   not null,
    products_description      varchar2(500)   not null,
    products_price            number          not null,
    products_registration_date date            DEFAULT sysdate not null,
    products_stock            number          not null,
    products_is_deleted       varchar2(1)     DEFAULT 'N',

    categories_idx      number          not null,
    CONSTRAINT fk_categories_idx FOREIGN key(categories_idx) 
    REFERENCES categories (categories_idx) on delete CASCADE
);

create table orders (
    orders_idx           number          DEFAULT order_sequence.nextval primary key not null,
    orders_total_amount       number          not null,
    orders_date         date            DEFAULT sysdate not null,
    orders_status       varchar2(100)   DEFAULT 'Preparing',
    orders_recipient_name     varchar2(50)    not null,
    orders_recipient_address  varchar2(300)   not null,
    orders_detailed_address   varchar2(300)   not null,
    orders_recipient_phone    varchar2(13)    not null,
    orders_delivery_notes     varchar2(300),
    orders_total_quantity     number          not null,
    
    products_idx         number          not null,
    CONSTRAINT fk_products_idx FOREIGN KEY(products_idx)
    REFERENCES products(products_idx) on delete CASCADE,
    
    members_idx          number          not null,
    CONSTRAINT fk_members_idx FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE
);

create table inquiries (
    inquiries_idx         number                  DEFAULT inquiry_sequence.nextval primary key not null,
    inquiries_title              varchar2(200)           not null,
    inquiries_registration_date  date                    DEFAULT sysdate not null,
    inquiries_content            varchar2(500)           not null,
    inquiries_image_url          varchar2(500),
    inquiries_category           varchar2(10)            not null,
    
    products_idx         number                  not null,
    CONSTRAINT fk_inquiries_products_idx FOREIGN KEY(products_idx) 
    REFERENCES products(products_idx) on delete CASCADE,
    
    members_idx          number                  not null,
    CONSTRAINT fk_inquiries_members_idx FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE
);


create table favorites (
    products_idx         number              not null,
    members_idx          number              not null,
    favorites_idx        number              DEFAULT favorites_sequence.nextval unique not null,
    
    PRIMARY key (products_idx, members_idx),
   
    CONSTRAINT fk_favorites_products_idx FOREIGN KEY(products_idx) 
    REFERENCES products(products_idx) on delete CASCADE,
    
    CONSTRAINT fk_favorites_members_idx FOREIGN KEY(members_idx) 
    REFERENCES members(members_idx) on delete CASCADE
);

create table cart (
    cart_idx            number      DEFAULT cart_sequence.nextval primary key not null,
    added_date         date        DEFAULT sysdate not null,
    quantity           number      not null,
    
    products_idx         number      not null,
    CONSTRAINT fk_cart_products_idx FOREIGN KEY(products_idx)
    REFERENCES products(products_idx) on delete CASCADE,
    
    members_idx          number      not null,
    CONSTRAINT fk_cart_members_idx FOREIGN KEY(members_idx)
    REFERENCES members(members_idx) on delete CASCADE
);


-- 회원 데이터
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user1', '1234', 'nick1', 'user1@example.com', 'Address 1', 'Detailed Address 1', '010-0000-0001', 'Name1', 1234567890);
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user2', '12345', 'nick2', 'user2@example.com', 'Address 2', 'Detailed Address 2', '010-0000-0002', 'Name2', 1234567891);
INSERT INTO members (members_id, members_password, members_nickname, members_email, members_address, members_detailed_address, members_phone_number, members_name, members_ssn) 
VALUES ('user3', '123456', 'nick3', 'user3@example.com', 'Address 3', 'Detailed Address 3', '010-0000-0003', 'Name3', 1234567892);

-- 카테고리 데이터
INSERT INTO categories (categories_name) VALUES ('Electronics');
INSERT INTO categories (categories_name) VALUES ('Clothing');
INSERT INTO categories (categories_name) VALUES ('Furniture');


-- 관리자 데이터
INSERT INTO admins (admins_username, admins_password, admins_name)
VALUES ('admin1', 'adminpass1', 'Admin One');
INSERT INTO admins (admins_username, admins_password, admins_name) 
VALUES ('admin2', 'adminpass2', 'Admin Two');
INSERT INTO admins (admins_username, admins_password, admins_name)
VALUES ('admin3', 'adminpass3', 'Admin Three');


-- 상품 데이터
INSERT INTO products (products_name, products_image_url, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 1', 'image1.jpg', 'Description 1', 1000, 10, 1);
INSERT INTO products (products_name, products_image_url, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 2', 'image2.jpg', 'Description 2', 2000, 20, 2);
INSERT INTO products (products_name, products_image_url, products_description, products_price, products_stock, categories_idx) 
VALUES ('Product 3', 'image3.jpg', 'Description 3', 3000, 30, 3);


-- 주문 데이터
INSERT INTO orders (orders_total_amount, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, orders_total_quantity, products_idx, members_idx) 
VALUES (1000, 'Recipient 1', 'Address 1', 'Detailed Address 1', '010-0000-0001', 1, 1, 1);
INSERT INTO orders (orders_total_amount, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, orders_total_quantity, products_idx, members_idx) 
VALUES (2000, 'Recipient 2', 'Address 2', 'Detailed Address 2', '010-0000-0002', 2, 2, 2);
INSERT INTO orders (orders_total_amount, orders_recipient_name, orders_recipient_address, orders_detailed_address, orders_recipient_phone, orders_total_quantity, products_idx, members_idx)
VALUES (3000, 'Recipient 3', 'Address 3', 'Detailed Address 3', '010-0000-0003', 3, 3, 3);


-- 문의 데이터
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('Inquiry 1', 'Content 1', 'Category 1', 1, 1);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('Inquiry 2', 'Content 2', 'Category 2', 2, 2);
INSERT INTO inquiries (inquiries_title, inquiries_content, inquiries_category, products_idx, members_idx) 
VALUES ('Inquiry 3', 'Content 3', 'Category 3', 3, 3);



-- 찜 데이터
INSERT INTO favorites (products_idx, members_idx) VALUES (1, 1);
INSERT INTO favorites (products_idx, members_idx) VALUES (2, 2);
INSERT INTO favorites (products_idx, members_idx) VALUES (3, 3);


-- 장바구니 데이터
INSERT INTO cart (quantity, products_idx, members_idx) 
VALUES (1, 1, 1); -- 회원 1이 상품 1을 1개 장바구니에 추가
INSERT INTO cart (quantity, products_idx, members_idx) 
VALUES (2, 2, 2); -- 회원 2이 상품 2을 1개 장바구니에 추가
INSERT INTO cart (quantity, products_idx, members_idx) 
VALUES (3, 3, 3); -- 회원 3이 상품 3을 3개 장바구니에 추가


commit;













