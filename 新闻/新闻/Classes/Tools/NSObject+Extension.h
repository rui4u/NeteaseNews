//
//  NSObject+Extension.h
//  新闻
//
//  Created by 沙睿 on 15/10/5.
//  Copyright (c) 2015年 沙睿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
+ (instancetype)ObjectWithDict:(NSDictionary *)dict ;
+ (NSArray *)loadProperties ;
@end
