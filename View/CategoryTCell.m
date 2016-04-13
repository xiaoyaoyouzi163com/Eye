//
//  CategoryTCell.m
//  delicious
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "CategoryTCell.h"
#import "Masonry.h"
@implementation CategoryTCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bkImageView = [UIImageView new];
        self.bkImageView.image = [UIImage imageNamed:@"defaulBgImgpleaseHoeser"];
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont systemFontOfSize:20 weight:1];
        
        
        self.detailLabel = [UILabel new];
        
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        
        self.detailLabel.textColor = [UIColor whiteColor];
        self.detailLabel.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:self.bkImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.detailLabel];
        
        
        __block CategoryTCell *blockSelf = self;
        [self.bkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(blockSelf.contentView);
            make.top.equalTo(blockSelf.contentView);
            make.trailing.equalTo(blockSelf.contentView);
            make.bottom.equalTo(blockSelf.contentView);
            
        }];
        
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(blockSelf.contentView);
            make.centerY.equalTo(blockSelf.contentView);
            
            make.bottom.equalTo(blockSelf.detailLabel.mas_top);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(blockSelf.contentView);
            
            make.width.mas_equalTo(@200);
            
//            make.leading.equalTo(blockSelf.contentView).offset(10);
//            make.trailing.equalTo(blockSelf.contentView).offset(-10);
            
        }];
        
        
        
        
        
    }
    return  self;
}

@end
