//
//  OperationDAO.h
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemListDataModel.h"
@interface OperationDAO : NSObject
+(BOOL)saveModelToDBWithModel:(ItemListDataModel *)model;
+(BOOL)deleteWithid:(NSNumber *)cxid;
+(NSArray *)selectAll;

+(ItemListDataModel *)selectFromWithid:(NSNumber *)cxid;
@end
