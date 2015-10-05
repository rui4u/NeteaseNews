//
//  Channel.m
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "Channel.h"
#import "NSObject+Extension.h"
@implementation Channel

- (void)setStrURL:(NSString *)strURL{
    _strURL = self.tid.copy;
    NSLog(@"%@!!",_strURL);
}
+ (NSArray *)channelList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //取出字典第一个数字
    NSArray *array = dict[dict.keyEnumerator.nextObject];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *obj in array) {
        [arrayM addObject:[self ObjectWithDict:obj]];
    }
    return [arrayM sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel *obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
}

- (NSString *)description {
    NSArray *propertis = [self.class loadProperties];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}
@end
