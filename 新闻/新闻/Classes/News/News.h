//
//  News.h
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
//新闻标题
@property (nonatomic, copy) NSString *title;
//新闻摘要
@property (nonatomic, copy) NSString *digest;
//跟帖数量
@property (nonatomic, assign) int replyCount;
///配图地址
@property (nonatomic, copy) NSString *imgsrc;
//多图
@property (nonatomic, strong) NSArray *imgextra;
//大图
@property (nonatomic, assign, getter=isBigImage) BOOL imgType;
@property (nonatomic, copy) NSString *url;
//加载制定URL 的新闻数组
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *newsList)) finished;
@end
