//
//  AppService.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppService : NSObject
-(void)getHomeListWithResultBlock:(ResultBlock)block;

-(void)getNextListWithUrlStr:(NSString *)url andResultBlock:(ResultBlock)block;
@end
