//
//  OrderService.m
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "OrderService.h"
#import "MoreAppModel.h"
#import "AFNetworking.h"
@implementation OrderService


-(void)getListWithUrl:(NSString *)urlStr andResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"排序请求成功!");
        MoreAppModel *model = [[MoreAppModel alloc]initWithDictionary:responseObject error:nil];
        block(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
