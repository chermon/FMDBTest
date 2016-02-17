//
//  HomeController.m
//  chermon_FMDBTest
//
//  Created by shuwang on 16/1/29.
//  Copyright © 2016年 chermon. All rights reserved.
//

#import "HomeController.h"
#import "SortTableViewCell.h"
#import "GoodsInfo.h"
#import "DBGoods.h"
@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *mtArr;
}
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tableView.delegate =self;
    tableView.dataSource =self;
    
    mtArr = [[DBGoods shareGoodsInfo]selectGoods];
    NSLog(@"我把FMDB增加到了Git库！");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",(unsigned long)mtArr.count);
    return mtArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellId = @"cell";
    SortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *arr = [[NSBundle mainBundle]loadNibNamed:@"SortTableViewCell" owner:self options:nil];
        cell = [arr objectAtIndex:0];
        
    }
    
    GoodsInfo *goodsInfo = [mtArr objectAtIndex:indexPath.row];
    cell.lbPrice.text = [NSString stringWithFormat:@"%.2f",goodsInfo.goods_price];
    cell.lbTitle.text = goodsInfo.goods_name;
    
    [cell.imageLogo setImage:[UIImage imageNamed:goodsInfo.goods_logo]];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
