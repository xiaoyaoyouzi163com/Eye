//
//  MyTableViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/17.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MyTableViewController.h"
#import "FavTableViewController.h"
#import "StatementViewController.h"
#import "MyHeadView.h"
#import "UMSocial.h"
@interface MyTableViewController ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    float _cacheSize;
    
    UITapGestureRecognizer *_tap;
    UIImageView *_iconImageView;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self checkTmpSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark 创建页面
-(void)createUI
{
    
    self.navigationItem.title = @"我的地盘";
   
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    self.tableView.bounces = NO;
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClicked:)];
    _tap  = tap;
}

#pragma mark -
#pragma mark 加载数据

#pragma mark -
#pragma mark 事件
//计算缓存图片大小
- (float)checkTmpSize {
    float totalSize = 0;
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
//    NSLog(@"%@",path);
    NSString *imagePath=[NSString stringWithFormat:@"%@/img",path];
    
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:imagePath];
    
    for (NSString *fileName in fileEnumerator) {
        NSString *filePath = [imagePath stringByAppendingPathComponent:fileName];
        NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        unsigned long long length = [attrs fileSize];
        totalSize += length / 1024.0 / 1024.0;
    } // NSLog(@"tmp size is %.2f",totalSize); return totalSize;
    
    _cacheSize = totalSize;
    return totalSize;
}

-(IBAction)tapClicked:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"从手机中选择" otherButtonTitles:@"拍照", nil];
    
    [sheet showInView:self.tableView];
}


-(void)selectPhotos
{
    UIImagePickerController *pc = [UIImagePickerController new];
    pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    pc.delegate = self;
    pc.allowsEditing = YES;
    [self presentViewController:pc animated:YES completion:nil];

    
}

-(void)takePhotos
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * ipc = [UIImagePickerController new];
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.delegate = self;
        ipc.allowsEditing = YES;
        [self presentViewController:ipc animated:YES completion:nil];
    }else
    {
        NSLog(@"不能拍照");
    }
    
}
-(void)login
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
}


#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理



-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@",info);
    if ([info[@"UIImagePickerControllerMediaType"]isEqualToString:@"public.image"])
    {
        UIImage *image = info[@"UIImagePickerControllerEditedImage"];
        
        _iconImageView.image = image;
        
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            [self selectPhotos];
        }
            
            break;
          case 1:
        {
            [self takePhotos];
        }
            break;
            case 2:
        {
            
        }
            break;
        default:
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const reuseidentifier = @"setCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseidentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseidentifier];
    }
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.layer.masksToBounds = YES;
    if (indexPath.row==0)
    {
        cell.textLabel.text = @"我的收藏";
        cell.imageView.image = [UIImage imageNamed:@"icon_wodedingzuo"];
    }else if(indexPath.row==1)
    {
        cell.textLabel.text = @"清理缓存";
        cell.imageView.image = [UIImage imageNamed:@"icon_wodejifenzzz"];
    }else if (indexPath.row==2)
    {
        cell.textLabel.text = @"意见反馈";
        cell.imageView.image = [UIImage imageNamed:@"ico_jifenguize"];
    }else if(indexPath.row==3)
    {
        cell.imageView.image = [UIImage imageNamed:@"icon_wodedingdan"];
        cell.textLabel.text = @"声明";
    }else
    {
        cell.imageView.image = [UIImage imageNamed:@"icon_guanyu"];
        cell.textLabel.text = @"关于我们";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        FavTableViewController *fv = [[FavTableViewController alloc]initWithStyle:UITableViewStylePlain];
        
        [self.navigationController pushViewController:fv animated:YES];
    }else if (indexPath.row==1)
    {
         [self checkTmpSize];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"已清理缓存%.2fMB",_cacheSize] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        
//        NSLog(@"%@",path);
        NSString *imagePath=[NSString stringWithFormat:@"%@/img",path];
        
        [[NSFileManager defaultManager]removeItemAtPath:imagePath error:nil];
        
        
        [[NSFileManager defaultManager]contentsAtPath:@""];
        
        
        
        [alertView show];
        
    }
    
    else if (indexPath.row==2)
    {
         [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"mailto://ganggeaiav@163.com"]];
    }else if (indexPath.row==4)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"谢谢使用!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    }else if (indexPath.row==3)
    {
//        StatementViewController *svc = [[StatementViewController alloc]init];
//        
//        [self.navigationController pushViewController:svc animated:YES];
    }
}

/*
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MyHeadView *view = [[MyHeadView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 120)];
    
    [view.iconImageView addGestureRecognizer:_tap];
    
    [view.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    _iconImageView = view.iconImageView;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}
*/
#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

#pragma mark -
#pragma mark 帮助方法


@end
