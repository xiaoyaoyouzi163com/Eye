//
//  MoreCollectionViewCell.m
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "MoreCollectionViewCell.h"
#import "Masonry.h"
@implementation MoreCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.bkImageView = [UIImageView new];
        
        self.nameLabel = [[UILabel alloc]init];
//
        self.nameLabel.textColor = [UIColor whiteColor];
        
        self.nameLabel.font = [UIFont systemFontOfSize:22];
        
        
        [self.contentView addSubview:self.bkImageView];
        
        [self.contentView addSubview:self.nameLabel];
        
        __block MoreCollectionViewCell *blockSelf = self;
        
        [self.bkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(blockSelf.contentView);
            make.top.equalTo(blockSelf.contentView);
            make.trailing.equalTo(blockSelf.contentView);
            make.bottom.equalTo(blockSelf.contentView);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(blockSelf.contentView);
        }];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"121212");
    }
    return self;
}
@end
