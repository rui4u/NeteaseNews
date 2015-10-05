//
//  NSObject+Extension.m
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
@implementation NSObject (Extension)
+ (instancetype)ObjectWithDict:(NSDictionary *)dict {
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



@end
