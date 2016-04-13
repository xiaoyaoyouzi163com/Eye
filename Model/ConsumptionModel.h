//
//  ConsumptionModel.h
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ConsumptionModel : JSONModel

@property (nonatomic, strong) NSNumber *collectionCount;
@property (nonatomic, strong) NSNumber *shareCount;
@property (nonatomic, strong) NSNumber *replyCount;
@property (nonatomic, strong) NSNumber *playCount;

@end
