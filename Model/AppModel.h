//
//  AppModel.h
//  Eye
//
//  Created by chenxiang on 16/3/12.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "IssueListModel.h"
@interface AppModel : JSONModel
@property (nonatomic, strong) NSNumber *nextPublishTime;
@property (nonatomic, copy) NSString *nextPageUrl;
@property (nonatomic, copy) NSString *newestIssueType;


@property(nonatomic,strong)NSArray<IssueListModel> *issueList;

@end
