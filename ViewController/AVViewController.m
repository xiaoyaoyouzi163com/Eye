//
//  AVViewController.m
//  Eye
//
//  Created by chenxiang on 16/3/16.
//  Copyright © 2016年 陈祥. All rights reserved.
//

#import "AVViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "Masonry.h"
@interface AVViewController ()
{
//    AVPlayer *_myPlayer;
    MPMoviePlayerController * _myPlayerController;

    
}
@property (weak, nonatomic) IBOutlet UIView *AVplayerView;
@end

@implementation AVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    /*
    _myPlayer = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:self.playUrl]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_myPlayer];
    playerLayer.frame = self.AVplayerView.bounds;
    [self.AVplayerView.layer addSublayer:playerLayer];
     [_myPlayer play];
    
    */
    _myPlayerController = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:self.playUrl]];
    _myPlayerController.controlStyle = MPMovieControlStyleDefault;
    _myPlayerController.repeatMode = MPMovieRepeatModeNone;
    _myPlayerController.scalingMode = MPMovieScalingModeAspectFit;
    
//    _myPlayerController.view.frame = _AVplayerView.bounds;
    
//    _myPlayerController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);
//    
//    _myPlayerController.view.center = self.view.center;
    
    [_AVplayerView addSubview:_myPlayerController.view];
    
    
    [_myPlayerController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_AVplayerView);
        make.leading.equalTo(_AVplayerView);
        make.top.equalTo(_AVplayerView);
        make.bottom.equalTo(_AVplayerView);
        
    }];
    
    
    
    [_myPlayerController play];
  
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
