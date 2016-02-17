//
//  GoodsInfo.h
//  chermon_天猫2
//
//  Created by apple on 15/8/29.
//  Copyright (c) 2015年 zhengqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsInfo : NSObject
@property (nonatomic,assign)int goods_id;
@property (nonatomic,copy)NSString *goods_name;
@property (nonatomic,assign)double goods_price;
@property (nonatomic,strong)NSString *goods_logo;
@property (nonatomic,assign)int type_id;
@property (nonatomic,assign)int market_id;
@property (nonatomic,copy)NSString *goods_info;

@property (nonatomic,assign)int goods_num;
@property (nonatomic,assign)BOOL isSelected;

@end
