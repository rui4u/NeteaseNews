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
#import "ChannelCell.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

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

- (void)viewDidLayoutSubviews {
    self.layout.itemSize = self.collectionView.bounds.size;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    

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



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.channelList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ChannelCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    cell.strURL = [self.channelList[indexPath.item] strURL];
    //在代码开发时，如果出现多视图控制器的情况，一定要注意添加自控制器。
    //提示：当前代码不会出现问题。
    //但是：响应者链条的传递会出现不可预知的问题
    if (![self.childViewControllers containsObject:cell.newsVC]) {
        [self addChildViewController:cell.newsVC];
    }
    NSLog(@"%@",self.childViewControllers);
    
    
    return cell;
}
#pragma mark - 懒加载
- (NSArray *)channelList {
    if (_channelList ==nil) {
        _channelList = [Channel channelList];
    }
    return _channelList;
}

@end
