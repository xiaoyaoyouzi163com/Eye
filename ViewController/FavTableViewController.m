//
//  FavTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/17.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "FavTableViewController.h"
#import "OperationDAO.h"
#import "CategoryTCell.h"
#import "UIImageView+WLRemoteImage.h"
#import "DetailTableViewController.h"
#import "ItemListDataModel.h"
@interface FavTableViewController ()

{
    NSMutableArray *_dataArray;
}
@end

@implementation FavTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
   
    
}

-(void)viewWillAppear:(BOOL)animated
{
     [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark 创建页面
-(void)createUI
{
    
}

#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件

#pragma mark -
#pragma mark 数据请求
-(void)loadData
{
    _dataArray = [NSMutableArray arrayWithArray:[OperationDAO selectAll]];
    [self.tableView reloadData];
    
}

#pragma mark -
#pragma mark 代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellID = @"cell1";
    
    CategoryTCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil)
    {
        cell = [[CategoryTCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    ItemListDataModel *model = _dataArray[indexPath.row];
    
    [cell.bkImageView setImageWithUrlString:model.cover.feed];
    
    cell.nameLabel.text = model.title;
    cell.detailLabel.text = model.category;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemListDataModel *model = _dataArray[indexPath.row];
    
    DetailTableViewController *dvc = [DetailTableViewController new];
    dvc.model = model;
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        ItemListDataModel *model = _dataArray[indexPath.row];
        [OperationDAO deleteWithid:model.cxid];
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }
}

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法


@end
