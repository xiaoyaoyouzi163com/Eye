//
//  MoreService.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MoreService.h"
#import "AFNetworking.h"
#import "MoreCollectionModel.h"
#import "ItemListModel.h"
#import "MoreAppModel.h"
@implementation MoreService


-(void)getMoreListWithResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://baobab.wandoujia.com/api/v2/categories?" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSArray *array = responseObject;
        NSLog(@"更多数据请求成功");
        NSMutableArray *mArray = [NSMutableArray new];
        for (NSDictionary *dic in responseObject)
        {
            MoreCollectionModel *model = [[MoreCollectionModel alloc]initWithDictionary:dic error:nil];
            [mArray addObject:model];
        }
        
        block(mArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)getShareListWithName:(NSString *)name andResultBlock:(ResultBlock)block
{
    // http://baobab.wandoujia.com/api/v3/videos?categoryName=%E5%88%9B%E6%84%8F&strategy=shareCount
    
    
    NSString *str = @"http://baobab.wandoujia.com/api/v3/videos?strategy=shareCount";
    
    NSString *url = [NSString stringWithFormat:@"%@&categoryName=%@",str,name];
   url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
   
    [self getShareListWithUrlStr:url andResultBlock:block];
}



-(void)getShareListWithUrlStr:(NSString *)urlStr andResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        MoreAppModel *model = [[MoreAppModel alloc]initWithDictionary:responseObject error:nil];
        block(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

-(void)getTimeListWithName:(NSString *)name andResultBlock:(ResultBlock)block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *str = @"http://baobab.wandoujia.com/api/v3/videos?trategy=date";
    
    NSString *url = [NSString stringWithFormat:@"%@&categoryName=%@",str,name];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MoreAppModel *model = [[MoreAppModel alloc]initWithDictionary:responseObject error:nil];
        block(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

@end
