//
//  MyHeadView.m
//  Eye
//
//  Created by chenxiang on 16/3/19.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.iconImageView.center = self.center;

        self.iconImageView.image = [UIImage imageNamed:@"UMS_User_profile_default"];
        
//        self.iconImageView.backgroundColor = [UIColor yellowColor];
        self.iconImageView.userInteractionEnabled = YES;
        
        self.iconImageView.layer.cornerRadius = 40;
        self.iconImageView.layer.masksToBounds = YES;
        
        [self addSubview:self.iconImageView];
        
        
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.loginBtn.frame = CGRectMake(self.iconImageView.frame.origin.x, CGRectGetMaxY(self.iconImageView.frame), 50, 50);
        
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        [self addSubview:self.loginBtn];
        
        
//        self.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}

@end
