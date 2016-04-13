//
//  OrderHeadView.m
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "OrderHeadView.h"

@implementation OrderHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn1.frame = CGRectMake(0, 0, frame.size.width/3, frame.size.height-1);
      
        [self.btn1 setTitle:@"总排行" forState:UIControlStateNormal];
         [self.btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self addSubview:self.btn1];
        
        self.bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width/3, 1)];
        self.bottomLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.bottomLabel];
        
        
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn2.frame = CGRectMake(frame.size.width/3, 0, frame.size.width/3, frame.size.height-1);
        [self addSubview:self.btn2];
        
        [self.btn2 setTitle:@"月排行" forState:UIControlStateNormal];
        [self.btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self addSubview:self.btn2];
        
        self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn3.frame = CGRectMake(2*frame.size.width/3, 0, frame.size.width/3, frame.size.height-1);
        [self addSubview:self.btn3];
        [self.btn3 setTitle:@"周排行" forState:UIControlStateNormal];
        [self.btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     

        [self addSubview:self.btn1];
    
    }
    return self;
}

@end
