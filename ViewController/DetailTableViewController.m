//
//  DetailTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "DetailTableViewController.h"
#import "DetailTableViewCell.h"
#import "UIImageView+WLRemoteImage.h"
#import "AVViewController.h"
#import "OperationDAO.h"
#import "UMSocial.h"

@interface DetailTableViewController ()<UMSocialDataDelegate>

{
    UITapGestureRecognizer *_tap;
}
@end

static NSString *const reuseIdentifier = @"DetailTableViewCell";
@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark 创建页面
-(void)createUI
{
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(shareClicked:)];
    if ([OperationDAO selectFromWithid:self.model.cxid]) {
    
        UIBarButtonItem *favItem = [[UIBarButtonItem alloc]initWithTitle:@"取消收藏" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];

        self.navigationItem.rightBarButtonItems = @[shareItem,favItem];
//        self.navigationItem.rightBarButtonItems = @[favItem];
        
    }else
    {
         UIBarButtonItem *favItem = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];
        self.navigationItem.rightBarButtonItems = @[shareItem,favItem];
//        self.navigationItem.rightBarButtonItems = @[favItem];

    }
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    
}
#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件

-(void)rightItemClick:(UIBarButtonItem *)item
{
//    NSLog(@"%@",NSHomeDirectory());
    
    if ([item.title isEqualToString:@"收藏"])
    {
        if ([OperationDAO saveModelToDBWithModel:self.model]) {
//            NSLog(@"保存成功");
            
            item.title = @"取消收藏";
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            
            [alertView show];
        }
    }else
    {
        [OperationDAO deleteWithid:self.model.cxid];
        
        item.title = @"收藏";
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"取消收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
    }
    
}




-(void)tapClick
{
    AVViewController *avc = [[AVViewController alloc]initWithNibName:@"AVViewController" bundle:nil];
    avc.playUrl = self.model.playUrl;
    avc.hidesBottomBarWhenPushed = YES;
    
    
    
    [self.navigationController pushViewController:avc animated:YES];
}

-(void)shareClicked:(UIBarButtonItem *)item
{
    [UMSocialData defaultData].extConfig.title = @"天窗";
    
//    [UMSocialData defaultData].extConfig.qqData.title = @"现在呢?";
//    [UMSocialData defaultData].extConfig.qzoneData.title = @"qq空间分享";
//    
//    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信分享";
//    [UMSocialData defaultData].extConfig.wechatTimelineData.title =@"朋友圈分享";
    
    [UMSocialData defaultData].extConfig.qqData.url = self.model.playUrl;
    
    [UMSocialData defaultData].extConfig.qzoneData.url = self.model.playUrl;
    [UMSocialData defaultData].extConfig.wechatSessionData.url = self.model.playUrl;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = self.model.playUrl;
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56ea9587e0f55ab2e1000519"
                                      shareText:@"open your eyes"
                                     shareImage:[UIImage imageNamed:@"appicon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
}

#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.avImageView setImageWithUrlString:self.model.cover.feed];
    
    [cell.bkImageView setImageWithUrlString:self.model.cover.blurred];
    
    cell.nameLabel.text = self.model.title;
    cell.categroyLabel.text = self.model.category;
    cell.detailLabel.text = self.model.cxdescription;
    
    cell.favLabel.text = [NSString stringWithFormat:@"%@",self.model.consumption.collectionCount];
    cell.shareLabel.text = [NSString stringWithFormat:@"%@",self.model.consumption.shareCount];
    
    [cell.playerImageView addGestureRecognizer:_tap];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView cellForRowAtIndexPath:indexPath];
    return self.tableView.frame.size.height;
}

-(void)didFinishGetUMSocialDataResponse:(UMSocialResponseEntity *)response
{
    
}
#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法


@end
