//
//  HYObject.m
//  HYKit
//
//  Created by wuhaiyang on 2017/2/14.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "HYObject.h"
#import <objc/runtime.h>

@implementation HYObject

+ (void)load{
    NSLog(@"%@ %s", self, __FUNCTION__);
}

+ (void)initialize{
    NSLog(@"%@ %s", self, __FUNCTION__);
}

- (instancetype)init{
    if (self = [super init]) {
        
    }
    NSLog(@"%@ %s", self, __FUNCTION__);
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count); //获取所有的成员变量
        for (int i = 0; i < count; i++) { //遍历所有的成员变量
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar); //获取成员变量名称
            NSString *key = [NSString stringWithUTF8String:name]; //以成员变量作为key值
            id value = [aDecoder decodeObjectForKey:key]; //反归档
            [self setValue:value forKey:key]; //键值对设置value值
        }
        free(ivars);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count); //获取所有的成员变量
    for (int i = 0; i < count; i++) {    //遍历所有的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);  //获取成员变量名称
        NSString *key = [NSString stringWithUTF8String:name];  //以成员变量作为key值
        id value = [self valueForKey:key];  //键值对获取value值
        [aCoder encodeObject:value forKey:key];  //归档
    }
    free(ivars);
}

@end
