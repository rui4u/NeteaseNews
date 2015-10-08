//
//  NewsTableViewController.m
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"
@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray *newsList;
@end

@implementation NewsTableViewController
- (void)setStrURL:(NSString *)strURL {
    _strURL = strURL;
    //@"T1348647853363/0-20.html"
    //清缓存
    self.newsList = nil;
    NSLog(@"%@--",strURL);
    [News loadNewsListWithURLString:[NSString stringWithFormat:@"%@/0-20.html",strURL] finished:^(NSArray *newsList) {
        self.newsList = newsList;
    }];
    //设置自动行高
    self.tableView.estimatedRowHeight=80;
    self.tableView.rowHeight=UITableViewAutomaticDimension;
}
- (void)setNewsList:(NSArray *)newsList {
    _newsList = newsList;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *n = self.newsList[indexPath.row];
    NSString *ID = [NewsCell cellIdentifierWithNews:n];
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.news = n;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *urlstr = (NSString *)[self.newsList[indexPath.row] url];
    NSURL *url = [NSURL URLWithString:urlstr];
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    NSMutableURLRequest *quest = [NSMutableURLRequest requestWithURL:url];
    [quest setValue:@"iPhone AppleWebKit" forHTTPHeaderField:@"User-Agent"];
    [web loadRequest:quest];
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view=web;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
