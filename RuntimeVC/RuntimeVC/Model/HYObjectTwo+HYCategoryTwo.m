//
//  HYObjectTwo+HYCategoryTwo.m
//  RuntimeVC
//
//  Created by wuhaiyang on 2017/2/21.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "HYObjectTwo+HYCategoryTwo.h"

@implementation HYObjectTwo (HYCategoryTwo)

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
