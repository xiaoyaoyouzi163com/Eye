//
//  HomeBarViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "HomeBarViewController.h"
#import "MoreCollectionViewController.h"
#import "HomeTableViewController.h"
#import "OrderTableViewController.h"
#import "MyTableViewController.h"
@interface HomeBarViewController ()

@end

@implementation HomeBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createUI
{
   
    HomeTableViewController *homeVc = [[HomeTableViewController alloc]init];
    homeVc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"每日精选" image:[UIImage imageNamed:@"btn_home_norma"] selectedImage:[UIImage imageNamed:@"btn_home_pressed"]];
    
    
    [homeVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];

    
    UINavigationController *nvc1 = [[UINavigationController alloc]initWithRootViewController:homeVc];
    
    
    
    MoreCollectionViewController *moreVc = [[MoreCollectionViewController alloc]initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
   
    moreVc.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"更多推荐" image:[UIImage imageNamed:@"btn_idea_norma"] selectedImage:[UIImage imageNamed:@"btn_idea_pressed"]];
    [moreVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UINavigationController *nvc2 = [[UINavigationController alloc]initWithRootViewController:moreVc];
    
    
    
    
    OrderTableViewController *oVC = [[OrderTableViewController alloc]init];
    
    oVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"热门排行" image:[UIImage imageNamed:@"btn_design_norma"] selectedImage:[UIImage imageNamed:@"btn_design_pressed"]];
    
    [oVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];

    UINavigationController *nvc3 = [[UINavigationController alloc]initWithRootViewController:oVC];
    
    MyTableViewController *mVC = [[MyTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    mVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的地盘" image:[UIImage imageNamed:@"btn_mine_norma"] selectedImage:[UIImage imageNamed:@"btn_mine_pressed"]];
    [mVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    UINavigationController *nvc4 = [[UINavigationController alloc]initWithRootViewController:mVC];
    
    self.viewControllers = @[nvc1,nvc2,nvc3,nvc4];
}

@end
