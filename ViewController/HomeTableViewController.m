//
//  HomeTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "HomeTableViewController.h"
#import "CategoryTCell.h"
#import "MJRefresh.h"
#import "AppModel.h"
#import "AppService.h"
#import "UIImageView+WLRemoteImage.h"
#import "CustomView.h"
#import "CustomToolView.h"
#import "MoreCollectionViewController.h"
#import "DetailTableViewController.h"
#import "UIImageView+WebCache.h"
#import "ActivityView.h"
@interface HomeTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   
    CustomView *_leftView;
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    
    NSString *_nextUrl;
    
    ActivityView *_activityView;
}
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _dataArray = [NSMutableArray new];
    _activityView = [[ActivityView alloc]initWithFrame:self.view.bounds];
    [self createUI];

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
    
    self.navigationItem.title = @"每日精选";
    
       
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _leftView = [[CustomView alloc]initWithFrame:CGRectMake(0, 64, 100, self.view.frame.size.height)];
    [self.view addSubview:_leftView];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
   
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"more"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
    
    
    
    __block HomeTableViewController *blockSelf = self;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [blockSelf loadData];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([_tableView.mj_header isRefreshing] )
            {
                [_tableView.mj_header endRefreshing];
            }
        });
       
    }];
    
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [blockSelf loadNextData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([_tableView.mj_footer isRefreshing] )
            {
                [_tableView.mj_footer endRefreshing];
            }
        });
       
    }];
    
    
//    [self configView];
}

/*
-(void)configView
{

    
    
    _toolView = [[CustomToolView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    
    
    
    _toolView.btn1.selected = YES;
    [_toolView.btn1 setTitle:@"每日精选" forState:UIControlStateNormal];
     [_toolView.btn2 setTitle:@"更多发现" forState:UIControlStateNormal];
     [_toolView.btn3 setTitle:@"热门排行" forState:UIControlStateNormal];
    
    
    [_toolView.btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
     [_toolView.btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
     [_toolView.btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_toolView];
   
    
}
*/
#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件




/*
-(void)leftItemClick
{
//    _leftView.backgroundColor = [UIColor redColor];
    
    if (_leftView.frame.size.width==100 && _tableView.frame.size.width!=self.view.frame.size.width)
    {
        [UIView animateWithDuration:0.5 animations:^{
            _leftView.frame = CGRectMake(0, 64, 0, self.view.frame.size.height-64);
            _tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
           
        }];
        
        
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            _leftView.frame = CGRectMake(0, 64, 100, self.view.frame.size.height);
            _tableView.frame = CGRectMake(100, 64, self.view.frame.size.width-100, self.view.frame.size.height-64);
            
        }];
    }
    
}
*/
#pragma mark -
#pragma mark 数据请求

-(void)loadData
{
    [self.view addSubview:_activityView];
    [_activityView.ac startAnimating];

    NSMutableArray *arr = [NSMutableArray new];
    [[AppService new]getHomeListWithResultBlock:^(id result) {
        AppModel *appModel = result;
        
        _nextUrl = appModel.nextPageUrl;
        for (IssueListModel *model1 in appModel.issueList)
        {
            for (ItemListModel *model2 in model1.itemList)
            {
                if ([model2.type isEqualToString:@"video"])
                {
                    ItemListDataModel *model = model2.data;
                    [arr addObject:model];
                }
                
            }
        }
        _dataArray = arr;
        
        [_activityView.ac stopAnimating];
        [_activityView removeFromSuperview];
        [_tableView reloadData];
    }];
}

-(void)loadNextData
{
    [self.view addSubview:_activityView];
    [_activityView.ac startAnimating];
    [[AppService new]getNextListWithUrlStr:_nextUrl andResultBlock:^(id result) {
        AppModel *appModel = result;
        
        _nextUrl = appModel.nextPageUrl;
        for (IssueListModel *model1 in appModel.issueList)
        {
            for (ItemListModel *model2 in model1.itemList)
            {
                if ([model2.type isEqualToString:@"video"])
                {
                    ItemListDataModel *model = model2.data;
                    [_dataArray addObject:model];
                }
                
            }
        }
        [_activityView.ac stopAnimating];
        [_activityView removeFromSuperview];
        
        [_tableView reloadData];
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
    ItemListDataModel *model = _dataArray[indexPath.row];
    
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
    ItemListDataModel *model = _dataArray[indexPath.row];
    
    DetailTableViewController *dvc = [DetailTableViewController new];
    dvc.model = model;
    
    dvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dvc animated:YES];

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    // cell.layer.anchorPoint = CGPointMake(0, 0.5);
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
 
#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法




@end
