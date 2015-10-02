//
//  NetworkTools.m
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)shareNetworkTools {
    static NetworkTools *instanct;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //后续可使用相对路径
        //但后面要以/结尾
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instanct = [[self alloc] initWithBaseURL:url];
    });
    return instanct;
}
@end
