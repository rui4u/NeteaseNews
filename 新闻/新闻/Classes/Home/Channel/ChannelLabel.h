//
//  ChannelLabel.h
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  ChannelLabelDelegate;

@interface ChannelLabel : UILabel

+ (instancetype)channelLableWithTitle:(NSString *)title;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, weak) id<ChannelLabelDelegate> delegete;
@end

@protocol ChannelLabelDelegate <NSObject>

- (void)channelLableDidSelected:(ChannelLabel *)label;

@end
