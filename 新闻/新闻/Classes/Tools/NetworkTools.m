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
        //添加解析的数据格式  AFN 为了避免出错，默认只支持三种类型的JSON的解析类型，可以用一下方法来添加
        instanct.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return instanct;
}
@end
