//
//  MoreCollectionViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MoreCollectionViewController.h"
#import "MoreService.h"
#import "MoreCollectionViewCell.h"
#import "UIImageView+WLRemoteImage.h"
#import "MoreCollectionModel.h"
#import "MoreTableViewController.h"
#import "ActivityView.h"
@interface MoreCollectionViewController ()<UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
    ActivityView *_activityView;

}
@end

@implementation MoreCollectionViewController

static NSString * const reuseIdentifier = @"Cell";



- (void)viewDidLoad {
    [super viewDidLoad];
    _activityView = [[ActivityView alloc]initWithFrame:self.view.bounds];
    [self createUI];
    
    [self loadData];
    
    // Register cell classes
    [self.collectionView registerClass:[MoreCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark 创建页面

-(void)createUI
{
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"更多推荐";
    
    
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
    [[MoreService new]getMoreListWithResultBlock:^(id result) {
        
        _dataArray = result;
        [_activityView.ac stopAnimating];
        [_activityView removeFromSuperview];
        [self.collectionView reloadData];
    }];
}

#pragma mark -
#pragma mark 代理

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    MoreCollectionModel *model = _dataArray[indexPath.row];
    
    [cell.bkImageView  setImageWithUrlString:model.bgPicture];
    cell.nameLabel.text = model.name;
    return cell;
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-30)/2, (SCREEN_WIDTH-30)/2);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10,10, 10, 10);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoreTableViewController *moreTab = [[MoreTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    MoreCollectionModel *model = _dataArray[indexPath.row];
    
    moreTab.titleId = [NSString stringWithFormat:@"%@",model.name];
    
    [self.navigationController pushViewController:moreTab animated:YES];
}
#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法


@end
