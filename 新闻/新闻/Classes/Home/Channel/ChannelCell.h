//
//  ChannelCell.h
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableViewController;
@interface ChannelCell : UICollectionViewCell
@property (nonatomic, strong) NSString *strURL;
@property (nonatomic, strong) NewsTableViewController *newsVC;
@end
