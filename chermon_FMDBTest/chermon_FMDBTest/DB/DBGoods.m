//
//  DBGoods.m
//  chermon_FMDBTest
//
//  Created by shuwang on 16/1/29.
//  Copyright © 2016年 chermon. All rights reserved.
//

#import "DBGoods.h"
#import "GoodsInfo.h"

static DBGoods *singleInstance;
@interface DBGoods ()

@property (nonatomic,strong) FMDatabase *database;

@end

@implementation DBGoods
+(DBGoods *)shareGoodsInfo{
    @synchronized(self) {
        if (singleInstance == nil) {
            singleInstance = [[DBGoods alloc]init];
            
            //找到数据库位置
            NSString *pathStr = [[NSBundle mainBundle]pathForResource:@"CZG" ofType:@"sqlite"];
            singleInstance.database = [FMDatabase databaseWithPath:pathStr];
        }
    }
    return singleInstance;
}

-(NSMutableArray *)selectGoods{
    
    //打开数据库
    if (![_database open]) {
        NSLog(@"数据库打开失败！");
        return nil;
    }
    NSMutableArray *mtArr = [NSMutableArray array];
    
    NSString *resStr = @"select goods_name,goods_price,goods_logo from tb_goods";
    
    //查询数据并将结果赋值给FMResultSet结果集
    FMResultSet *rs = [_database executeQuery:resStr];
    
    //从结果集中循环取数据
    while ([rs next]) {
        GoodsInfo *goods = [[GoodsInfo alloc]init];
        goods.goods_name = [rs stringForColumn:@"goods_name"];
        goods.goods_price = [rs doubleForColumn:@"goods_price"];
        goods.goods_logo = [rs stringForColumnIndex:2];
        [mtArr addObject:goods];
    }
    
    [_database close];
    return mtArr;
}
@end
