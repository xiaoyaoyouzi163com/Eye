//
//  UIImageView+WLRemoteImage.m
//  LoveLimit
//
//  Created by wangliang on 16/2/16.
//  Copyright © 2016年 wangliang. All rights reserved.
//

#import "UIImageView+WLRemoteImage.h"

@implementation UIImageView (WLRemoteImage)
-(void)setImageWithUrlString:(NSString *)urlString{
    // 1、判断当前路径的图片是否存在
    UIImage * image = [self getImageByUrlString:urlString];
    if(image){
//        NSLog(@"显示本地图片");
        [self setImage:image];
    }else{
//        NSLog(@"远程获取图片");
        // 2、远程获取图片
        NSURL * url = [NSURL URLWithString:urlString];
        
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        
        // 异步请求图片
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *  response, NSData * data, NSError *  connectionError) {
            
//            // 3、保存到本地
            [self saveImageWithData:data urlString:urlString];
            
            // 4、显示图片
            UIImage * image = [self getImageByUrlString:urlString];
            [self setImage:image];
        }];
    }
}

// 获取本地图片
-(UIImage *)getImageByUrlString:(NSString *)urlString{
    // 得到图片真实路径
    NSString * imagePath = [self getImageRealPath:urlString];
    
    // 根据图片路径得到图片
    return [UIImage imageWithContentsOfFile:imagePath];
    
//    NSData * data = [[NSFileManager defaultManager]contentsAtPath:imagePath];
//    
//    if (data) {
//        return [UIImage imageWithData:data];
//    }else{
//        return nil;
//    }
    
    
    
    
}

// 将图片保存到本地
-(void)saveImageWithData:(NSData *)data urlString:(NSString *)urlString{
    // 得到图片真实路径
    NSString * imagePath = [self getImageRealPath:urlString];
    
    
    
    // 保存文件
    [[NSFileManager defaultManager] createFileAtPath:imagePath contents:data attributes:kNilOptions];
}

// 得到图片真实路径
-(NSString *)getImageRealPath:(NSString *)urlString{
    // 获取caches目录路径
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 将图片的url进行base64处理
    NSString * imageName = [self base64FromUrlString:urlString];
    
    
    [[NSFileManager defaultManager]createDirectoryAtPath:[NSString stringWithFormat:@"%@/img",path] withIntermediateDirectories:YES attributes:nil error:nil];
    // 拼接图片路径和图片目录
    NSString * imagePath = [NSString stringWithFormat:@"%@/img/%@", path, imageName];
    
//    NSLog(@"imagePath->%@",imagePath);
    return imagePath;
}

// 将图片url进行base64处理
-(NSString *)base64FromUrlString:(NSString *)urlString{
    NSData * data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    NSString * string = [data base64EncodedStringWithOptions:kNilOptions];
    return string;
}
@end
