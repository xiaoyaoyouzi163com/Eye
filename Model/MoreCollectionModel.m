//
//  MoreCollectionModel.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MoreCollectionModel.h"

@implementation MoreCollectionModel


+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"cxid"}];
}
@end
