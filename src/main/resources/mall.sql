


mall_user id nickname password,salt,sex,birthday,state,area,post_code,status,email,phone,ic_number,follow_num,fans_num,like_num,is_del,status,avatar,register_time,modify_time,bio,job,education,role

product (id,category_id,product_name,price,stock,cover,status);

product_detail_spec id product_id, parent_id,spec_name,
product_detail_price(id,product_id,)

product_detail_pre_img(id,type,product_id,url,);
product_detail_img(id,type,product_id,url)

category  id, category_name,

mall_user_address (id,user_id,name,phone,state,area,street_1,street_2,street_3,post_code,register_time,mod_time);

mall_post(id,user_id,title,content,goods_link,collect_num,like_num,comment_num,post_time,mod_time,is_del);
mall_post_img(id,post_id,img_url);
mall_comment(id,post_id,parent_id,user_id,content,is_author,cre_time,mod_time,like_num,is_del);

mall_collection(id,user_id,post_id,cre_time,status);

mall_like(id,user_id,post_id,cre_time,status);

mall_order(id,user_id,address_id,track_num,logistics_name,total_pay,pay_status,pay_type,cart_ids,total_quantity,receiver_name,receiver_phone,receiver_address,post_code,area,state,payment_time,cre_time,mod_time);
mall_cart(id,user_id,product_id,product_num,product_name,product_img_url,product_status,remark,cre_time,product_price,is_del,cre_time,mod_time);

mall_notification(id,type,user_id,user_name,user_avatar,content,is_read,is_del,cre_time,mod_time);


mall_follow (id, user_id,follow_user_id,status,cre_time,mod_time);










