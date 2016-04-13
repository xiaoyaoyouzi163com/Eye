//
//  MoreTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MoreTableViewController.h"
#import "MJRefresh.h"
#import "MoreService.h"
#import "MoreAppModel.h"
#import "CategoryTCell.h"
#import "UIImageView+WLRemoteImage.h"
#import "DetailTableViewController.h"
#import "ActivityView.h"
@interface MoreTableViewController ()
{
    NSMutableArray *_dataArray;
    
    NSString *_nextUrl;
    ActivityView *_activityView;
}
@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _activityView = [[ActivityView alloc]initWithFrame:self.view.bounds];
    
    [self createUI];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark 创建页面

-(void)createUI
{
    
//    self.navigationItem.title = self.titleId;
    
    __block MoreTableViewController *blockSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [blockSelf loadData];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.tableView.mj_header isRefreshing] )
            {
                [self.tableView.mj_header endRefreshing];
            }
        });
        
    }];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [blockSelf loadNextData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.tableView.mj_footer isRefreshing] )
            {
                [self.tableView.mj_footer endRefreshing];
            }
        });
        
    }];

}

#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件

#pragma mark -
#pragma mark 数据请求

-(void)loadData
{
    
    [self.view addSubview:_activityView];
    [_activityView.ac startAnimating];
    
    NSMutableArray *arr = [NSMutableArray new];
    
    [[MoreService new]getShareListWithName:self.titleId andResultBlock:^(id result) {
        
        MoreAppModel *model = result;
        
        _dataArray = [NSMutableArray new];
        for (ItemListModel *model1 in model.itemList)
        {
            if ([model1.type isEqualToString:@"video"])
            {
                [arr addObject:model1];
            }
        }
        
        _dataArray = arr;
        _nextUrl = model.nextPageUrl;
        
        [_activityView.ac stopAnimating];
        [_activityView removeFromSuperview];
        [self.tableView reloadData];
        
    }];
    
}


-(void)loadNextData
{
    [self.view addSubview:_activityView];
    [_activityView.ac startAnimating];
    [[MoreService new]getShareListWithUrlStr:_nextUrl andResultBlock:^(id result) {
        MoreAppModel *model = result;
        
        _dataArray = [NSMutableArray arrayWithArray:model.itemList];
        
        _nextUrl = model.nextPageUrl;
        
        
        [_activityView.ac stopAnimating];
        [_activityView removeFromSuperview];
        [self.tableView reloadData];
    }];
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
    
    ItemListModel *model1 =  _dataArray[indexPath.row];
    
    
    
    ItemListDataModel *model = model1.data;
    
    [cell.bkImageView setImageWithUrlString:model.cover.feed];
    
    cell.nameLabel.text = model.title;
    cell.detailLabel.text = model.category;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemListModel *model = _dataArray[indexPath.row];
    
    DetailTableViewController *dvc = [DetailTableViewController new];
    dvc.model = model.data;
    
    [self.navigationController pushViewController:dvc animated:YES];
}


#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法

@end
