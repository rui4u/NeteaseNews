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
    [l setUserInteractionEnabled:YES];
    return l;
}
- (void)setScale:(CGFloat)scale {
    // (18 - 14) / 14
    float percent = (float)(SRselectFontSize - SRnormalFontSize) / SRnormalFontSize;
    // scale = 0  percent = 1
    // scale = 1  4/14 + 1;
    NSLog(@"----%f",percent);
    percent = percent * scale + 1;

    // 通过 transform 设置大小
    self.transform = CGAffineTransformMakeScale(percent, percent);
    
    // 设置颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.delegete respondsToSelector:@selector(channelLableDidSelected:)]) {
        [self.delegete channelLableDidSelected:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
