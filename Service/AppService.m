//
//  AppService.m
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "AppService.h"
#import "AFNetworking.h"
#import "AppModel.h"
@implementation AppService


-(void)getHomeListWithResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://baobab.wandoujia.com/api/v2/feed?num=2" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        NSLog(@"%@",responseObject);
        AppModel *model = [[AppModel alloc]initWithDictionary:responseObject error:nil];
        block(model);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


-(void)getNextListWithUrlStr:(NSString *)url andResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        
        AppModel *model = [[AppModel alloc]initWithDictionary:responseObject error:nil];
        block(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下一页请求失败");
    }];
}


@end
