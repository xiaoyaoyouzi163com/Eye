//
//  CustomView.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "CustomView.h"
#import "Masonry.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, frame.size.width-20, frame.size.width-20)];
        
        self.iconImageView.backgroundColor = [UIColor yellowColor];
        
        
        self.nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        
        self.nameBtn.frame = CGRectMake(10, CGRectGetMaxY(self.iconImageView.frame), frame.size.width-20, 40);
        [self.nameBtn setTitle:@"我的名字" forState:UIControlStateNormal];
        
        
        self.favBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.favBtn.frame = CGRectMake(10, CGRectGetMaxY(self.nameBtn.frame), frame.size.width-20, 40);
        [self.favBtn setTitle:@"我的收藏" forState:UIControlStateNormal];
        
        self.setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         self.setBtn.frame = CGRectMake(10, CGRectGetMaxY(self.favBtn.frame), frame.size.width-20, 40);
        [self.setBtn setTitle:@"设置" forState:UIControlStateNormal];
        
        [self addSubview:self.iconImageView];
        [self addSubview:self.nameBtn];
        
        [self addSubview:self.favBtn];
        [self addSubview:self.setBtn];
        
        
    }
    return self;
}


//-(void)setFrame:(CGRect)frame
//{
//    self.iconImageView.frame = CGRectMake(10, 10, frame.size.width-20, frame.size.width-20);
//    self.nameBtn.frame = CGRectMake(10, CGRectGetMaxY(self.iconImageView.frame), frame.size.width-20, 40);
//      self.favBtn.frame = CGRectMake(10, CGRectGetMaxY(self.nameBtn.frame), frame.size.width-20, 40);
//     self.setBtn.frame = CGRectMake(10, CGRectGetMaxY(self.favBtn.frame), frame.size.width-20, 40);
//}

@end
