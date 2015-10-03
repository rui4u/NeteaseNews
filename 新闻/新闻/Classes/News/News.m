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
@implementation News
+ (instancetype)newsWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    NSArray *propert = [self loadProperties];
    for (NSString *key in propert) {
        if (dict [key] !=nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}
//动态获取属性。利用运行时机制
const char *kPropertiesKey = "kPropertiesKey";
+ (NSArray *)loadProperties {
    
    NSArray *pList = objc_getAssociatedObject(self, kPropertiesKey);
    if (pList != nil) {
        return pList;
    }

    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; ++i) {
        objc_property_t p = list[i];

        const char * cname =  property_getName(p);

        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    free(list);
    
    objc_setAssociatedObject(self, kPropertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, kPropertiesKey);

}


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
            [arrayM addObject:[self newsWithDict:dict]];
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
