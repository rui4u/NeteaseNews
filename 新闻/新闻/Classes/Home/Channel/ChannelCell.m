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
@property (nonatomic, strong) NewsTableViewController *newsVC;
@end
@implementation ChannelCell
- (void)awakeFromNib {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC = sb.instantiateInitialViewController;
    
    [self addSubview:self.newsVC.view];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.newsVC.view.frame = self.bounds;
}
@end
