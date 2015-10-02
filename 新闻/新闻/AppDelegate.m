//
//  AppDelegate.m
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>//网络指示器头文件
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置缓存
    NSURLCache *cache = [[NSURLCache alloc]initWithMemoryCapacity:4*1024*1024 diskCapacity:20 *1024*1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
    //设置网络指示器 后续的操作AFN网络请求都有小菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled =YES;
    
    return YES;
}


@end
