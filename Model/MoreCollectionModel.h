//
//  MoreCollectionModel.h
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@interface MoreCollectionModel : JSONModel

@property (nonatomic, strong) NSNumber *cxid;
@property (nonatomic, copy) NSString *bgColor;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *bgPicture;
@end
