//
//  HomeView.m
//  Eye
//
//  Created by chenxiang on 16/3/14.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "HomeView.h"
#import "Masonry.h"
@interface HomeView ()

@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIButton *btn;
@end
@implementation HomeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.leftView = [UIView new];
        
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [self.btn setTitle:@"点击" forState:UIControlStateNormal];
        
        [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.rightView = [UIView new];
        
        
        [self addSubview:self.leftView];
        [self addSubview:self.btn];
        
        [self addSubview:self.rightView];
        
        __block HomeView *blockSelf = self;
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(blockSelf);
            make.width.equalTo(@100);
            make.right.equalTo(blockSelf.btn.mas_left);
            
            make.height.equalTo(@[blockSelf,blockSelf.btn,blockSelf.rightView]);
        }];
        
        [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@20);
            make.left.equalTo(blockSelf.rightView.mas_left);
            
        }];
        
        [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(blockSelf);
        }];
        
        
    }
    return self;
}


-(void)btnClick:(UIButton *)btn
{
//    btn
}
@end
