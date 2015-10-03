//
//  NewsCell.m
//  新闻
//
//  Created by 沙睿 on 15/10/3.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//
#import "News.h"
#import "NewsCell.h"
#import <UIImageView+AFNetworking.h>
@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end
@implementation NewsCell
- (void)setNews:(News *)news {
    _news = news;
    self.titleLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d",news.replyCount];
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
}

- (void)awakeFromNib {
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width -CGRectGetMaxX(self.iconView.frame)-20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
