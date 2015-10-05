//
//  ChannelLabel.m
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "ChannelLabel.h"
#define SRnormalFontSize 14
#define SRselectFontSize 18
@implementation ChannelLabel

+ (instancetype)channelLableWithTitle:(NSString *)title {
    ChannelLabel *l = [[ChannelLabel alloc] init];
    l.text = title;
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:SRselectFontSize];
    [l sizeToFit];
    l.font = [UIFont systemFontOfSize:SRnormalFontSize];
    return l;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
