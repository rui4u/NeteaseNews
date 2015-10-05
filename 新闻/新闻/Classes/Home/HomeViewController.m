//
//  HomeViewController.m
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"
@interface HomeViewController ()

//频道数据
@property (nonatomic, strong) NSArray *channelList;
//频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[Channel channelList]);
    [self setupChannel];
}

- (void)setupChannel {
    
    //取消scrollView的缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat margin = 8.0;
    CGFloat x =margin;
    CGFloat h = self.channelView.bounds.size.height;
    for (Channel * channel in self.channelList) {
        ChannelLabel *l = [ChannelLabel channelLableWithTitle:channel.tname];
        l.frame = CGRectMake(x, 0, l.bounds.size.width,h);
        x += l.frame.size.width;
        [self.channelView addSubview:l];
    }
    self.channelView.contentSize = CGSizeMake(x+margin, h);
}
#pragma mark - 懒加载
- (NSArray *)channelList {
    if (_channelList ==nil) {
        _channelList = [Channel channelList];
    }
    return _channelList;
}

@end
