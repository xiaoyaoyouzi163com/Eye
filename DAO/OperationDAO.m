//
//  OperationDAO.m
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "OperationDAO.h"
#import "LKDBHelper.h"
@implementation OperationDAO

+(BOOL)saveModelToDBWithModel:(ItemListDataModel *)model
{
    if ([self selectFromWithid:model.cxid]) {
        return YES;
    }else
    {
         return [model saveToDB];
    }
    
   
}

+(ItemListDataModel *)selectFromWithid:(NSNumber *)cxid
{
    return [ItemListDataModel searchSingleWithWhere:@{@"cxid":cxid} orderBy:nil];
}

+(BOOL)deleteWithid:(NSNumber *)cxid
{
    if ([self selectFromWithid:cxid])
    {
        return [ItemListDataModel deleteWithWhere:@{@"cxid":cxid}];
    }
    return NO;
}

+(NSArray *)selectAll
{
    return [ItemListDataModel searchWithWhere:nil];
}


@end
