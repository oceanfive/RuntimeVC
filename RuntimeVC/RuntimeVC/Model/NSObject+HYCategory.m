//
//  NSObject+HYCategory.m
//  HYKit
//
//  Created by wuhaiyang on 2017/2/15.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "NSObject+HYCategory.h"
#import <objc/runtime.h>

static const char hy_nameKey;

@implementation NSObject (HYCategory)

+ (void)load{
    NSLog(@"%@ %s", self, __FUNCTION__);
}

//+ (void)initialize
//{
//    NSLog(@"%@ %s", self, __FUNCTION__);
//}

//- (instancetype)init{
//    if (self = [super init]) {
//        
//    }
//    NSLog(@"%@ %s", self, __FUNCTION__);
//    return self;
//}

- (NSString *)hy_name{
   return objc_getAssociatedObject(self, &hy_nameKey);
}

- (void)setHy_name:(NSString *)hy_name{
    objc_setAssociatedObject(self, &hy_nameKey, hy_name, OBJC_ASSOCIATION_COPY);
}

@end
