//
//  OrderTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "OrderTableViewController.h"
#import "OrderService.h"
#import "MoreAppModel.h"
#import "CategoryTCell.h"
#import "UIImageView+WLRemoteImage.h"
#import "DetailTableViewController.h"
#import "OrderHeadView.h"
#import "ActivityView.h"
typedef enum
{
    AllOrder,
    MonthOrder,
    WeekOrder
}order;

@interface OrderTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    
    NSMutableArray *_dataArray1;
    NSMutableArray *_dataArray2;
    NSMutableArray *_dataArray3;
    
    order _type;
    UILabel *_label;
    OrderHeadView *_headView;
    UITableView *_tableView;
    ActivityView *_activityView;
}
@end



@implementation OrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
     _type = AllOrder;
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
    
     _activityView = [[ActivityView alloc]initWithFrame:self.view.bounds];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"热门排行";
        

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 104, self.view.frame.size.width, self.view.frame.size.height-104) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    OrderHeadView *headView = [[OrderHeadView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    
        headView.backgroundColor = [UIColor lightGrayColor];
    
    headView.btn1.tag = 1001;
    headView.btn2.tag = 1002;
    headView.btn3.tag = 1003;
    
    _label = headView.bottomLabel;
    
    
    
    [headView.btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView.btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView.btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _headView = headView;
    [self.view addSubview:headView];
}

#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件

-(void)btnClick:(UIButton *)btn
{
    if (btn.tag==1001)
    {
        _type = AllOrder;
        
        [UIImageView animateWithDuration:0.3 animations:^{
            _label.frame = CGRectMake(_type*_headView.frame.size.width/3, _headView.frame.size.height-1, _headView.frame.size.width/3, 1);
        }];
        
        [self loadData];
    }else if (btn.tag==1002)
    {
        _type = MonthOrder;
        [UIImageView animateWithDuration:0.3 animations:^{
            _label.frame = CGRectMake(_type*_headView.frame.size.width/3, _headView.frame.size.height-1, _headView.frame.size.width/3, 1);
        }];
        
        [self loadData];
    }else
    {
        _type = WeekOrder;
        
        [UIImageView animateWithDuration:0.3 animations:^{
            _label.frame = CGRectMake(_type*_headView.frame.size.width/3, _headView.frame.size.height-1, _headView.frame.size.width/3, 1);
        }];
        [self loadData];
    }
}

#pragma mark -
#pragma mark 数据请求
-(void)loadData
{
    
    NSString *url;
    switch (_type)
    {
        case AllOrder:
        {
             url = @"http://baobab.wandoujia.com/api/v3/ranklist?num=10&strategy=historical";
            if (_dataArray1==nil)
            {
               
                [self.view addSubview:_activityView];
                [_activityView.ac startAnimating];
                
                
                [[OrderService new]getListWithUrl:url andResultBlock:^(id result) {
                    
                    
                    MoreAppModel *model = result;
                    
                    _dataArray1 = [NSMutableArray arrayWithArray:model.itemList];
                    _dataArray = _dataArray1;
                    
                    [_activityView.ac stopAnimating];
                    
                    [_activityView removeFromSuperview];
                    
                    [_tableView reloadData];
                    
                }];
            }else
            {
                _dataArray = _dataArray1;
                
                [_tableView reloadData];
            }
        }
           
            break;
        case MonthOrder:
        {
            
            url = @"http://baobab.wandoujia.com/api/v3/ranklist?num=10&strategy=monthly";
            if (_dataArray2==nil)
            {
                
                [self.view addSubview:_activityView];
                [_activityView.ac startAnimating];
                
                [[OrderService new]getListWithUrl:url andResultBlock:^(id result) {
                    
                    
                    MoreAppModel *model = result;
                    
                    _dataArray2 = [NSMutableArray arrayWithArray:model.itemList];
                    _dataArray = _dataArray2;
                    
                    [_activityView.ac stopAnimating];
                    
                    [_activityView removeFromSuperview];
                    
                    [_tableView reloadData];
                    
                }];
            }else
            {
                 _dataArray = _dataArray2;
                 [_tableView reloadData];
            }

        }
            
            break;
        case WeekOrder:
        {
            url = @"http://baobab.wandoujia.com/api/v3/ranklist?num=10&strategy=weekly";
            if (_dataArray3==nil)
            {
                [self.view addSubview:_activityView];
                [_activityView.ac startAnimating];
                
                [[OrderService new]getListWithUrl:url andResultBlock:^(id result) {
                    
                    
                    MoreAppModel *model = result;
                    
                    _dataArray3 = [NSMutableArray arrayWithArray:model.itemList];
                    _dataArray = _dataArray3;

                    [_activityView.ac stopAnimating];
                    
                    [_activityView removeFromSuperview];
                    [_tableView reloadData];
                    
                }];
            }else
            {
                _dataArray = _dataArray3;
                 [_tableView reloadData];

            }
            
        }
            
        default:
            break;
    }
    
    
    
    
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



//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return _headView;
//}
//
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 44;
//}



#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法


@end
