//
//  PersonTwo+HYCategoryTwo.m
//  RuntimeVC
//
//  Created by wuhaiyang on 2017/2/21.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "PersonTwo+HYCategoryTwo.h"

@implementation PersonTwo (HYCategoryTwo)

+ (void)load{
    NSLog(@"%@ %s", self, __FUNCTION__);
}

+ (void)initialize{
    NSLog(@"%@ %s", self, __FUNCTION__);
}

//- (instancetype)init{
//    if (self = [super init]) {
//
//    }
//    NSLog(@"%@ %s", self, __FUNCTION__);
//    return self;
//}

@end