//
//  ItemListDataModel.m
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "ItemListDataModel.h"

@implementation ItemListDataModel

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}



+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"cxdescription",@"id":@"cxid"}];
}



@end
