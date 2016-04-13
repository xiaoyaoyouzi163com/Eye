//
//  IssueListModel.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ItemListModel.h"

@protocol IssueListModel


@end
@interface IssueListModel : JSONModel

@property(nonatomic,copy)NSNumber *date;
@property(nonatomic,strong)NSNumber *publishTime;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,strong)NSNumber *count;

@property(nonatomic,strong)NSArray<ItemListModel> *itemList;
@end
