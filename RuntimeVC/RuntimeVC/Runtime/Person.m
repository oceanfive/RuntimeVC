//
//  Person.m
//  HYKit
//
//  Created by wuhaiyang on 2017/2/14.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "Person.h"

@implementation Person

//+ (void)load{
//    NSLog(@"%@ %s", self, __FUNCTION__);
//}
//
//+ (void)initialize{
//    NSLog(@"%@ %s", self, __FUNCTION__);
//}
//
//- (instancetype)init{
//    if (self = [super init]) {
//        
//    }
//    NSLog(@"%@ %s", self, __FUNCTION__);
//    return self;
//}

- (void)run{
    NSLog(@"人可以跑");
}

- (void)eat{
    NSLog(@"人可以吃饭");
}

- (int)addCalculateWithNum1:(int)num1 num2:(int)num2{
    return num1 + num2;
}

+ (void)swim{
    NSLog(@"游泳中~~~~~");
}

@end
