//
//  CustomToolView.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "CustomToolView.h"

@implementation CustomToolView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.btn1.frame = CGRectMake(0, 0, self.frame.size.width/3, 44);
         self.btn2.frame = CGRectMake(CGRectGetMaxX(self.btn1.frame),0 , self.frame.size.width/3, 44);
         self.btn3.frame = CGRectMake(CGRectGetMaxX(self.btn2.frame), 0, self.frame.size.width/3, 44);
        
        [self.btn1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
          [self.btn2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
          [self.btn3 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        
        [self addSubview:self.btn1];
        [self addSubview:self.btn2];
        [self addSubview:self.btn3];

        
    }
    return self;
}



@end
