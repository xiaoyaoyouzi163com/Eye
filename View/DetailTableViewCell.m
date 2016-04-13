//
//  DetailTableViewCell.m
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "Masonry.h"

//@property (weak, nonatomic) IBOutlet UIImageView *avImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *bkImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *playerImageView;
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *categroyLabel;
//@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
//@property (weak, nonatomic) IBOutlet UILabel *favLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *favImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *shareImageView;
//@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@implementation DetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    /*
    __block DetailTableViewCell *blockSelf = self;
    [self.avImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(blockSelf.contentView);
        make.trailing.equalTo(blockSelf.contentView);
        make.top.equalTo(blockSelf.contentView);
        
        make.bottom.equalTo(blockSelf.bkImageView);
    }];
    
    [self.bkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(blockSelf.contentView);
        make.trailing.equalTo(blockSelf.contentView);
        make.bottom.equalTo(blockSelf.contentView);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@[blockSelf.categroyLabel.mas_leading,blockSelf.detailLabel.mas_leading,blockSelf.favImageView.mas_leading]);
        make.leading.equalTo(blockSelf.contentView).offset(10);
        
       
        make.top.equalTo(blockSelf.avImageView).offset(2);
    }];
    
    [self.categroyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blockSelf.nameLabel.mas_bottom).offset(5);
        make.bottom.equalTo(blockSelf.detailLabel).offset(-5);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(blockSelf.favImageView.mas_top);
        
        make.width.equalTo(@200);
        make.trailing.equalTo(blockSelf.contentView).offset(-10);
    }];
    
    
    [self.favImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.bottom.equalTo(blockSelf.contentView).offset(10);
        
        make.centerY.equalTo(@[blockSelf.favLabel,blockSelf.shareImageView,blockSelf.shareLabel]);
    }];
    */
}

/*
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        __block DetailTableViewCell *blockSelf = self;
        [self.avImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(blockSelf.contentView);
            make.trailing.equalTo(blockSelf.contentView);
            make.top.equalTo(blockSelf.contentView);
            
            make.bottom.equalTo(blockSelf.bkImageView);
        }];
        
        [self.bkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(blockSelf.contentView);
            make.trailing.equalTo(blockSelf.contentView);
            make.bottom.equalTo(blockSelf.contentView);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@[blockSelf.categroyLabel.mas_leading,blockSelf.detailLabel.mas_leading,blockSelf.favImageView.mas_leading]);
            make.leading.equalTo(blockSelf.contentView).offset(10);
            
            make.top.equalTo(blockSelf.avImageView).offset(2);
        }];
        
        [self.categroyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(blockSelf.nameLabel.mas_bottom).offset(5);
            make.bottom.equalTo(blockSelf.detailLabel).offset(-5);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(blockSelf.favImageView.mas_top);
        }];
        
        
        [self.favImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.bottom.equalTo(blockSelf.contentView).offset(10);
            
            make.centerY.equalTo(@[blockSelf.favLabel,blockSelf.shareImageView,blockSelf.shareLabel]);
        }];
        
        
        
        
    }
    return self;
}
 */
@end
