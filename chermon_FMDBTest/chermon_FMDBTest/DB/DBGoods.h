//
//  DBGoods.h
//  chermon_FMDBTest
//
//  Created by shuwang on 16/1/29.
//  Copyright © 2016年 chermon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import <sqlite3.h>
@interface DBGoods : NSObject
+(DBGoods *)shareGoodsInfo;
-(NSMutableArray *)selectGoods;
@end
