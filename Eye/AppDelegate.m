//
//  AppDelegate.m
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeBarViewController.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "AFNetworkReachabilityManager.h"
#import "umsocial"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HomeBarViewController *hvc = [[HomeBarViewController alloc]init];
    
   
    
    self.window.rootViewController = hvc;
    
    //设置友盟的Appkey
    [UMSocialData setAppKey:@"56ea9587e0f55ab2e1000519"];
    
    //设置微信AppID
    [UMSocialWechatHandler setWXAppId:@"wx73025afd6ed93466" appSecret:@"f8f674db534d85dbdbaffa89c9f7251d" url:@"http://www.baidu.com"];
    //qq的AppID
    [UMSocialQQHandler setQQWithAppId:@"1105196779" appKey:@"43RTpuMNufKQIYvY" url:@"http://www.baidu.com"];
    
    [UMSocialSinaSSOHandler ]
    
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ, UMShareToQzone, UMShareToWechatSession, UMShareToWechatTimeline,UMShareToSina]];
    
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //AFNetworkReachabilityStatusUnknown          = -1,
        //        AFNetworkReachabilityStatusNotReachable     = 0,
        //        AFNetworkReachabilityStatusReachableViaWWAN = 1,
        //        AFNetworkReachabilityStatusReachableViaWiFi = 2,
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你当前处于2G/3G/4G网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
//                NSLog(@"你当前处于wifi下");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
            {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"网络未连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alertView show];
            }
                break;
            default:
                break;
        }
    }];
    
    
    
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if ([NSStringFromClass([[[window subviews]lastObject] class]) isEqualToString:@"UITransitionView"]) {
        return UIInterfaceOrientationMaskAll;
        //优酷 土豆  乐视  已经测试可以
    }
    return UIInterfaceOrientationMaskPortrait;
}
@end
