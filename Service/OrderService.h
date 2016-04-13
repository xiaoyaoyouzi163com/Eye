//
//  OrderService.h
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderService : NSObject

-(void)getListWithUrl:(NSString *)urlStr andResultBlock:(ResultBlock)block;
@end
