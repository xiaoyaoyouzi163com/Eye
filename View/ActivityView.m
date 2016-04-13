//
//  ActivityView.m
//  Eye
//
//  Created by chenxiang on 16/3/23.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "ActivityView.h"

@implementation ActivityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ac = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        self.ac.center = self.center;
        self.ac.color = [UIColor blackColor];
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.alpha = 0.5;
        
        [self addSubview:self.ac];
        
    }
    return self;
}

@end
