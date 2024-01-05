CREATE USER 'mallUser'@'%' IDENTIFIED BY 'livestream:ma6oH';
GRANT ALL PRIVILEGES ON *.* TO 'mallUser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;





create schema mall;

create table t_spec_group
(
    id     int unsigned primary key auto_increment comment '主键',
    spg_id int unsigned not null comment '品类编号',
    `name` varchar(200) not null comment '品类名称',
    unique index unq_spg_id (spg_id),
    unique index unq_name (`name`),
    index idx_spg_id (spg_id)
) comment ='品类表';

INSERT INTO mall.t_spec_group (id, spg_id, name) VALUES (1, 10001, '手机');
INSERT INTO mall.t_spec_group (id, spg_id, name) VALUES (2, 10002, '手机线');
INSERT INTO mall.t_spec_group (id, spg_id, name) VALUES (3, 10003, '手机电池');
INSERT INTO mall.t_spec_group (id, spg_id, name) VALUES (4, 11001, '液晶电视');
INSERT INTO mall.t_spec_group (id, spg_id, name) VALUES (5, 11002, '投影电视');

create table t_spec_param
(
    id        int unsigned primary key auto_increment comment '主键',
    spg_id    int unsigned not null comment '品类编号',
    spp_id    int unsigned not null comment '参数编号',
    `name`    varchar(200) not null comment '参数名称',
    `numeric` tinyint(1)   not null comment '是否为数字参数',
    unit      varchar(200) comment '单位（量词语）',
    generic   tinyint(1)   not null comment '是否为通用参数',
    searching boolean      not null comment '是否用于通用搜素',
    segements varchar(500) comment '参数值',
    index idx_spg_id (spg_id),
    index idx_spp_id (spp_id)
) comment ='参数表';


INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (1, 10001, 1, 'CPU', 0, null, 1, 0, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (2, 10001, 2, '运存', 1, 'GB', 1, 1, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (3, 10001, 3, '内存', 1, 'GB', 1, 1, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (4, 10001, 4, '屏幕尺寸', 1, '英寸', 1, 1, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (5, 10001, 5, '电池', 1, '毫安时', 1, 0, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (6, 11001, 1, '屏幕尺寸', 1, '英寸', 1, 1, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (7, 11001, 2, '长度', 1, '厘米', 1, 0, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (8, 11001, 3, '高度', 1, '厘米', 1, 0, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (9, 11001, 4, '宽度', 1, '厘米', 1, 0, null);
INSERT INTO neti.t_spec_param (id, spg_id, spp_id, name, `numeric`, unit, generic, searching, segements) VALUES (10, 11001, 5, '分辨率', 0, '像素', 1, 1, '720P\\1080P\\4K\\8K');


create table t_brand
(
    id     int unsigned primary key auto_increment comment '主键',
    `name` varchar(200) not null comment '名称',
    image  varchar(500) comment '图片网址',
    letter char(1)      not null comment '单位（量词语）',
    unique unq_name (`name`),
    index idx_letter (letter)
) comment ='品牌表';



create table t_category
(
    id        int unsigned primary key auto_increment comment '主键',
    `name`    varchar(200) not null comment '分类名称',
    parent_id int unsigned comment '上级分类ID',
    if_parent tinyint(1)   not null comment '是否包含下级分类',
    sort      int unsigned not null comment '排名指数',
    index idx_parent_id (parent_id),
    index idx_sort (sort)
) comment ='商品分类表';

create table t_category_brand
(
    category_id int unsigned comment '分类 ID',
    brand_id    int unsigned comment '品牌 ID',
    primary key (category_id, brand_id)
) comment ='分类与品牌关联表';


INSERT INTO neti.t_brand (id, name, image, letter) VALUES (1, '联想', null, 'L');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (2, '华为', null, 'H');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (3, '小米', null, 'A');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (4, '苹果', null, 'A');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (5, 'OPPO', null, 'O');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (6, '三星', null, 'S');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (7, 'LG', null, 'L');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (8, 'vivo', null, 'V');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (9, '飞利浦', null, 'F');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (10, '红米', null, 'H');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (11, 'IMB', null, 'I');
INSERT INTO neti.t_brand (id, name, image, letter) VALUES (12, '戴尔', null, 'D');

INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (1, '手机/数码/配件', null, 1, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (2, '手机通讯', 1, 1, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (3, '手机', 2, 0, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (4, '手机配件', 1, 1, 2);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (5, '移动电源', 4, 0, 5);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (6, '蓝牙耳机', 4, 0, 2);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (7, '保护壳', 4, 0, 3);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (8, '数码配件', 1, 1, 10);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (9, '存储卡', 8, 0, 10);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (10, '读卡器', 8, 0, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (11, '电脑/办公/外设', null, 1, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (12, '电脑整机', 11, 1, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (13, '笔记本', 12, 0, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (14, '台式电脑', 12, 0, 1);
INSERT INTO neti.t_category (id, name, parent_id, if_parent, sort) VALUES (15, '平板电脑', 12, 0, 1);

INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 1);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 2);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 3);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 4);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 5);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 6);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 8);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (3, 10);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (13, 1);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (13, 2);
INSERT INTO neti.t_category_brand (category_id, brand_id) VALUES (13, 12);


create table t_spu
(
    id               int unsigned primary key auto_increment comment '主键',
    title            varchar(200) not null comment '标题',
    sub_title        varchar(200) comment '副标题',
    category_id      int unsigned not null comment '分类ID',
    brand_id         int unsigned comment '品牌ID',
    spg_id           int unsigned comment '品类ID',
    saleable         boolean      not null comment '是否上架',
    valid            boolean      not null comment '是否有效',
    create_time      timestamp    not null default now() comment '添加时间',
    last_update_time timestamp    not null default now() comment '最后修改时间',
    index idx_category_id (category_id),
    index idx_brand_id (brand_id),
    index idx_spg_id (spg_id),
    index idx_saleable (saleable),
    index idx_valid (valid)

) comment ='产品表';


INSERT INTO neti.t_spu (id, title, sub_title, category_id, brand_id, spg_id, saleable, valid, create_time, last_update_time) VALUES (1, '小米9', null, 3, 3, 10001, 1, 1, '2020-05-19 18:53:41', '2020-05-19 18:53:41');


create table t_sku
(
    id               int unsigned primary key auto_increment comment '主键',
    spu_id           int unsigned            not null comment '产品ID',
    title            varchar(200)            not null comment '标题',
    images           json comment '商品图片',
    price            decimal(10, 2) unsigned not null comment '价格',
    param            json                    not null comment '参数',
    num          	int unsigned not null comment '库存数量',
    unit         	varchar(20)  not null comment '库存单位',
    sold_num         	varchar(20)  not null comment '已卖数量',
    saleable         boolean                 not null comment '是否上架',
    valid            boolean                 not null comment '是否有效',
    create_time      timestamp               not null default now() comment '添加时间',
    last_update_time timestamp               not null default now() comment '最后修改时间',
    index idx_spu_id (spu_id),
    index idx_saleable (saleable),
    index idx_valid (valid)
) comment ='商品表';


INSERT INTO neti.t_sku (id, spu_id, title, images, price, param, saleable, valid, create_time, last_update_time) VALUES (1, 1, 'Xiaomi/小米 小米9 8GB+128GB 全息幻彩紫 移动联通电信全网通4G手机', '{"desc": ["http://127.0.0.1/1.jpg", "http://127.0.0.1/2.jpg"], "facade": ["http://127.0.0.1/3.jpg", "http://127.0.0.1/4.jpg"]}', 3299.00, '{"CPU": "骁龙855", "内存": "128", "电池": 4000, "运存": 8, "屏幕尺寸": 6.39}', 1, 1, '2020-05-19 19:17:16', '2020-05-19 19:17:16');
INSERT INTO neti.t_sku (id, spu_id, title, images, price, param, saleable, valid, create_time, last_update_time) VALUES (2, 1, 'Xiaomi/小米 小米9 8GB+128GB 全息幻彩蓝 移动联通电信全网通4G手机', '{"desc": ["http://127.0.0.1/1.jpg", "http://127.0.0.1/2.jpg"], "facade": ["http://127.0.0.1/3.jpg", "http://127.0.0.1/4.jpg"]}', 3299.00, '{"CPU": "骁龙855", "内存": "128", "电池": 4000, "运存": 8, "屏幕尺寸": 6.39}', 1, 1, '2020-05-19 19:17:16', '2020-05-19 19:17:16');
INSERT INTO neti.t_sku (id, spu_id, title, images, price, param, saleable, valid, create_time, last_update_time) VALUES (3, 1, 'Xiaomi/小米 小米9 6GB+128GB 全息幻彩蓝 移动联通电信全网通4G手机', '{"desc": ["http://127.0.0.1/1.jpg", "http://127.0.0.1/2.jpg"], "facade": ["http://127.0.0.1/3.jpg", "http://127.0.0.1/4.jpg"]}', 2999.00, '{"CPU": "骁龙855", "内存": "128", "电池": 4000, "运存": 6, "屏幕尺寸": 6.39}', 1, 1, '2020-05-19 19:17:16', '2020-05-19 19:17:16');
INSERT INTO neti.t_sku (id, spu_id, title, images, price, param, saleable, valid, create_time, last_update_time) VALUES (4, 1, 'Xiaomi/小米 小米9 6GB+128GB 深空灰 移动联通电信全网通4G手机', '{"desc": ["http://127.0.0.1/1.jpg", "http://127.0.0.1/2.jpg"], "facade": ["http://127.0.0.1/3.jpg", "http://127.0.0.1/4.jpg"]}', 2999.00, '{"CPU": "骁龙855", "内存": "128", "电池": 4000, "运存": 6, "屏幕尺寸": 6.39}', 1, 1, '2020-05-19 19:17:16', '2020-05-19 19:17:16');


create table t_state
(
    id       int unsigned primary key auto_increment comment '主键',
    state varchar(200) not null comment '州',
    unique unq_unique (province)
) comment '州表';

create table t_customer
(
    id               int unsigned primary key auto_increment comment '主键',
    username         varchar(200)  not null comment '用户名',
    password         varchar(2000) not null comment '密码(AES加密)',
    avatar           varchar(200) comment '头像地址',
    tel              char(11) comment '手机号',
    cre_time      timestamp     not null default now() comment '添加时间',
    last_mod_time timestamp     not null default now() comment '最后修改时间',
    index idx_username (username),
    unique unq_username (username)
) comment '客户表';


-- aes_encrypt(密码,密钥)，输出的是二进制数据
-- hex 将二进制数据转成 16 进制数据
select hex(aes_encrypt('123456', left('scott123', 7)))

-- 下面这个是解密
select aes_decrypt(unhex('896349E30ED6B4CF0E4354716CA997D9'),left('scott123', 7));


insert into t_customer(username, password, wechat, tel)
values ('jack123',
        hex(aes_encrypt('123456', left('jack123', 7))),
        'jack123',
        '12345678');

create table t_order
(
    id           int unsigned primary key auto_increment comment '主键',
    `code`       varchar(200)            not null comment '流水号',
    type         tinyint unsigned        not null comment '订单类型：1实体销售，2网络销售',
    customer_id  int unsigned comment '会员ID',
    amount       decimal(10, 2) unsigned not null comment '总金额',
    payment_type tinyint unsigned        not null comment '支付方式：1stripe、2信用卡、3微信、4支付宝、5现金',
    `status`     tinyint unsigned        not null comment '状态：1未付款、2已付款、3已发货、4已签收',
    postage      decimal(10, 2) unsigned comment '邮费',
    weight       int unsigned comment '重量：单位克',
    voucher_id   int unsigned comment '购物券ID',
    create_time  timestamp               not null default now(),
    index idx_code (`code`),
    index idx_customer_id (customer_id),
    index idx_status (`status`),
    index idx_create_time (create_time),
    index idx_type (type),
    index idx_shop_id (shop_id),
    unique unq_code (`code`)
) comment '订单表';

create table t_order_detail
(
    order_id     int unsigned            not null comment '订单ID',
    sku_id       int unsigned            not null comment '商品ID',
    price        decimal(10, 2) unsigned not null comment '原价格',
    actual_price decimal(10, 2) unsigned not null comment '实际购买价格',
    num          int unsigned            not null comment '购买数量',
    primary key (order_id, sku_id)
) comment '订单详情表'




INSERT INTO neti.t_order (id, code, type, shop_id, customer_id, amount, payment_type, status, postage, weight, voucher_id, create_time) VALUES (1, 'CX0000000120160522', 1, 3, 1, 2999.00, 5, 2, null, null, null, '2020-05-19 23:14:10');

INSERT INTO neti.t_order_detail (order_id, sku_id, price, actual_price, num) VALUES (1, 3, 2999.00, 2999.00, 1);

create table t_customer_address
(
    id          int unsigned primary key auto_increment comment '主键',
    customer_id int unsigned not null comment '客户ID',
    name        varchar(200) not null comment '收货人姓名',
    tel         char(11) comment '收货人手机号',
    address     varchar(200) not null comment '收货地址',
    prime       boolean      not null comment '是否用当前地址记录作为默认收货地址',
    index idx_customer_id (customer_id)
) comment '客户表收货地址表';

INSERT INTO neti.t_customer_address (id, customer_id, name, tel, address, prime) VALUES (1, 1, '陈浩', '12345678901', '辽宁省大连市高兴区6号9#11-1', 1);
INSERT INTO neti.t_customer_address (id, customer_id, name, tel, address, prime) VALUES (2, 2, '李娜', '12345678902', '辽宁省大连市沙盒口区星月街17号2#1-3', 0);


create table t_role
(
    id   int unsigned primary key auto_increment not null comment '主键',
    role varchar(20)              not null comment '角色名称',
    unique unq_role(role)
) comment ='角色表';
-- 在字段声明中使用 unique，mysql 会自动创建 unique 的索引，不过名称则是字段名，
-- 所以一般还是我们自己手动定义名称

create table t_user
(
    id               int unsigned primary key auto_increment not null comment '主键',
    username         varchar(200)                            not null comment '用户名',
    `password`       varchar(200)                            not null comment '密码（AES加密）',
    emp_id           int unsigned                            not null comment '员工ID',
    role_id          int unsigned                            not null comment '角色ID',
    `status`         tinyint unsigned                        not null comment '状态：1可用、2禁用',
    create_time      timestamp                               not null default now() comment '添加时间',
    last_update_time timestamp                               not null default now() comment '最后修改时间',
    unique unq_username (username),
    index idx_username (username),
    index idx_emp_id (emp_id),
    index idx_role_id (role_id),
    index idx_status (`status`)
) comment ='用户表';


create table t_delivery
(
    id           int unsigned primary key auto_increment not null comment '主键',
    order_id     int unsigned                            not null comment '订单ID',
    sku          json                                    not null comment '商品',
    postid       int unsigned                            not null comment '快递单号',
    price        decimal(10, 2) unsigned                 not null comment '快递费',
    address_id   int unsigned                            not null comment '收货地址ID',
    ecp          tinyint unsigned                        not null comment '快递公司编号',
    create_time  timestamp                               not null default now() comment '添加时间',
    index idx_order_id (order_id),
    index idx_postid (postid),
    index idx_address_id (address_id),
    index idx_ecp (ecp)
) comment ='快递表';


INSERT INTO neti.t_delivery (id, order_id, sku, postid, price, address_id, ecp, create_time) VALUES (1, 2, '[3, 3]',12333334, 60.00, 1, 1, '2020-05-20 07:38:10');

create table t_follow
(
    id           int unsigned primary key auto_increment not null comment '主键',
    user_id     int unsigned                            not null comment '关注者',
    follow_user_id          int unsigned                not null comment '被关注者',
    status       char(1) unsigned                       not null comment '是否取关',
    price        decimal(10, 2) unsigned                 not null comment '快递费',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '取关时间',
    index idx_order_id (user_id)
) comment ='关注表';


create table t_notification
(
    id           int unsigned primary key auto_increment not null comment '主键',
    type     char unsigned                            not null comment '通知类型',
    user_id     int unsigned                            not null comment '用户',
    user_name          varchar(200) unsigned                not null comment '用户姓名',
    user_avatar       varchar(200) unsigned                       not null comment '用户头像',
    content       varchar(200) unsigned                       not null comment '内容',
    is_read       char(1) unsigned                       not null comment '是否阅读',
    is_del       char(1) unsigned                       not null comment '是否删除',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_order_id (user_id)
) comment ='通知表';


create table t_cart
(
    id           int unsigned primary key auto_increment not null comment '主键',
    customer_id     int unsigned                            not null comment '用户',
    sku_id     int unsigned                            not null comment '商品',
    sku_num     int unsigned                            not null comment '商品数量',
    sku_title          varchar(200) unsigned                not null comment '商品标题',
    sku_img_url       varchar(200) unsigned                       not null comment '商品图片',
    content       varchar(200) unsigned                       not null comment '内容',
    sku_price            decimal(10, 2) unsigned not null comment '价格',
    saleable         boolean                 not null comment '是否上架',
    valid            boolean                 not null comment '是否有效',
    is_del       char(1) unsigned                       not null comment '是否删除',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_order_id (user_id)
) comment ='购物车表';


create table t_post
(
    id           int unsigned primary key auto_increment not null comment '主键',
    customer_id     int unsigned                            not null comment '用户',
    title          varchar(200) unsigned                not null comment '帖子标题',
    content       varchar(200) unsigned                       not null comment '内容',
    sku_link_url       varchar(200) unsigned                       not null comment '商品链接',
    collect_num     int unsigned                            not null comment '收藏数',
    like_num     int unsigned                            not null comment '点赞数',
    comment_num     int unsigned                            not null comment '评论数',
   	img_url         json unsigned                            not null comment '帖子图片',
    is_del       boolean unsigned                       not null comment '是否删除',
    post_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_post_id (user_id)
) comment ='帖子表';

create table t_comment
(
    id           int unsigned primary key auto_increment not null comment '主键',
    post_id     int unsigned                            not null comment '帖子',
    customer_id     int unsigned                            not null comment '用户',
    content       varchar(200) unsigned                       not null comment '内容',
    parent_id     int unsigned                            not null comment '父级id'
    like_num     int unsigned                            not null comment '点赞数',
    is_author       boolean unsigned                       not null comment '是否作者',
    is_del       boolean unsigned                       not null comment '是否删除',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_comment_id (post_id)
) comment ='帖子评论表';


create table t_collection
(
    id           int unsigned primary key auto_increment not null comment '主键',
    post_id     int unsigned                            not null comment '帖子',
    customer_id     int unsigned                            not null comment '用户',
    status       boolean unsigned                       not null comment '是否收藏',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_collection_id (post_id)
) comment ='帖子收藏';


create table t_like
(
    id           int unsigned primary key auto_increment not null comment '主键',
    post_id     int unsigned                            not null comment '帖子',
    customer_id     int unsigned                            not null comment '用户',
    status       boolean unsigned                       not null comment '是否收藏',
    cre_time  timestamp                               not null default now() comment '添加时间',
    mod_time  timestamp                               not null default now() comment '修改时间',
    index idx_collection_id (post_id)
) comment ='帖子点赞';

create table t_bank(
	id           int unsigned primary key auto_increment not null comment '主键',
	bank_name       varchar(32) unsigned                       not null comment '银行名',
	value       varchar(32) unsigned                       not null comment '银行值',
);

--mall_follow (id, user_id,follow_user_id,status,cre_time,mod_time);
--mall_notification(id,type,user_id,user_name,user_avatar,content,is_read,is_del,cre_time,mod_time);
--mall_cart(id,user_id,product_id,product_num,product_name,product_img_url,product_status,remark,cre_time,product_price,is_del,cre_time,mod_time);
--mall_post(id,user_id,title,content,goods_link,collect_num,like_num,comment_num,post_time,mod_time,is_del);
--mall_post_img(id,post_id,img_url);
--mall_comment(id,post_id,parent_id,user_id,content,is_author,cre_time,mod_time,like_num,is_del);
--mall_collection(id,user_id,post_id,status,cre_time,mod_time);
--mall_like(id,user_id,post_id,cre_time,status,cre_time,mod_time);



