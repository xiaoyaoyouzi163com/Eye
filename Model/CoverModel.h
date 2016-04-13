//
//  CoverModel.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CoverModel : JSONModel

@property (nonatomic, copy) NSString *blurred;
@property (nonatomic, copy) NSString *sharing;
@property (nonatomic, copy) NSString *feed;
@property (nonatomic, copy) NSString *detail;
@end
