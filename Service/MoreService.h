//
//  MoreService.h
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreService : NSObject

-(void)getMoreListWithResultBlock:(ResultBlock)block;

-(void)getTimeListWithName:(NSString *)name andResultBlock:(ResultBlock)block;
-(void)getShareListWithName:(NSString *)name andResultBlock:(ResultBlock)block;

-(void)getShareListWithUrlStr:(NSString *)urlStr andResultBlock:(ResultBlock)block;


@end
