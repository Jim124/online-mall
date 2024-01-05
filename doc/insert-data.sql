INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (1, 'Affin Bank', 'affin_bank');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (2, 'Alliance Bank', 'alliance_bank');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (3, 'AmBank', 'ambank');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (4, 'Bank Islam', 'bank_islam');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (5, 'Bank Muamalat', 'bank_muamalat');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (6, 'Bank Rakyat', 'bank_rakyat');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (7, 'BSN', 'bsn');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (8, 'CIMB Clicks', 'cimb');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (9, 'Hong Leong Bank', 'hong_leong_bank');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (10, 'HSBC Bank', 'hsbc');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (11, 'KFH', 'kfh');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (12, 'Maybank2E', 'maybank2e');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (13, 'Maybank2U', 'maybank2u');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (14, 'OCBC Bank', 'ocbc');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (15, 'Public Bank', 'public_bank');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (16, 'RHB Bank', 'rhb');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (17, 'Standard Chartered', 'standard_chartered');
INSERT INTO `t_bank` (`bank_id`, `bank_name`, `bank_code`) VALUES (18, 'UOB', 'uob');


INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (1, '康宝莱', 'https://assets.nst.com.my/images/articles/herbalife_1692590162.jpg', 'K');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (2, '康比特', 'https://p1.itc.cn/images01/20230410/7e5df3e65a064ff2942e8ce2b28f4420.jpeg', 'K');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (3, '汤臣倍健', 'https://pic2.zhimg.com/80/v2-97a81f09deafbcf0c99f85fdbde10a69_1440w.webp', 'T');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (4, '碧生源', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQRcziSo6UHdKsPP1CzZM2nrpH2tsY3YOZw8SNuclkbj8VPRjosLIh6ZGu6L6WjiACj9Y&usqp=CAU', 'B');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (5, '美瑞克斯', 'https://image.pp918.com/Brand/20190501/20190501201717_9481.png', 'M');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (6, '香奈尔', 'https://pic3.zhimg.com/v2-89ce694902778e3ce49df6aa25f1a5a2_r.jpg', 'C');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (7, '兰蔻', 'https://pic3.zhimg.com/v2-41865494904b6525da1000891ec0180e_r.jpg', 'L');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (8, '雅诗兰黛', 'https://pic2.zhimg.com/80/v2-0aec332abcaecf4af3d6da914012825d_720w.webp', 'Y');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (9, '迪奥', 'https://pic3.zhimg.com/80/v2-2acf6994725025fd5fd94a4894892e0e_720w.webp', 'D');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (10, '倩碧', 'https://pic4.zhimg.com/80/v2-a0a88172fb58aff06f5c93e21be64403_720w.webp', 'Q');
INSERT INTO `t_brand` (`brand_id`, `name`, `image`, `letter`) VALUES (11, '科颜氏', 'https://miro.medium.com/v2/resize:fit:1000/1*iYg1Cpv4EySeK_XCddV-LA.jpeg', 'K');


INSERT INTO `t_category` (`category_id`, `spg_id`, `name`, `category_img`) VALUES (1, 10000, '美妆', 'https://picx.zhimg.com/v2-adc63b41accf8cec11c881285ab1cc5c_r.webp?source=172ae18b&consumer=ZHI_MENG');
INSERT INTO `t_category` (`category_id`, `spg_id`, `name`, `category_img`) VALUES (2, 20000, '护肤品', 'https://pic.52112.com/180610/JPG-180610_469/YTpDStuy0O_small.jpg');
INSERT INTO `t_category` (`category_id`, `spg_id`, `name`, `category_img`) VALUES (3, 30000, '减肥', 'https://hips.hearstapps.com/hmg-prod/images/weightloss-64b7910af24c9.png?crop=1.00xw:1.00xh;0,0&resize=1200:*');


INSERT INTO `t_collection` (`collection_id`, `post_id`, `customer_id`, `status`, `created_time`, `updated_time`) VALUES (1, 1, 3, 1, '2024-01-02 01:57:12', '2024-01-02 01:57:12');
INSERT INTO `t_collection` (`collection_id`, `post_id`, `customer_id`, `status`, `created_time`, `updated_time`) VALUES (2, 1, 4, 1, '2024-01-02 01:57:38', '2024-01-02 01:57:38');
INSERT INTO `t_collection` (`collection_id`, `post_id`, `customer_id`, `status`, `created_time`, `updated_time`) VALUES (3, 2, 3, 1, '2024-01-02 01:58:18', '2024-01-02 01:58:18');
INSERT INTO `t_collection` (`collection_id`, `post_id`, `customer_id`, `status`, `created_time`, `updated_time`) VALUES (4, 2, 4, 0, '2024-01-02 01:58:26', '2024-01-02 01:58:26');


INSERT INTO `t_comment` (`comment_id`, `post_id`, `customer_id`, `content`, `parent_id`, `like_num`, `is_author`, `is_delete`, `created_time`, `updated_time`) VALUES (1, 2, 3, '好好看😍', 0, 1, 0, 0, '2024-01-02 02:15:57', '2024-01-02 02:15:57');
INSERT INTO `t_comment` (`comment_id`, `post_id`, `customer_id`, `content`, `parent_id`, `like_num`, `is_author`, `is_delete`, `created_time`, `updated_time`) VALUES (2, 2, 1, '谢谢称赞~', 1, 0, 1, 0, '2024-01-02 02:17:10', '2024-01-02 02:17:10');


INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (1, '杨超越', '1234', 'https://p0.itc.cn/q_70/images03/20221201/32daef12001e4b8ba36608d8afa2464a.jpeg', '0123456789', 2, 0, '2023-12-29 07:06:10', '2023-12-29 07:06:10');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (2, '刘亦菲', '1234', 'https://feminine.com.my/wp-content/uploads/2021/01/%E5%88%98%E4%BA%A6%E8%8F%B21000x800.jpg', '0122478598', 0, 0, '2023-12-29 07:07:01', '2023-12-29 07:07:01');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (3, '曾敬桦', '1234', 'https://i.pinimg.com/originals/77/cd/3e/77cd3ec3f4db67fa09e53948f90f7dff.jpg', '01114567898', 0, 1, '2023-12-29 07:08:27', '2023-12-29 07:08:27');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (4, '宋江', '1234', 'https://hips.hearstapps.com/hmg-prod/images/202794023-526001191875886-4972446824354785996-n-1624537815.jpg?crop=1.00xw:0.781xh;0,0.0789xh&resize=980:*', '0125025025', 0, 1, '2023-12-29 07:09:55', '2023-12-29 07:09:55');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (5, 'ww', '6569F44CB95EB8D3D9C1A6A58A635472', 'http://localhost:8080/img.png', '60125346543', 0, 0, '2023-12-29 08:00:08', '2023-12-29 08:00:08');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (6, 'ls', '6569F44CB95EB8D3D9C1A6A58A635472', 'http://localhost:8080/img.png', '601253146543', 0, 0, '2023-12-29 08:06:16', '2023-12-29 08:06:16');
INSERT INTO `t_customer` (`customer_id`, `username`, `password`, `profile_img`, `phone_no`, `follower_num`, `following_num`, `created_time`, `updated_time`) VALUES (7, 'ls', '6569F44CB95EB8D3D9C1A6A58A635472', 'http://localhost:8080/img.png', '602253146543', 0, 0, '2023-12-29 08:06:28', '2023-12-29 08:06:28');


INSERT INTO `t_ecp` (`ecp_id`, `ecp_name`) VALUES (1, 'J&T');
INSERT INTO `t_ecp` (`ecp_id`, `ecp_name`) VALUES (2, 'Ninja Van');


INSERT INTO `t_follow` (`follow_id`, `followee_id`, `followed_id`, `status`, `created_time`, `updated_time`) VALUES (1, 3, 1, 1, '2024-01-02 02:22:00', '2024-01-02 02:22:00');
INSERT INTO `t_follow` (`follow_id`, `followee_id`, `followed_id`, `status`, `created_time`, `updated_time`) VALUES (2, 4, 1, 1, '2024-01-02 02:22:12', '2024-01-02 02:22:12');


INSERT INTO `t_hots_words` (`hots_word_id`, `search_log_id`, `hots_word`, `sort`, `created_time`) VALUES (1, 10, 'mac口红chilli', 1, '2023-12-29 08:06:32');
INSERT INTO `t_hots_words` (`hots_word_id`, `search_log_id`, `hots_word`, `sort`, `created_time`) VALUES (2, 4, '玫科菲粉底', 2, '2023-12-29 08:06:55');
INSERT INTO `t_hots_words` (`hots_word_id`, `search_log_id`, `hots_word`, `sort`, `created_time`) VALUES (3, 2, '科颜氏', 3, '2023-12-29 08:07:16');
INSERT INTO `t_hots_words` (`hots_word_id`, `search_log_id`, `hots_word`, `sort`, `created_time`) VALUES (4, 8, '香奈尔粉底液', 4, '2023-12-29 08:07:50');
INSERT INTO `t_hots_words` (`hots_word_id`, `search_log_id`, `hots_word`, `sort`, `created_time`) VALUES (5, 7, '倩碧腮红', 5, '2023-12-29 08:08:25');


INSERT INTO `t_inventory`(`inventory_id`, `category_id`, `brand_id`, `sub_category_id`, `spg_id`, `title`, `subtitle`, `images`, `param`, `sold_quantity`, `saleable`, `is_del`, `created_time`, `updated_time`) VALUES (1, 1, 6, 2, 1, '香奈尔砖红色06唇釉', '香奈尔年轻时尚', '{\"desc\": [\"https://www.chanel.com/images//t_one//w_0.38,h_0.38,c_crop/q_auto:good,f_auto,fl_lossy,dpr_1.1/w_1920/rouge-coco-baume-hydrating-beautifying-tinted-lip-balm-buildable-colour-930-sweet-treat-0-1oz--packshot-default-171930-9516954255390.jpg\"]}', '[1, 2, 3, 4]', 100, 1, 0, '2020-05-19 19:17:16', '2020-05-19 19:17:16');
INSERT INTO `t_inventory`(`inventory_id`, `category_id`, `brand_id`, `sub_category_id`, `spg_id`, `title`, `subtitle`, `images`, `param`, `sold_quantity`, `saleable`, `is_del`, `created_time`, `updated_time`) VALUES (2, 2, 11, 29, 2, '【2024 新年新氣象】水噹噹｜金盞花化妝水加倍組', NULL, '{\"desc\": [\"https://mall.iopenmall.tw/website/uploads_product/website_4623/P0462301283233_3_10411120.jpg?hash=18614\"]}', '[5, 6, 7]', 621, 1, 0, '2024-01-02 03:32:22', '2024-01-02 03:32:22');
INSERT INTO `t_inventory`(`inventory_id`, `category_id`, `brand_id`, `sub_category_id`, `spg_id`, `title`, `subtitle`, `images`, `param`, `sold_quantity`, `saleable`, `is_del`, `created_time`, `updated_time`) VALUES (3, 3, 1, 42, 3, '[营养代餐]HERBALIFE/康宝莱草莓味奶昔750克/罐 膳食营养补充剂', NULL, '{\"desc\": [\"https://imgservice.suning.cn/uimg1/b2c/image/frQdqzfwrdjxvsN6tQvCZw.jpg_800w_800h_4e\"]}', '[8, 9, 10]', 45, 1, 0, '2024-01-02 03:40:27', '2024-01-02 03:40:27');


INSERT INTO `t_like` (`like_id`, `post_id`, `comment_id`, `customer_id`, `type`, `status`, `created_time`, `updated_time`) VALUES (1, 2, NULL, 3, 0, 1, '2024-01-02 02:00:09', '2024-01-02 02:00:09');
INSERT INTO `t_like` (`like_id`, `post_id`, `comment_id`, `customer_id`, `type`, `status`, `created_time`, `updated_time`) VALUES (2, 2, NULL, 4, 0, 1, '2024-01-02 02:01:45', '2024-01-02 02:01:45');
INSERT INTO `t_like` (`like_id`, `post_id`, `comment_id`, `customer_id`, `type`, `status`, `created_time`, `updated_time`) VALUES (3, NULL, 1, 1, 2, 1, '2024-01-02 02:15:30', '2024-01-02 02:15:30');


INSERT INTO `t_post` (`post_id`, `customer_id`, `inventory_id`, `title`, `content`, `img_url`, `inventory_url`, `inventory_img`, `inventory_name`, `collection_num`, `like_num`, `comment_num`, `is_delete`, `created_time`, `updated_time`) VALUES (1, 1, NULL, '今日妆容', '', '[{\"url\": \"https://preview.redd.it/yang-chao-yue-v0-kacq26v9lqsa1.jpg?width=640&crop=smart&auto=webp&s=e3ac3f716637443db86be2b194b7d2c44b9365e5\"}, {\"url\": \"https://preview.redd.it/yang-chao-yue-v0-a90eo5v9lqsa1.jpg?width=640&crop=smart&auto=webp&s=4149b75eda263849d723d66e3024f2cd60273543\"}, {\"url\": \"https://preview.redd.it/yang-chao-yue-v0-9ugid7v9lqsa1.jpg?width=640&crop=smart&auto=webp&s=1e8b26f3163494e9337af4d61544c9c94bf37a8c\"}, {\"url\": \"https://preview.redd.it/yang-chao-yue-v0-b1wi57v9lqsa1.jpg?width=640&crop=smart&auto=webp&s=ad7093b649cda139b8a5b9077ba4cd90ea6928b6\"}, {\"url\": \"https://preview.redd.it/yang-chao-yue-v0-4r4rb7v9lqsa1.jpg?width=640&crop=smart&auto=webp&s=6c97d65872c82aff99095846176f23d32d331f30\"}]', NULL, NULL, NULL, 2, 0, 0, 0, '2024-01-02 01:44:29', '2024-01-02 01:44:29');
INSERT INTO `t_post` (`post_id`, `customer_id`, `inventory_id`, `title`, `content`, `img_url`, `inventory_url`, `inventory_img`, `inventory_name`, `collection_num`, `like_num`, `comment_num`, `is_delete`, `created_time`, `updated_time`) VALUES (2, 1, 1, '这个唇釉绝了', '香奈儿的唇釉绝了！超级好用！ 超级显白！', '[{\"url\": \"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Fyang-chao-yue--698902435933091687%2F&psig=AOvVaw3YDR-ouk9Bxu9WzZIEiSCQ&ust=1704245349633000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNifm-nGvYMDFQAAAAAdAAAAABAI\"}]', NULL, NULL, '香奈儿唇釉', 1, 2, 0, 0, '2024-01-02 01:57:55', '2024-01-02 01:57:55');


INSERT INTO `t_role` (`role_id`, `role`) VALUES (2, '商品管理员');
INSERT INTO `t_role` (`role_id`, `role`) VALUES (4, '客服人员');
INSERT INTO `t_role` (`role_id`, `role`) VALUES (1, '系统管理员');
INSERT INTO `t_role` (`role_id`, `role`) VALUES (3, '订单管理员');


INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (1, '雅诗兰黛', 5, '2023-12-29 07:52:01');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (2, '科颜氏', 50, '2023-12-29 07:53:26');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (3, '减肥餐', 6, '2023-12-29 07:53:46');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (4, '玫科菲粉底', 55, '2023-12-29 07:56:03');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (5, '菲丽菲拉唇釉20', 25, '2023-12-29 07:56:26');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (6, '康宝莱减肥', 33, '2023-12-29 07:57:28');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (7, '倩碧腮红', 41, '2023-12-29 07:58:14');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (8, '香奈尔粉底液', 43, '2023-12-29 07:59:01');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (9, '橘多膨胀色腮红', 36, '2023-12-29 08:05:00');
INSERT INTO `t_search_log` (`search_log_id`, `keywords`, `count`, `created_time`) VALUES (10, 'mac口红chilli', 545, '2023-12-29 08:05:40');


INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (1, 'Johor');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (2, 'Kedah');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (3, 'Kelantan');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (4, 'Melacca');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (5, 'Negeri Sembilan');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (6, 'Pahang');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (7, 'Penang');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (8, 'Perak');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (9, 'Perlis');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (10, 'Sabah');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (11, 'Sarawak');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (12, 'Selangor');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (13, 'Terengganu');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (14, 'WP Kuala Lumpur');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (15, 'WP Labuan');
INSERT INTO `t_state` (`state_id`, `state_name`) VALUES (16, 'WP Putrajaya');


INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (1, 1, '唇部', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (2, 1, '唇釉', 1, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (3, 1, '口红', 1, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (4, 1, '护唇膏', 1, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (5, 1, '磨砂膏', 1, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (6, 1, '润唇膏', 1, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (7, 1, '唇膜', 1, 0, 6);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (8, 1, '眼部', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (9, 1, '眼影', 8, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (10, 1, '眼线笔', 8, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (11, 1, '睫毛', 8, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (12, 1, '睫毛膏', 8, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (13, 1, '卧蚕笔', 8, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (14, 1, '眼影盘', 8, 0, 6);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (15, 1, '脸部', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (16, 1, '眉笔', 15, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (17, 1, '眉粉', 15, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (18, 1, '高光', 15, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (19, 1, '腮红', 15, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (20, 1, '阴影', 15, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (21, 1, '美妆工具', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (22, 1, '双眼皮贴', 21, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (23, 1, '粉底刷', 21, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (24, 1, '眼影刷', 21, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (25, 1, '眉刷', 21, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (26, 1, '高光刷', 21, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (27, 1, '腮红刷', 21, 0, 6);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (28, 2, '脸部', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (29, 2, '面膜', 28, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (30, 2, '眼霜', 28, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (31, 2, '眼膜', 28, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (32, 2, '黑头贴', 28, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (33, 2, '痘痘贴', 28, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (34, 2, '身体', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (35, 2, '手膜', 34, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (36, 2, '脚膜', 34, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (37, 2, '脱毛膏', 34, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (38, 2, '磨砂膏', 34, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (39, 2, '身体乳', 34, 0, 5);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (40, 3, '饮食', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (41, 3, '代餐', 40, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (42, 3, '排毒茶', 40, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (43, 3, '燃脂茶', 40, 0, 3);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (44, 3, '酵素', 40, 0, 4);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (45, 3, '用具', 0, 1, 0);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (46, 3, '震动减肥机', 45, 0, 1);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (47, 3, '束腰带', 45, 0, 2);
INSERT INTO `t_sucategory` (`sub_category_id`, `category_id`, `name`, `parent_id`, `is_parent`, `sort`) VALUES (48, 3, '瘦脸运动器', 45, 0, 3);


INSERT INTO `t_user` (`user_id`, `employee_id`, `role_id`, `username`, `password`, `status`, `created_time`, `updated_time`, `phone_no`) VALUES (1, 'SA001', 1, 'Phillip', '1234', 1, '2023-12-29 06:59:16', '2023-12-29 06:59:16', '0122504088');
INSERT INTO `t_user` (`user_id`, `employee_id`, `role_id`, `username`, `password`, `status`, `created_time`, `updated_time`, `phone_no`) VALUES (2, 'IA001', 2, 'Alvin', '1234', 1, '2023-12-29 06:59:58', '2023-12-29 06:59:58', '0122504089');
INSERT INTO `t_user` (`user_id`, `employee_id`, `role_id`, `username`, `password`, `status`, `created_time`, `updated_time`, `phone_no`) VALUES (3, 'OA001', 3, 'Kelvin', '1234', 1, '2023-12-29 07:03:13', '2023-12-29 07:03:13', '0122504090');
INSERT INTO `t_user` (`user_id`, `employee_id`, `role_id`, `username`, `password`, `status`, `created_time`, `updated_time`, `phone_no`) VALUES (4, 'CS001', 4, 'Calvin', '1234', 4, '2023-12-29 07:03:49', '2023-12-29 07:03:49', '0122504091');


INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (1, 1, '颜色', 0, 1, '2024-01-02 09:57:08', '2024-01-02 09:57:14');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (2, 1, '922 - 热情红', 1, 0, '2024-01-02 09:57:47', '2024-01-02 09:57:50');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (3, 1, '918 - 玫瑰粉', 1, 0, '2024-01-02 09:58:11', '2024-01-02 09:58:13');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (4, 1, '916 - 珊瑚粉', 1, 0, '2024-01-02 09:58:51', '2024-01-02 09:58:53');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (5, 2, '容量', 0, 1, '2024-01-02 10:41:33', '2024-01-02 10:41:36');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (6, 2, '350g', 5, 0, '2024-01-02 10:41:52', '2024-01-02 10:41:54');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (7, 2, '500g', 5, 0, '2024-01-02 03:30:31', '2024-01-02 03:30:31');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (8, 3, '容量', 0, 1, '2024-01-02 03:37:16', '2024-01-02 03:37:16');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (9, 3, '500g', 8, 0, '2024-01-02 03:37:42', '2024-01-02 03:37:42');
INSERT INTO `t_variation`(`variation_id`, `inventory_id`, `variation_name`, `parent_id`, `is_parent`, `created_time`, `updated_time`) VALUES (10, 3, '750g', 8, 0, '2024-01-02 03:38:16', '2024-01-02 03:38:16');


INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (1, 1, '[1, 2]', 146.00, 0.03, 5220, 'https://imgservice.suning.cn/uimg1/b2c/image/TWDAukLWd_0YUOTgAjIJnQ.jpg_800w_800h_4e_80Q_is', '2024-01-02 02:06:53', '2024-01-02 02:06:53');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (2, 1, '[1, 3]', 148.00, 0.03, 56112, 'https://down-tw.img.susercontent.com/file/sg-11134201-22100-o8bj7b8lomiv71', '2024-01-02 02:11:53', '2024-01-02 02:11:53');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (3, 1, '[1, 4]', 146.00, 0.03, 2342, 'https://gw.alicdn.com/bao/uploaded/i1/67111271/O1CN01iZhAhT1LGAGlzUww0_!!67111271.jpg_Q75.jpg_.webp', '2024-01-02 02:12:50', '2024-01-02 02:12:50');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (4, 2, '[5, 6]', 250.00, 0.35, 4851, 'https://mall.iopenmall.tw/website/uploads_product/website_4623/P0462301283233_3_10411120.jpg?hash=18614', '2024-01-02 03:31:10', '2024-01-02 03:31:10');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (5, 2, '[5, 7]', 300.00, 0.50, 96565, 'https://mall.iopenmall.tw/website/uploads_product/website_4623/P0462301283233_3_10411120.jpg?hash=18614', '2024-01-02 03:31:38', '2024-01-02 03:31:38');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (6, 3, '[8, 9]', 652.22, 0.50, 784956, 'https://imgservice.suning.cn/uimg1/b2c/image/frQdqzfwrdjxvsN6tQvCZw.jpg_800w_800h_4e', '2024-01-02 03:39:34', '2024-01-02 03:39:34');
INSERT INTO `t_varidetail`(`variation_detail_id`, `inventory_id`, `variation_ids`, `price`, `weight`, `stock`, `variation_detail_image`, `created_time`, `updated_time`) VALUES (7, 3, '[8, 10]', 700.00, 0.75, 0, 'https://imgservice.suning.cn/uimg1/b2c/image/frQdqzfwrdjxvsN6tQvCZw.jpg_800w_800h_4e', '2024-01-02 03:40:13', '2024-01-02 03:40:13');


INSERT INTO `t_cart`(`cart_id`, `customer_id`, `inventory_id`, `inventory_quantity`, `inventory_title`, `inventory_img_url`, `remark`, `inventory_price`, `saleable`, `is_delete`, `created_time`, `updated_time`) VALUES (1, 1, 1, 1, '香奈尔砖红色06唇釉', 'https://go.smzdm.com/3c2c2518ad486f19/ca_aa_fx_113_82459448_13199_1173_123_0', '922 - 热情红', 146.00, 1, 0, '2024-01-02 03:36:42', '2024-01-02 03:36:42');
INSERT INTO `t_cart`(`cart_id`, `customer_id`, `inventory_id`, `inventory_quantity`, `inventory_title`, `inventory_img_url`, `remark`, `inventory_price`, `saleable`, `is_delete`, `created_time`, `updated_time`) VALUES (2, 1, 2, 1, '【2024 新年新氣象】水噹噹｜金盞花化妝水加倍組', 'https://mall.iopenmall.tw/website/uploads_product/website_4623/P0462301283233_3_10411120.jpg?hash=18614', '350g', 250.00, 1, 0, '2024-01-02 03:39:12', '2024-01-02 03:39:12');
INSERT INTO `t_cart`(`cart_id`, `customer_id`, `inventory_id`, `inventory_quantity`, `inventory_title`, `inventory_img_url`, `remark`, `inventory_price`, `saleable`, `is_delete`, `created_time`, `updated_time`) VALUES (3, 2, 1, 1, '香奈尔砖红色06唇釉', 'https://go.smzdm.com/3c2c2518ad486f19/ca_aa_fx_113_82459448_13199_1173_123_0', '918 - 玫瑰粉', 148.00, 1, 0, '2024-01-02 03:40:27', '2024-01-02 03:40:27');
INSERT INTO `t_cart`(`cart_id`, `customer_id`, `inventory_id`, `inventory_quantity`, `inventory_title`, `inventory_img_url`, `remark`, `inventory_price`, `saleable`, `is_delete`, `created_time`, `updated_time`) VALUES (4, 1, 3, 1, '[营养代餐]HERBALIFE/康宝莱草莓味奶昔750克/罐 膳食营养补充剂', 'https://imgservice.suning.cn/uimg1/b2c/image/frQdqzfwrdjxvsN6tQvCZw.jpg_800w_800h_4e', '750g', 300.00, 0, 0, '2024-01-02 03:42:47', '2024-01-02 03:42:47');
