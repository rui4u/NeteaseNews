//
//  News.m
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
#import <objc/runtime.h>
#import "NSObject+Extension.h"
@implementation News


+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{
    NSAssert(finished !=nil, @"必须传入回调");
    [[NetworkTools shareNetworkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        //URL不同，第一层字典的key 不同
        //利用keyEnumerator.nextObjict 获取字典第一个key
        //主要用来遍历字典
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //根据key 拿到第一个数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self ObjectWithDict:dict]];
        }
        NSLog(@"%@",arrayM);
        finished(arrayM);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (NSString *)description {
    NSArray *propertis = [self.class loadProperties];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}
@end
