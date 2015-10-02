//
//  News.m
//  新闻
//
//  Created by 沙睿 on 15/10/2.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"

@implementation News
+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    NSArray *propert = @[@"title",@"digest",@"relpyCount",@"imgsrc"];
    for (NSString *key in propert) {
        if (dict [key] !=nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}

+ (void)loadNewsListWithURLString:(NSString *)urlString {
    [[NetworkTools shareNetworkTools] GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        //URL不同，第一层字典的key 不同
        //利用keyEnumerator.nextObjict 获取字典第一个key
        //主要用来遍历字典
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //根据key 拿到第一个数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            [arrayM addObject:[self newsWithDict:dict]];
        }
        NSLog(@"%@",array);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (NSString *)description {
    NSArray *propert = @[@"title",@"digest",@"replyCount",@"imgsrc"];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propert];
    return [NSString stringWithFormat:@"%@",dict];
}
@end
