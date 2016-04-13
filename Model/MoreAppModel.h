//
//  MoreAppModel.h
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ItemListModel.h"
@interface MoreAppModel : JSONModel

@property(nonatomic,copy)NSString *nextPageUrl;
@property(nonatomic,strong)NSArray<ItemListModel> *itemList;
@end
