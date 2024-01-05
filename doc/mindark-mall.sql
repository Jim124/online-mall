CREATE TABLE t_role (
role_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT     COMMENT '角色ID',
role VARCHAR(20) NOT NULL                                               COMMENT '角色名称',

UNIQUE unq_role (role)
) comment = '角色表';

CREATE TABLE t_user (
user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '管理员ID',
employee_id VARCHAR(200) NOT NULL                               COMMENT '员工ID',
role_id INT UNSIGNED NOT NULL                                       COMMENT '管理员角色ID',
username VARCHAR(200) NOT NULL                                  COMMENT '管理员名称',
phone_no CHAR(20) NOT NULL                                          COMMENT '管理员手机号',
`password` VARCHAR(200) NOT NULL                                COMMENT '管理员账号密码',
`status` TINYINT UNSIGNED NOT NULL                          COMMENT '管理员帐号状态： 1可用、2禁用',
created_time TIMESTAMP NOT NULL DEFAULT NOW()       COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()       COMMENT '修改时间',

UNIQUE unq_username (username),

index idx_username (username),
index idx_employeeID (employee_id),
index idx_roleID (role_id),
index idx_status (`status`)

) comment = '管理员表';

CREATE TABLE t_category(
category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '类别ID',
spg_id INT UNSIGNED NOT NULL                                                COMMENT '品类编号ID',
`name` VARCHAR(200) NOT NULL                                                COMMENT '类别名称',
category_img VARCHAR(200) NOT NULL                                  COMMENT '类别照片'
) COMMENT = '类别表';

CREATE TABLE t_brand(
brand_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY    COMMENT '品牌ID',
`name` VARCHAR(200) NOT NULL                                            COMMENT '品牌名称',
image VARCHAR(200) NOT NULL                                             COMMENT '品牌照片',
letter char(1) NOT NULL                                                     COMMENT '品牌首字母'
) COMMENT = '品牌表';

CREATE TABLE t_inventory (
inventory_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT    COMMENT '商品库存ID',
category_id INT UNSIGNED    NOT NULL                                        COMMENT '品类ID',
brand_id  INT UNSIGNED NOT NULL                                             COMMENT '品牌ID', 
sub_category_id INT UNSIGNED    NOT NULL                                COMMENT '副品类ID',
spg_id INT UNSIGNED NOT NULL                                                    COMMENT '品类编号ID',
title VARCHAR(200) NOT NULL                                                     COMMENT '商品标题',
subtitle VARCHAR(200)                                                               COMMENT '商品副标题',
images JSON NOT NULL                                                                    COMMENT '商品展示图',
price_min DECIMAL(10,2) DEFAULT 0                                                       COMMENT '价格下限',
price_max DECIMAL(10,2) DEFAULT 0                                                       COMMENT '价格上限',
--param json NOT NULL                                                                       COMMENT '商品规格',
sold_quantity INT UNSIGNED NOT NULL DEFAULT 0               COMMENT '商品销量',
saleable BOOLEAN DEFAULT FALSE                                              COMMENT '是否上架',
position INT UNSIGNED NOT NULL DEFAULT 0                    COMMENT '新上架商品排位：1. 左邊 2. 右上 3. 右下左 4.右下右',
is_del BOOLEAN DEFAULT FALSE                                                COMMENT '是否删除',
is_flashsale BOOLEAN DEFAULT FALSE                                      COMMENT '是否特卖商品',
is_top BOOLEAN DEFAULT FALSE                                                    COMMENT '是否热销商品',
is_new BOOLEAN DEFAULT FALSE                                                    COMMENT '是否新商品',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '修改时间'

)comment = '商品表';

CREATE TABLE t_sucategory (
sub_category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '副类别ID',
category_id INT UNSIGNED                                                                COMMENT '类别ID',
`name` VARCHAR(200) NOT NULL                                                        COMMENT '副类别名称',
parent_id INT UNSIGNED NOT NULL DEFAULT 0                           COMMENT '父级副类别',
is_parent BOOLEAN NOT NULL DEFAULT TRUE                                 COMMENT '是否父级副类别',
sort INT UNSIGNED NOT NULL DEFAULT 0                                        COMMENT '排序'

) COMMENT '副类别';

CREATE TABLE t_search_log(
search_log_id int unsigned AUTO_INCREMENT PRIMARY KEY   COMMENT '搜索日志ID',
keywords VARCHAR(200) NOT NULL                                              COMMENT '搜索词条',
count INT NOT NULL DEFAULT 0                                                    COMMENT '搜索次数',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '创建日期'
) COMMENT = '搜索日志表';


CREATE TABLE t_hots_words(
hots_word_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY      COMMENT '热门搜索词条ID',
search_log_id INT UNSIGNED NOT NULL                                             COMMENT '搜索日志ID',
hots_word VARCHAR(200) NOT NULL                                                     COMMENT '热门搜索词条',
sort INT DEFAULT 0                                                                              COMMENT '热门搜索词条排序',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                       COMMENT '创建日期'

) COMMENT = '热门搜索词条表';

CREATE TABLE t_sub_category_brand
(
    sub_category_id INT UNSIGNED        COMMENT '分类 ID',
    brand_id    INT UNSIGNED            COMMENT '品牌 ID',
        
    PRIMARY KEY (sub_category_id, brand_id)
        
) COMMENT ='副类别与品牌关联表';

CREATE TABLE t_customer (
customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL  COMMENT '用户ID',
username VARCHAR(200) NOT NULL                                                              COMMENT '用户名称',
`password` VARCHAR(200) NOT NULL                                                            COMMENT '用户账号密码',
profile_img VARCHAR(200) NOT NULL                                                           COMMENT '用户头像',
phone_no CHAR(20) NOT NULL                                                                      COMMENT '用户手机号',
following_num INT UNSIGNED NOT NULL DEFAULT 0                                   COMMENT '用户已追踪数量',
follower_num INT UNSIGNED NOT NULL DEFAULT 0                                    COMMENT '用户被追踪数量', 
created_time TIMESTAMP NOT NULL DEFAULT NOW()                                   COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                                   COMMENT '修改时间'
) COMMENT = '用户表';

 CREATE TABLE t_cart (
 cart_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY            COMMENT '购物车ID',
 customer_id INT UNSIGNED NOT NULL                                              COMMENT '用户ID',
 inventory_id INT UNSIGNED NOT NULL                                             COMMENT '商品库存ID',
 inventory_quantity INT UNSIGNED DEFAULT 1                              COMMENT '购物车商品数量',  
 inventory_title VARCHAR(200) NOT NULL                                      COMMENT '购物车商品名称', 
 inventory_img_url VARCHAR(200) NOT NULL                                    COMMENT '购物车商品展示图', 
 remark VARCHAR(200) NOT NULL                                                       COMMENT '购物车商品备注', 
 inventory_price DECIMAL(10,2) UNSIGNED DEFAULT 0                   COMMENT '购物车商品数量',  
 saleable BOOLEAN NOT NULL DEFAULT TRUE                                     COMMENT '是否上架',
 is_delete BOOLEAN DEFAULT FALSE                                                    COMMENT '是否删除',
 created_time TIMESTAMP NOT NULL DEFAULT NOW()                      COMMENT '创建时间',
 updated_time TIMESTAMP NOT NULL DEFAULT NOW()                      COMMENT '修改时间'

) comment = '购物车表';

CREATE TABLE t_state (
state_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY            COMMENT '州属ID',
state_name VARCHAR(200) NOT NULL                                                    COMMENT '州属' 
) comment = '州属表';

CREATE TABLE t_address (
address_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY          COMMENT '地址ID',
customer_id INT UNSIGNED NOT NULL                                                   COMMENT '用户ID',
state_id INT UNSIGNED NOT NULL                                                      COMMENT '州属ID',
`name` VARCHAR(200) NOT NULL                                                            COMMENT '收货人名称',
phone_no CHAR(20) NOT NULL                                                              COMMENT '收货人手机号',
address VARCHAR(200) NOT NULL                                                       COMMENT '门牌、路牌、小区',
zip_code CHAR(5) NOT NULL                                                                   COMMENT '收货人手机号',
city_name VARCHAR(200) NOT NULL                                                     COMMENT '城市',
is_default BOOLEAN DEFAULT FALSE                                                    COMMENT '是否为默认地址',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '最修改时间'

) comment = '地址表';

CREATE TABLE t_variation(
variation_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY    COMMENT '规格ID',
inventory_id INT UNSIGNED NOT NULL                                      COMMENT '商品ID',
variation_name VARCHAR(200) NOT NULL                                    COMMENT '规格名称',
parent_id TINYINT(1) NOT NULL                                                   COMMENT '是否为通用参数',
is_parent BOOLEAN DEFAULT TRUE NOT NULL                             COMMENT '是否为父级ID',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '修改时间'
) COMMENT = '规格表';

CREATE TABLE t_event(
event_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY        COMMENT '活动ID',
inventory_id INT UNSIGNED NOT NULL                                  COMMENT '商品ID',
event_img VARCHAR(200) NOT NULL                                         COMMENT '活动照片',
position INT UNSIGNED NOT NULL                                          COMMENT '活动照片位置： 1.横条 2.左下部分 3.右下部份',
is_del BOOLEAN NOT NULL DEFAULT FALSE                       COMMENT '活动是否已删除',
created_time TIMESTAMP NOT NULL DEFAULT NOW()           COMMENT '创建日期',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()               COMMENT '修改日期'

) COMMENT = '活动表';

CREATE TABLE t_bank(
bank_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY     COMMENT '银行ID',
bank_name VARCHAR(200) NOT NULL                                     COMMENT '银行名称',
bank_code VARCHAR(200) NOT NULL                                     COMMENT '银行码'
) COMMENT = '银行表';

CREATE TABLE t_order (
order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY            COMMENT '订单ID',
cart_id INT UNSIGNED NOT NULL                                                           COMMENT '购物车ID',
customer_id INT UNSIGNED NOT NULL                                                   COMMENT '用户ID',
bank_id INT UNSIGNED NOT NULL                                                           COMMENT '银行ID',
order_no VARCHAR(200) NOT NULL                                                      COMMENT '订单号',
type TINYINT UNSIGNED NOT NULL DEFAULT 1                                    COMMENT '订单类型： 1网络销售',
total_price DECIMAL(10,2) NOT NULL DEFAULT 0                            COMMENT '订单总价',
payment_type TINYINT UNSIGNED NOT NULL DEFAULT 1                    COMMENT '付款方法： 1stripe',
`status` TINYINT UNSIGNED NOT NULL DEFAULT 1                            COMMENT '状态：1未付款、2已付款、3已发货、4已签收',
postage DECIMAL(10,2) NOT NULL DEFAULT 0                                    COMMENT '运费',
weight DECIMAL(10,2) NOT NULL DEFAULT 0                                     COMMENT '商品重量：单位克',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '修改时间'

) comment = '订单表';

CREATE TABLE t_order_detail (
order_id INT UNSIGNED NOT NULL                                                      COMMENT '订单ID',
brand_id INT UNSIGNED NOT NULL                                                      COMMENT '品牌ID',
actual_price DECIMAL(10,2) NOT NULL DEFAULT 0                               COMMENT '商品原价',
sold_price DECIMAL(10,2) NOT NULL DEFAULT 0                                     COMMENT '商品售价',
quantity INT UNSIGNED NOT NULL DEFAULT 1                                    COMMENT '商品总数量',

PRIMARY KEY (order_id, brand_id)
) comment = '订单详情表';

CREATE TABLE t_ecp(
ecp_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY                      COMMENT '物流公司ID',
ecp_name VARCHAR(200) NOT NULL                                                          COMMENT '物流公司名称'
) comment = '物流公司表';

CREATE TABLE t_delivery(
delivery_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY             COMMENT '快递ID',
order_id INT UNSIGNED                                                                   COMMENT '订单ID',
address_id INT UNSIGNED                                                                 COMMENT '地址ID',
ecp_id INT UNSIGNED                                                                         COMMENT '物流公司ID',
tracking_id VARCHAR(200) NOT NULL                                                   COMMENT '物流ID',
--inventory JSON NOT NULL                                                                           COMMENT '订单商品列表',
postage DECIMAL(10,2) NOT NULL DEFAULT 0                                        COMMENT '运费',
`status`  TINYINT UNSIGNED NOT NULL DEFAULT 1                               COMMENT '状态：1未发货、2已发货、3已送达',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                               COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                               COMMENT '修改时间'

)comment = '快递表';

CREATE TABLE t_payment(
payment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY          COMMENT '支付ID',
order_id INT UNSIGNED                                                               COMMENT '订单ID',
customer_id INT UNSIGNED NOT NULL                                                   COMMENT '用户ID',
total_amount  DECIMAL(10,2) NOT NULL DEFAULT 0                      COMMENT '付款总额',
`status` TINYINT UNSIGNED NOT NULL DEFAULT 1                            COMMENT '状态：1付款成功 2支付失败',
fail_reason VARCHAR(200) DEFAULT NULL                                   COMMENT '付款失败原因',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '修改时间'
) comment = '付款表';

CREATE TABLE t_follow (
follow_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY           COMMENT '关注ID',
followee_id INT UNSIGNED NOT NULL                                           COMMENT '关注者ID',
followed_id INT UNSIGNED NOT NULL                                           COMMENT '被关注者ID',
`status` TINYINT UNSIGNED NOT NULL DEFAULT 1                            COMMENT '状态：1关注、2未关注',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                           COMMENT '修改时间'

) comment = '关注表';

CREATE TABLE t_notification(
notification_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY             COMMENT '通知ID',
from_customer_id INT UNSIGNED NOT NULL                                          COMMENT '通知发起者ID',
to_customer_id INT UNSIGNED NOT NULL                                                COMMENT '通知接收者ID',
from_username VARCHAR(200) NOT NULL                                                         COMMENT '通知发起者名称',
from_profile_img VARCHAR(200) NOT NULL                                                  COMMENT '通知发起者名称',
title VARCHAR(200)                                                                                          COMMENT '通知标题',
content VARCHAR(200) NOT NULL                                                                   COMMENT '通知内容',
is_read BOOLEAN DEFAULT FALSE                                                                       COMMENT '是否已读',
is_delete BOOLEAN DEFAULT FALSE                                                                 COMMENT '是否删除',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                                       COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                                       COMMENT '修改时间'

) comment = '通知表';

CREATE TABLE t_post(
post_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY             COMMENT '帖子ID',
customer_id INT UNSIGNED NOT NULL                                       COMMENT '帖子作者ID',
inventory_id INT UNSIGNED                                                     COMMENT '商品ID',
title VARCHAR(200) NOT NULL                                                         COMMENT '帖子标题',
content VARCHAR(500)                                                                        COMMENT '帖子内容',
img_url JSON NOT NULL                                                                       COMMENT '帖子图片',
inventory_url VARCHAR(200)                                                          COMMENT '商品页面链接',
inventory_img VARCHAR(200)                                                          COMMENT '商品图片',
inventory_name VARCHAR(200)                                                         COMMENT '商品名称',
collection_num INT UNSIGNED NOT NULL DEFAULT 0            COMMENT '收藏数量',
like_num INT UNSIGNED NOT NULL DEFAULT 0                        COMMENT '点赞数量',
comment_num INT UNSIGNED NOT NULL DEFAULT 0                 COMMENT '评论数量',
is_delete BOOLEAN DEFAULT FALSE                                                 COMMENT '是否删除',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                       COMMENT '创建时间',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                       COMMENT '修改时间'

)comment = '帖子表';

CREATE TABLE t_like(
like_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY     COMMENT '点赞ID',
post_id INT UNSIGNED                                                            COMMENT '帖子ID',
customer_id INT UNSIGNED NOT NULL                                   COMMENT '用户ID',
comment_id INT UNSIGNED                                                     COMMENT '评论ID',
`status` TINYINT(1) NOT NULL DEFAULT 1                      COMMENT '点赞状态：0.取消点赞 1.已点赞',
type INT UNSIGNED NOT NULL DEFAULT 1                            COMMENT '点赞种类：1.帖子 2.留言',
created_time TIMESTAMP NOT NULL DEFAULT NOW()       COMMENT '创建日期',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()           COMMENT '修改日期'

) COMMENT = '点赞表';


CREATE TABLE t_collection(
collection_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY       COMMENT '收藏ID',
post_id INT UNSIGNED NOT NULL                                                       COMMENT '帖子ID',
customer_id INT UNSIGNED NOT NULL                                               COMMENT '用户ID',
`status` TINYINT(1) NOT NULL DEFAULT 1                                  COMMENT '收藏状态：0.取消收藏 1.已收藏',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '创建日期',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                       COMMENT '修改日期'

) COMMENT = '收藏表';

CREATE TABLE t_comment(
comment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY          COMMENT '留言ID',
post_id INT UNSIGNED NOT NULL                                                       COMMENT '帖子ID',
customer_id INT UNSIGNED NOT NULL                                               COMMENT '用户ID',
content VARCHAR(500) NOT NULL                                                       COMMENT '留言内容',
parent_id INT UNSIGNED NOT NULL DEFAULT 0                               COMMENT '父级留言ID',
like_num    INT UNSIGNED NOT NULL DEFAULT 0                             COMMENT '点赞数量',
is_author BOOLEAN NOT NULL DEFAULT FALSE                                COMMENT '是否作者',
is_delete BOOLEAN NOT NULL DEFAULT FALSE                                COMMENT '是否删除',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                   COMMENT '创建日期',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                       COMMENT '修改日期'

) COMMENT = '留言表';

CREATE TABLE t_varidetail(
variation_detail_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY       COMMENT '规格详情ID',
inventory_id INT UNSIGNED NOT NULL                                COMMENT '商品ID',
variation_ids JSON                                                COMMENT '规格ID',
price DECIMAL(10,2) NOT NULL DEFAULT 0                            COMMENT '单价',
weight DECIMAL(10,2) NOT NULL DEFAULT 0                           COMMENT '重量',
stock INT UNSIGNED NOT NULL DEFAULT 0                             COMMENT '库存数量',
variation_detail_image VARCHAR(200)                               COMMENT '规格详情照片',
created_time TIMESTAMP NOT NULL DEFAULT NOW()                     COMMENT '创建日期',
updated_time TIMESTAMP NOT NULL DEFAULT NOW()                     COMMENT '修改日期'

) COMMENT = '规格详情表';


