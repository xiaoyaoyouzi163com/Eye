//
//  ItemListDataModel.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CoverModel.h"
#import "ConsumptionModel.h"
@interface ItemListDataModel :JSONModel

@property (nonatomic, copy) NSString *cxdescription;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic, strong) NSNumber *idx;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSNumber *cxid;
@property (nonatomic, strong) NSNumber *date;
@property (nonatomic, copy) NSString *playUrl;

@property(nonatomic,strong)CoverModel *cover;
@property(nonatomic,strong)ConsumptionModel *consumption;
@end
