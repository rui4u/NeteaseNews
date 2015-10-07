//
//  ChannelCell.m
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"
@interface ChannelCell ()

@end
@implementation ChannelCell

- (void)setStrURL:(NSString *)strURL {
    _strURL = strURL;
    //不能写到awakeFromNib 中，因为此时还没有解析好，strURL 为空;还没有执行这个方法
    self.newsVC.strURL = strURL;
    NSLog(@"%s",__FUNCTION__);
}
- (void)awakeFromNib {
    NSLog(@"%s",__FUNCTION__);
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC = sb.instantiateInitialViewController;

    
    [self addSubview:self.newsVC.view];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.newsVC.view.frame = self.bounds;
}
@end
