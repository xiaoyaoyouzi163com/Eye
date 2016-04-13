//
//  ItemListModel.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ItemListDataModel.h"

@protocol ItemListModel

@end
@interface ItemListModel : JSONModel


@property(nonatomic,copy)NSString *type;
@property(nonatomic,strong)ItemListDataModel *data;
@end
