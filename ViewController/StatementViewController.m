//
//  StatementViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/17.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "StatementViewController.h"

@interface StatementViewController ()

@end

@implementation StatementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createUI
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, self.view.frame.size.height-64)];
    
    label.backgroundColor = [UIColor yellowColor];
    label.textColor = [UIColor blackColor];
    
    label.text = @"";
    label.numberOfLines = 0;

    [self.view addSubview:label];
    
}

@end
