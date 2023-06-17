


#####################   导出的存储过程
drop procedure if exists exp_1_statistic_order ;  
  
DELIMITER $$  
create procedure exp_1_statistic_order(    )  
begin  
     declare  v_time      varchar(200) ;
     declare  v_filename  varchar(200) ;
     declare  v_1         varchar(6000) ;
     
     set  v_time = concat( '/home/mysql/t_' , 
                       date_format(date_sub(now(), interval 1 hour), '%Y_%m_%d_%H00' ),
                       '__' ,
                       date_format(date_sub(now(), interval 0 hour), '%Y_%m_%d_%H00' )
                    );
     select v_time ; 
     set v_filename = concat(v_time, '.txt')    ;
                   
    /* select  t.merchant_id       ,
             unix_timestamp(date_format(date_sub(now(), interval 1 hour), '%Y-%m-%d %H:00:00' )) ,
             unix_timestamp(date_format(date_sub(now(), interval 0 hour), '%Y-%m-%d %H:00:00' )) ,
             t.order_money       ,
             t.success_order_money_1 ,
             t.success_order_money_2 ,
             t.order_amount            ,
             t.success_order_amount_1  ,
             t.success_order_amount_2  ,
             (t.success_order_amount_1 + t.success_order_amount_2)/ t.order_amount ,
             (t.success_order_amount_1 + t.success_order_amount_2)/ (t.success_order_money_1 + t.success_order_money_2) ,
             0.12      # 手续费 
       into outfile '/home/mysql/t1.txt'  
       fields terminated by   ',' 
       optionally enclosed by '"'  
       lines terminated by    '\n'         
       from  xifu_v_statistic_merchant_order t ;
     */
       
       set v_1 = 'select  t.merchant_id       ,
             unix_timestamp(date_format(date_sub(now(), interval 1 hour), ''%Y-%m-%d %H:00:00'' )) ,
             unix_timestamp(date_format(date_sub(now(), interval 0 hour), ''%Y-%m-%d %H:00:00'' )) ,
             t.order_money       ,
             t.success_order_money_1 ,
             t.success_order_money_2 ,
             t.order_amount            ,
             t.success_order_amount_1  ,
             t.success_order_amount_2  ,
             (t.success_order_amount_1 + t.success_order_amount_2)/ t.order_amount ,
             (t.success_order_amount_1 + t.success_order_amount_2)/ (t.success_order_money_1 + t.success_order_money_2) ,
             0.12      # 手续费 
       into outfile '''; 
       
       set v_1 = concat( v_1, v_filename );
       set v_1 = concat( v_1, '''' );
       set v_1 = concat( v_1, ' fields terminated by   '''  );
       set v_1 = concat( v_1, ','  );
       set v_1 = concat( v_1, ''' '  );
       set v_1 = concat( v_1, ' optionally enclosed by   '''  );
       set v_1 = concat( v_1, '"'  );
       set v_1 = concat( v_1, ''' '  );
       set v_1 = concat( v_1, ' lines terminated by       '''  );
       set v_1 = concat( v_1, '\\n'  );
       set v_1 = concat( v_1, ''' '  );
       set v_1 = concat( v_1, ' from  xifu_v_statistic_merchant_order t '  );
       
       set @v_add = v_1 ; 
       select @v_add;
       
       prepare stm from @v_add;  
       execute stm;  
       deallocate prepare stm; 
   
   
   
       
   commit;
                  
end  $$
  
delimiter  ;




