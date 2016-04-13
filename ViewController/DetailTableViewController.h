//
//  DetailTableViewController.h
//  Eye
//
//  Created by chenxiang on 16/3/15.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemListDataModel.h"
@interface DetailTableViewController : UITableViewController

@property(nonatomic,strong)ItemListDataModel *model;

@end
