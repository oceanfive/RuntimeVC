//
//  RuntimeVC.m
//  HYKit
//
//  Created by wuhaiyang on 2017/2/13.
//  Copyright © 2017年 wuhaiyang. All rights reserved.
//

#import "RuntimeVC.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/Protocol.h>
#import <objc/Object.h>
#import <objc/objc.h>
#import <objc/objc-sync.h>
#import <objc/objc-runtime.h>
#import <objc/objc-load.h>
#import <objc/objc-exception.h>
#import <objc/objc-class.h>
#import <objc/objc-auto.h>
#import <objc/objc-api.h>
#import <objc/NSObject.h>
#import <objc/NSObjCRuntime.h>
//#import <objc/List.h>
#import <objc/hashtable2.h>
#import <objc/hashtable.h>
#import "Person.h"
#import "Father.h"
#import "Son.h"
#import "Cat.h"
#import "FirstView.h"
#import "SecondView.h"
#import "ThirdView.h"
//#import <objc/Object.h>
#import "HYObject.h"
#import "NSObject+HYCategory.h"

@interface RuntimeVC ()

@end

@implementation RuntimeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"运行时";
    self.view.backgroundColor = [UIColor whiteColor];
    
    {
//    Son *son = [[Son alloc] init];
//    Class sonName = objc_getClass(class_getName([son class]));
//    Class sonMeta = objc_getMetaClass(class_getName([son class]));
//    
//    Class father = class_getSuperclass([son class]); //Father
//    Class fatherName = objc_getClass(class_getName(father));
//    Class fatherMeta = objc_getMetaClass(class_getName(father));
//    
//    if (class_isMetaClass(fatherName)) {
//        NSLog(@"fatherName---是Meta类");
//    } else {
//        NSLog(@"fatherName---不是Meta类");  //走这个方法
//    }
//    
//    if (class_isMetaClass(fatherMeta)) {
//        NSLog(@"fatherMeta---是Meta类");  //走这个方法
//    } else {
//        NSLog(@"fatherMeta---不是Meta类");
//    }
//    
//
    }
    
    //类、元类、实例、关系验证
    {
//    Person *per = [[Person alloc] init];
//    
//    Class personName = objc_getClass(class_getName([Person class]));  //Person
//    Class personMeta = objc_getMetaClass(class_getName([Person class])); //Person
//    
//    Class hyObject = class_getSuperclass(personName); // HYObject
//    Class hyObjectName = objc_getClass(class_getName(hyObject)); // HYObject
//    Class hyObjectMeta = objc_getMetaClass(class_getName(hyObject)); // HYObject
//    
//    Class nsObject = class_getSuperclass(hyObject); //NSObject
//    Class nsObjectName = objc_getClass(class_getName(nsObject)); //NSObject
//    Class nsObjectMeta = objc_getMetaClass(class_getName(nsObject));//NSObject
//    
//    Class null = class_getSuperclass(nsObject); //(null)
//    Class nullName = objc_getClass(class_getName(null)); //(null)
//    Class nullMeta = objc_getMetaClass(class_getName(null)); //(null)
//    
//    Class root = class_getSuperclass(null);
//    Class rootName = objc_getClass(class_getName(root));
//    Class rootMeta = objc_getMetaClass(class_getName(root));
//    
//     NSLog(@"\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@", personName, personName, personMeta, hyObject, hyObjectName, hyObjectMeta, nsObject, nsObjectName, nsObjectMeta, null, nullName, nullMeta, root, rootName, rootMeta);
//    
//    /*
//     Person--Person--Person
//     HYObject--HYObject--HYObject
//     NSObject--NSObject--NSObject
//     (null)--(null)--(null)
//     (null)--(null)--(null)
//     */
    
//    NSLog(@"---------------");
    }
    
    //类、元类、实例、关系验证 2
    {
    ///Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.2.sdk/usr/include/objc/module.map:15:10: Module 'ObjectiveC.List' is incompatible with feature 'objc_arc'
    
//    NSLog(@"\n%@--%p--%p\n%@--%p--%p\n%@--%p--%p\n%@--%p--%p\n%@--%p--%p\n%@--%p--%p", sonName, sonName, sonMeta, father, fatherName, fatherMeta, person, personName, personMeta, hyObject, hyObjectName, hyObjectMeta, nsObject, nsObjectName, nsObjectMeta, null, nullName, nullMeta);
    /*
     Son--0x10215e978--0x10215e950
     Father--0x10215e7e8--0x10215e7c0
     Person--0x10215e608--0x10215e5e0
     HYObject--0x10215eea0--0x10215eec8
     NSObject--0x103783e58--0x103783e08
     (null)--0x0--0x0
     */
    
//    NSLog(@"\n%@--%p--%p", root, rootName, rootMeta);
    /*
     (null)--0x0--0x0
     */
    
//    NSLog(@"------------");
    }
    
    //不使用
    {
//    Class hyFirst = objc_allocateClassPair([NSObject class], "HYFirst", 0);
//    
//    objc_registerClassPair(hyFirst);
    
    
    
//    FirstView *first = [[FirstView alloc] init];
//    Class firstName = objc_getClass(class_getName([first class]));
//    Class firstMeta = objc_getMetaClass(class_getName([first class]));
//    
//    
//    Class second = class_getSuperclass([first class]);
//    Class secondName = objc_getClass(class_getName(second));
//    Class secondMeta = objc_getMetaClass(class_getName(second));
    
    
//    ThirdView *third = [[ThirdView alloc] init];
//    Class thirdName = objc_getClass(class_getName([third class]));
//    Class thirdMeta = objc_getMetaClass(class_getName([third class]));
//    
//    Class second = class_getSuperclass([third class]);
//    Class secondName = objc_getClass(class_getName(second));
//    Class secondMeta = objc_getMetaClass(class_getName(second));
//    
//    Class first = class_getSuperclass([second class]);
//    Class firstName = objc_getClass(class_getName(first));
//    Class firstMeta = objc_getMetaClass(class_getName(first));
//    
//    
//    NSLog(@"\n%@--%p--%p\n%@--%p--%p\n%@--%p--%p", thirdName, thirdName, thirdMeta, second, secondName, secondMeta, first, firstName, firstMeta);
//    
//    
//    NSLog(@"------------");
    }
    
    
    //1、获取类的名称
    {
//    Person *person = [[Person alloc] init];
//    
//    const char *className = class_getName([person class]);  //方法一、class_getName --- <objc/runtime.h>
//    const char *className2 = object_getClassName(person);   //方法二、object_getClassName  --- <objc/runtime.h>
//    NSString *className3 = NSStringFromClass([person class]); //方法三、 NSStringFromClass  --- NSObjCRuntime.h
//    NSLog(@"%s--%s--%@", className, className2, className3);
//    //打印：Person--Person--Person
//    NSLog(@"-----");
    
    
    //补充：获取类对象的方法：[类名称/对象 class]
    
//    //objc_   class_  object_
//    
//    Father *father = [[Father alloc] init];
//
//    Class class1 = objc_getClass(class_getName([father class]));
//    Class class2 = object_getClass(father);
//    
//    const char *className1 = class_getName([father class]);
//    const char *className2 = object_getClassName(father);
//    NSString *className3 = NSStringFromClass([father class]);
//    
//    NSLog(@"%@--%@----%s--%s--%@", class1, class2, className1, className2, className3);
//    //打印： Father--Father----Father--Father--Father
    }
    
    //2、获取类的父类名称
    {
//    Person *person = [[Person alloc] init];
//    
//    Class superClassName = class_getSuperclass([person class]);
//    Class superClassName2 = [person superclass];
//    NSLog(@"%@---%@", superClassName, superClassName2);
//    //打印： HYObject---HYObject
//        NSLog(@"-----");
    }
    
    
    //3、类的版本信息
    {
//    Person *person = [[Person alloc] init];
//    
//    //获取类的版本信息 -- 默认为 0  -- 2个方法
//    int version = class_getVersion([person class]);  //方法一、  class_getVersion ---  <objc/runtime.h>
//    NSInteger version2 = [Person version];  //方法二、[类名 version];  ---  @interface NSObject (NSCoderMethods
//        
//    NSLog(@"%d --- %ld", version, version2);
//    //打印：0 --- 0
//        
//    //设置类的版本信息 -- 2个方法
//    //    class_setVersion([person class], 5);  //方法一、 class_setVersion  ---  <objc/runtime.h>
//    [Person setVersion:5];  //方法二、 [类名 setVersion:]; --- @interface NSObject (NSCoderMethods)
//    int version3 = class_getVersion([person class]);
//    
//    NSLog(@"%d --- %d", version, version3);
//    //打印：  0 --- 5
//    
//    
//    NSLog(@"-------");
    }

    //4、类的信息  --- 没有
    
    //5、类的实例大小
    {
//    Person *person = [[Person alloc] init];
//    
//    size_t size = class_getInstanceSize([person class]);
//    size_t size2 = sizeof([person class]);
//    
//    NSLog(@"%zu---%zu", size, size2);
//    //打印： 40---8  单位为 bytes
//    
//    NSObject *ob = [[NSObject alloc] init];
//    
//    size_t sizeOb = class_getInstanceSize([ob class]);
//    size_t sizeOb2 = sizeof([ob class]);
//    
//    NSLog(@"%zu--%zu", sizeOb, sizeOb2);
//    //打印： 8--8  单位为 bytes
//    
//    UIView *view = [[UIView alloc] init];
//    
//    size_t sizeView = class_getInstanceSize([view class]);
//    size_t sizeView2 = sizeof([view class]);
//    
//    NSLog(@"%zu--%zu", sizeView, sizeView2);
//    //打印： 408--8 单位为 bytes
//
//    
//    
//    Father *father = [[Father alloc] init];
//    
//    size_t sizeFat = class_getInstanceSize([father class]);
//    size_t sizeFat2 = sizeof([father class]);
//    
//    NSLog(@"%zu---%zu", sizeFat, sizeFat2);
//    //打印：40---8  单位为 bytes
//    
//    
//    //补充：字节大小
//    NSLog(@"\nUInt8:%zu  -- uint8_t:%zu -- u_int8_t:%zu", sizeof(UInt8), sizeof(uint8_t), sizeof(u_int8_t));
//    //打印：UInt8:1  -- uint8_t:1 -- u_int8_t:1
//    NSLog(@"\nInt8:%zu  -- int8_t:%zu -- ", sizeof(SInt8), sizeof(int8_t));
//    //打印：Int8:1  -- int8_t:1 --
//    
//    NSLog(@"\nUInt16:%zu  -- uint16_t:%zu -- u_int16_t:%zu", sizeof(UInt16), sizeof(uint16_t), sizeof(u_int16_t));
//    //打印：UInt16:2  -- uint16_t:2 -- u_int16_t:2
//    NSLog(@"\nSInt16:%zu  -- int16_t:%zu -- ", sizeof(SInt16), sizeof(int16_t));
//    //打印：SInt16:2  -- int16_t:2 --
//    
//    NSLog(@"-----------");
//    UINT8_MAX
    
    /*
     
     Base integer types for all target OS's and CPU's
     
     UInt8            8-bit unsigned integer    1-byte
     SInt8            8-bit signed integer      1-byte
     UInt16          16-bit unsigned integer    2-byte
     SInt16          16-bit signed integer      2-byte
     UInt32          32-bit unsigned integer
     SInt32          32-bit signed integer
     UInt64          64-bit unsigned integer
     SInt64          64-bit signed integer

     */
    
//    
//     /* 7.18.2.1 Limits of exact-width integer types */
//#define INT8_MAX         127
//#define INT16_MAX        32767
//#define INT32_MAX        2147483647
//#define INT64_MAX        9223372036854775807LL
//    
//#define INT8_MIN          -128
//#define INT16_MIN         -32768
//    /*
//     Note:  the literal "most negative int" cannot be written in C --
//     the rules in the standard (section 6.4.4.1 in C99) will give it
//     an unsigned type, so INT32_MIN (and the most negative member of
//     any larger signed type) must be written via a constant expression.
//     */
//#define INT32_MIN        (-INT32_MAX-1)
//#define INT64_MIN        (-INT64_MAX-1)
//    
//#define UINT8_MAX         255
//#define UINT16_MAX        65535
//#define UINT32_MAX        4294967295U
//#define UINT64_MAX        18446744073709551615ULL
    }
    
    
//    ivar_getOffset(<#Ivar v#>)
//    ivar_getTypeEncoding(<#Ivar v#>)
//    ivar_getName(<#Ivar v#>)
    /*
     struct objc_ivar {
         char *ivar_name                                          OBJC2_UNAVAILABLE;
         char *ivar_type                                          OBJC2_UNAVAILABLE;
         int ivar_offset                                          OBJC2_UNAVAILABLE;
     #ifdef __LP64__
         int space                                                OBJC2_UNAVAILABLE;
     #endif
     }
     */
    
    
    
    
//    class_getInstanceVariable(<#__unsafe_unretained Class cls#>, <#const char *name#>)
//    class_getClassVariable(<#__unsafe_unretained Class cls#>, <#const char *name#>)
    
//    object_setIvar(<#id obj#>, <#Ivar ivar#>, <#id value#>)
//    object_getIvar(<#id obj#>, <#Ivar ivar#>)
    
//    object_setInstanceVariable  Ivar object_setInstanceVariable(id obj, const char *name, void *value)
//    object_getInstanceVariable  Ivar object_getInstanceVariable(id obj, const char *name, void **outValue)
    

//    class_addIvar(<#__unsafe_unretained Class cls#>, <#const char *name#>, <#size_t size#>, <#uint8_t alignment#>, <#const char *types#>)
    
    
    
    //3、判断一个类是不是元类
//    BOOL result = class_isMetaClass([person class]);
//    if (result) {
//        NSLog(@"是元类");
//    } else {
//        NSLog(@"不是元类");  //走这个方法
//    }
//    
//    BOOL result2 = class_isMetaClass([NSObject class]);
//    if (result2) {
//        NSLog(@"是元类");
//    } else {
//        NSLog(@"不是元类");   //走这个方法
//    }
    
//    Son *son = [[Son alloc] init];
//    Class sonName = objc_getClass(class_getName([son class]));
//    Class sonMeta = objc_getMetaClass(class_getName([son class]));
//
//    Class father = class_getSuperclass([son class]); //Father
//    Class fatherName = objc_getClass(class_getName(father));
//    Class fatherMeta = objc_getMetaClass(class_getName(father));
//
//    if (class_isMetaClass(fatherName)) {
//        NSLog(@"fatherName---是Meta类");
//    } else {
//        NSLog(@"fatherName---不是Meta类");  //走这个方法
//    }
//
//    if (class_isMetaClass(fatherMeta)) {
//        NSLog(@"fatherMeta---是Meta类");  //走这个方法
//    } else {
//        NSLog(@"fatherMeta---不是Meta类");
//    }
    
    //4、获取成员变量列表
    {
//    Person *person = [[Person alloc] init];
    /*
     Person头文件定义的实例变量和属性如下：
     {
        NSString *_sex;
     }
     @property (nonatomic, assign) int age;
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, assign) double height;
     @property (nonatomic, assign) double weight;
     */
    
//    person.name = @"Jack";
//    person.age = 25;
//    person.weight = 170.0;
//    person.height = 177.0;
    
#pragma mark - 实例变量和属性是两个不同的概念，值也是不相同的，需要特别注意
    /*注意：
     1、这里使用object_setIvar方法给实例变量设置值，读取的时候使用与之对应的object_getIvar方法读取值，设置什么值，读取的值就是什么，“实例变量值”和“属性值”会不相同的
     2、如果使用person.name = @"Jack";方法设置属性值，再使用object_getIvar方法读取值，会造成内存泄漏，程序无法执行
     
    */
    //获取实例变量
//    Ivar sexIvar = class_getInstanceVariable([person class], "_sex");
//    Ivar ageIvar = class_getInstanceVariable([person class], "_age");
//    Ivar nameIvar = class_getInstanceVariable([person class], "_name");
//    Ivar weightIvar = class_getInstanceVariable([person class], "_weight");
//    Ivar heightIvar = class_getInstanceVariable([person class], "_height");
//    Ivar newIvar = class_getInstanceVariable([person class], "_father");  //没有_father这个实例变量，所以newIvar为nil
//    
//    //设置实例变量的值
//    object_setIvar(person, sexIvar, @"男");
//    object_setIvar(person, ageIvar, @25);
//    object_setIvar(person, nameIvar, @"Jack");
//    object_setIvar(person, weightIvar, @170.0);
//    object_setIvar(person, heightIvar, @177);
//    object_setIvar(person, newIvar, @"new");  //没有_father这个实例变量，所以newIvar为nil，设置值也是设置不上
//    
////    person.age = 100;
////    person.name = @"Simon";
////    person.height = 177.0f;
////    person.weight = 165.0f;
////    person->_sex = @"男";  //受保护的，无法直接访问
//    
//    object_setIvarWithStrongDefault(person, sexIvar, @"女");
////    object_setInstanceVariable(person, "_name", @"Simon");
//    
//    
//    unsigned int count = 0 ;
//    Ivar *ivars = class_copyIvarList([person class], &count);  //获取类的实例变量列表
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivars[i];
//        const char *name = ivar_getName(ivar);  //获取实例变量名称
//        const char *encodingType = ivar_getTypeEncoding(ivar); //获取实例变量的编码，或者说数据类型
//        ptrdiff_t offset = ivar_getOffset(ivar);
//        
//        id value = object_getIvar(person, ivar); //获取实例变量的值
////        id value = @"value";
////        NSLog(@"变量名称：%s -- 编码类型：%s -- 偏移量：%td", name, encodingType, offset);
//        
//        NSLog(@"变量名称：%s -- 编码类型：%s -- 偏移量：%td -- 值为：%@", name, encodingType, offset, value);
//        
//    }
//    //Objective-C Runtime Programming Guide > Type Encodings
//    
//    uint8_t layout = class_getIvarLayout([person class]);
//    
//    
//    
//    NSLog(@"-------------");
    /*
     2017-02-14 16:37:05.255 HYKit[11056:2446631] 变量名称：_age -- 编码类型：i -- 值为：25
     2017-02-14 16:37:05.255 HYKit[11056:2446631] 变量名称：_name -- 编码类型：@"NSString" -- 值为：Jack
     2017-02-14 16:37:05.255 HYKit[11056:2446631] 变量名称：_height -- 编码类型：d -- 值为：177
     2017-02-14 16:37:05.256 HYKit[11056:2446631] 变量名称：_weight -- 编码类型：d -- 值为：170
     */

    /*
     打印：
     变量名称：_sex -- 编码类型：@"NSString" -- 偏移量：8
     变量名称：_age -- 编码类型：i -- 偏移量：16
     变量名称：_name -- 编码类型：@"NSString" -- 偏移量：24
     变量名称：_height -- 编码类型：d -- 偏移量：32
     变量名称：_weight -- 编码类型：d -- 偏移量：40
     */
    
    /*
     打印：
     变量名称：_sex -- 编码类型：@"NSString" -- 偏移量：8 -- 值为：男
     变量名称：_age -- 编码类型：i -- 偏移量：16 -- 值为：25
     变量名称：_name -- 编码类型：@"NSString" -- 偏移量：24 -- 值为：Jack
     变量名称：_height -- 编码类型：d -- 偏移量：32 -- 值为：177
     变量名称：_weight -- 编码类型：d -- 偏移量：40 -- 值为：170
     */
    }
    
    
    
#pragma mark - 属性 @property (nonatomic, assign) double weight;
    //5、属性
//    Person *person = [[Person alloc] init];
//    person.name = @"Jack";
//    person.age = 25;
//    person.weight = 170.0;
//    person.height = 177.0;
//    
//    
//    unsigned int outCount = 0;
//    objc_property_t *properties = class_copyPropertyList([person class], &outCount); //获取属性列表
//    for (int i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        const char *name = property_getName(property);  //获取属性名称
//        const char *att = property_getAttributes(property); //获取属性对应的“特性”  // Objective-C Runtime Programming Guide
//        /*
//         特性：Attributes
//         R  The property is read-only (readonly).
//         C  The property is a copy of the value last assigned (copy).
//         &  The property is a reference to the value last assigned (retain).
//         N  The property is non-atomic (nonatomic).
//         G<name>    The property defines a custom getter selector name. The name follows the G (for example, GcustomGetter,).
//         S<name>    The property defines a custom setter selector name. The name follows the S (for example, ScustomSetter:,).
//         D  The property is dynamic (@dynamic).
//         W  The property is a weak reference (__weak).
//         P  The property is eligible for garbage collection.
//         t<encoding>    Specifies the type using old-style encoding.
//         */
//
//        NSLog(@"属性名称：%s -- 属性特性：%s", name, att);
//        
//        unsigned int count = 0;
//        objc_property_attribute_t *atts = property_copyAttributeList(property, &count); //获取属性特性列表
//        
//        for (int i = 0; i < count; i++) {
//            objc_property_attribute_t att = atts[i];
//            
//            char *value = property_copyAttributeValue(property, att.name);//等价于att.value
//            
//            NSLog(@"属性特性 -- 名称为：%s -- 值为：%s --", att.name, value); //
//            
//        }
//        
//        NSLog(@"-------分割线-----------");
//        
//    }
//    
//    
//    NSLog(@"%s", @encode(NSString *)); //@
//    
//    NSLog(@"-------------");
//    
//    
//    
    
    /*
     2017-02-22 10:06:35.893 RuntimeVC[2496:479532] 属性名称：name -- 属性特性：T@"NSString",C,N
     2017-02-22 10:06:35.893 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：@"NSString" --
     2017-02-22 10:06:35.893 RuntimeVC[2496:479532] 属性特性 -- 名称为：C -- 值为： --
     2017-02-22 10:06:35.893 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.893 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性名称：age -- 属性特性：Ti,N,GcusGetAge,V_age
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：i --
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性特性 -- 名称为：G -- 值为：cusGetAge --
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_age --
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.894 RuntimeVC[2496:479532] 属性名称：name -- 属性特性：T@"NSString",C,N,V_name
     2017-02-22 10:06:35.896 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：@"NSString" --
     2017-02-22 10:06:35.896 RuntimeVC[2496:479532] 属性特性 -- 名称为：C -- 值为： --
     2017-02-22 10:06:35.896 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.896 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_name --
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] 属性名称：height -- 属性特性：Td,N,V_height
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：d --
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_height --
     2017-02-22 10:06:35.897 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] 属性名称：weight -- 属性特性：Td,N,V_weight
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：d --
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_weight --
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.898 RuntimeVC[2496:479532] 属性名称：sArray -- 属性特性：T@"NSArray",&,N,V_sArray
     2017-02-22 10:06:35.906 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：@"NSArray" --
     2017-02-22 10:06:35.906 RuntimeVC[2496:479532] 属性特性 -- 名称为：& -- 值为： --
     2017-02-22 10:06:35.906 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.906 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_sArray --
     2017-02-22 10:06:35.906 RuntimeVC[2496:479532] -------分割线-----------
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] 属性名称：wArray -- 属性特性：T@"NSArray",W,N,V_wArray
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] 属性特性 -- 名称为：T -- 值为：@"NSArray" --
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] 属性特性 -- 名称为：W -- 值为： --
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] 属性特性 -- 名称为：N -- 值为： --
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] 属性特性 -- 名称为：V -- 值为：_wArray --
     2017-02-22 10:06:35.907 RuntimeVC[2496:479532] -------分割线-----------
     */
    
#pragma  mark - Ivar“可以使用”runtime设置值和读取值，Property“无法使用”runtime设置值和读取值
    
    
//    //6、方法
//    Person *person = [[Person alloc] init];
//    person.name = @"Jack";
//    person.age = 25;
//    person.weight = 170.0;
//    person.height = 177.0;
//    
//    [person run];  //打印：人可以跑
//    [person eat];  //打印：人可以吃饭
//    
//#pragma mark - 第一种交换方法实现
//    Method runMethod = NULL;  //先设置为NULL，否则会报错
//    SEL runSEL;
//    IMP runIMP = NULL;  //先设置为NULL，否则会报错
//    Method eatMethod = NULL;  //先设置为NULL，否则会报错
//    SEL eatSEL;
//    IMP eatIMP = NULL;  //先设置为NULL，否则会报错
//    
//#pragma mark - 方法选择器的生成和获取方法名称
//    //一、生成SEL方法选择器的四种方式：
////    SEL newM = sel_registerName("newMethod"); //runtime的方法sel_registerName
////    SEL newM = sel_getUid("newMethod");  //runtime的方法sel_getUid
////    SEL newM = NSSelectorFromString(@"newMethod");  //NSObjCRuntime.h 中的方法  NSSelectorFromString
//    SEL newM = @selector(newMethod);  //直接方法： @selector(方法名称) --- 最常用的
//    
//    //二、获取方法名称的两种方式：
//    const char *newName = sel_getName(newM);  //runtime的方法sel_getName
//    NSString *newName2 = NSStringFromSelector(newM); //NSObjCRuntime.h 中的方法 NSStringFromSelector
//    
//    
//    BOOL result = sel_isMapped(newM);
//    if (result) {
//        NSLog(@"%s / %@ 方法已经被实现了---", newName, newName2);  //走这个方法
//    } else {
//        NSLog(@"%s / %@ 方法没有被实现！！！！", newName, newName2);
//    }
    
#pragma mark - 方法名称是否相同比较，方法名称相同，实现一般相同
    //一、
//    SEL newM = @selector(newMethod);
//    SEL new2 = NSSelectorFromString(@"newMethod");
//
//    if (sel_isEqual(newM, new2)) {
//        NSLog(@"两个方法选择器名称相同");  //走这个方法
//    } else {
//        NSLog(@"两个方法选择器名称不相同");
//    }
    
    //二、
//    SEL newM = @selector(newMethod);
//    SEL new2 = NSSelectorFromString(@"newMethod2");
//
//    if (sel_isEqual(newM, new2)) {
//        NSLog(@"两个方法选择器名称相同");
//    } else {
//        NSLog(@"两个方法选择器名称不相同");  //走这个方法
//    }
    
    
#pragma mark - IMP的生成、获取
    /* Obtaining method handles */
    
//    - (IMP) methodFor:(SEL)aSelector;
//    + (IMP) instanceMethodFor:(SEL)aSelector;
//    
//    imp_implementationWithBlock   ----- OK
//    
//    imp_getBlock
//    
//    imp_removeBlock
//    
//    
//    
//    class_replaceMethod  
//    
//    method_getImplementation
//    
//    method_setImplementation
//    
//    
//    class_getMethodImplementation
//    
//    class_getMethodImplementation_stret
//    
    
#pragma mark - 第一种方式，较为繁琐
//    //一、获取IMP
//    IMP myIMP = imp_implementationWithBlock(^(id obj, NSString *str) {
//        
//        NSLog(@"%@", str);
//        return str;  //这里和下面的result对应
//    });
//    /*
//     讨论：
//     1、block的参数格式为：^(id self, method_args...) 
//     2、block内部可以进行一些操作，计算等；
//     3、block内如果没有返回值，调用相应的方法返回值为nil；如果有返回值，调用相应的方法返回值为对应的返回值；
//     */
//    
//    
//    //二、获取SEL
//    SEL myBlock = sel_registerName("myBlock:");
//    
//    //三、给哪个类绑定SEL和IMP的映射关系 ---- 这里只能添加实例对象方法？？？？
//    class_addMethod([Person class], myBlock, myIMP, "@@:@");
//    
//    //四、实例对象调用相应的方法 -- performSelector
//    id result = [person performSelector:myBlock withObject:@"Hello World!!!"];
//    //result 和 上面的IMP实现的block的返回值对应；如果没有返回值，结果为nil；如果有返回值，结果为返回的值；
//    /*
//     讨论：
//     1、使用实例对象person会有警告 PerformSelector may cause a leak because its selector is unknown；原因是在ARC环境下不能确定返回值类型才会报错；解决：使用消除警告的宏定义就可以了；
//     2、使用类Person虽然不会有使用实例对象时的警告，但是在运行时会有崩溃，找不到方法，因为类Person没有这个方法performSelector
//     */
//
//#pragma mark - 第二种方式，较为方便，简单
//    if (class_addMethod([Person class], @selector(jump:), (IMP)jumpIMP, "v@:@")) {
//        NSLog(@"添加方法成功");
//    } else {
//        NSLog(@"添加方法失败!!!");
//    }
//    
//    id res = [person performSelector:@selector(jump:) withObject:@"100"];
//    
//    NSLog(@"!!!!!!!!!!!!!!!!!!");
////
    
//    class_getClassVariable(<#__unsafe_unretained Class cls#>, <#const char *name#>)
    
#pragma mark - 获取“实例方法”列表
//    
//    Person *person = [[Person alloc] init];
//    person.name = @"Jack";
//    person.age = 25;
//    person.weight = 170.0;
//    person.height = 177.0;
//
//    [person run];  //打印：人可以跑
//    [person eat];  //打印：人可以吃饭
//    
//    unsigned int count = 0;
//    Method *methods = class_copyMethodList([person class], &count);  //获取所有的方法列表  --- [Person class]
//    for (int i = 0; i < count; i++) {
//        Method method = methods[i];
//        
//        SEL nameSel = method_getName(method);  //方法的名称 -- SEL
//        const char *name = sel_getName(nameSel); //方法的名称 -- NSString
//        NSLog(@"方法名称：%s", name);
//
//        IMP implement = method_getImplementation(method);  //方法的实现 -- IMP
//        NSLog(@"方法实现：%p", implement);
//
//        const char *typeEncoding = method_getTypeEncoding(method);  //方法的参数和返回值
//        NSLog(@"方法的参数和返回值：%s", typeEncoding);
//        
//        unsigned int numberOfArguments = method_getNumberOfArguments(method); //方法参数数量
//        NSLog(@"方法的参数数量：%d", numberOfArguments);
//        for (int j = 0; j < numberOfArguments; j++) {
//            char *describingTheTypeOfTheParameter = method_copyArgumentType(method, j); //方法参数描述
//            NSLog(@"方法的参数描述：%s", describingTheTypeOfTheParameter);
//        }
//        
//        char *returnType = method_copyReturnType(method); //方法返回值描述
//        NSLog(@"方法的返回值描述：%s", returnType);
//        
//        struct objc_method_description *methodDescription = method_getDescription(method);  //描述描述
//        SEL methodDescriptionName = methodDescription->name;
//        char *methodDescriptionTypes = methodDescription->types;
//        
//        NSLog(@"方法描述：-- 名称：%s -- 类型： %s", sel_getName(methodDescriptionName), methodDescriptionTypes);
//    
//        NSLog(@"分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
//    }
//    
    /*
     打印：
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法名称：setAge:
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法实现：0x10238b8e0
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法的参数和返回值：v20@0:8i16
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法的参数数量：3
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.353 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法的参数描述：i
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法描述：-- 名称：setAge: -- 类型： v20@0:8i16
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法名称：setWeight:
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法实现：0x10238b9e0
     2017-02-22 13:46:02.354 RuntimeVC[6928:1463675] 方法的参数和返回值：v24@0:8d16
     2017-02-22 13:46:02.355 RuntimeVC[6928:1463675] 方法的参数数量：3
     2017-02-22 13:46:02.357 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法的参数描述：d
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法描述：-- 名称：setWeight: -- 类型： v24@0:8d16
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法名称：eat
     2017-02-22 13:46:02.358 RuntimeVC[6928:1463675] 方法实现：0x10238b840
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法的参数和返回值：v16@0:8
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.359 RuntimeVC[6928:1463675] 方法描述：-- 名称：eat -- 类型： v16@0:8
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法名称：addCalculateWithNum1:num2:
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法实现：0x10238b870
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法的参数和返回值：i24@0:8i16i20
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法的参数数量：4
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.360 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法的参数描述：i
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法的参数描述：i
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法的返回值描述：i
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法描述：-- 名称：addCalculateWithNum1:num2: -- 类型： i24@0:8i16i20
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法名称：age
     2017-02-22 13:46:02.361 RuntimeVC[6928:1463675] 方法实现：0x10238b8c0
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法的参数和返回值：i16@0:8
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法的返回值描述：i
     2017-02-22 13:46:02.362 RuntimeVC[6928:1463675] 方法描述：-- 名称：age -- 类型： i16@0:8
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 方法名称：.cxx_destruct
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 方法实现：0x10238ba10
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 方法的参数和返回值：v16@0:8
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.363 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.364 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.364 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.364 RuntimeVC[6928:1463675] 方法描述：-- 名称：.cxx_destruct -- 类型： v16@0:8
     2017-02-22 13:46:02.364 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.364 RuntimeVC[6928:1463675] 方法名称：name
     2017-02-22 13:46:02.376 RuntimeVC[6928:1463675] 方法实现：0x10238b910
     2017-02-22 13:46:02.376 RuntimeVC[6928:1463675] 方法的参数和返回值：@16@0:8
     2017-02-22 13:46:02.376 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.376 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.376 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.377 RuntimeVC[6928:1463675] 方法的返回值描述：@
     2017-02-22 13:46:02.377 RuntimeVC[6928:1463675] 方法描述：-- 名称：name -- 类型： @16@0:8
     2017-02-22 13:46:02.377 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.377 RuntimeVC[6928:1463675] 方法名称：weight
     2017-02-22 13:46:02.377 RuntimeVC[6928:1463675] 方法实现：0x10238b9c0
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法的参数和返回值：d16@0:8
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法的返回值描述：d
     2017-02-22 13:46:02.378 RuntimeVC[6928:1463675] 方法描述：-- 名称：weight -- 类型： d16@0:8
     2017-02-22 13:46:02.379 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.379 RuntimeVC[6928:1463675] 方法名称：setName:
     2017-02-22 13:46:02.379 RuntimeVC[6928:1463675] 方法实现：0x10238b930
     2017-02-22 13:46:02.379 RuntimeVC[6928:1463675] 方法的参数和返回值：v24@0:8@16
     2017-02-22 13:46:02.379 RuntimeVC[6928:1463675] 方法的参数数量：3
     2017-02-22 13:46:02.380 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.380 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.380 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.380 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.381 RuntimeVC[6928:1463675] 方法描述：-- 名称：setName: -- 类型： v24@0:8@16
     2017-02-22 13:46:02.381 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.381 RuntimeVC[6928:1463675] 方法名称：init
     2017-02-22 13:46:02.381 RuntimeVC[6928:1463675] 方法实现：0x10238b750
     2017-02-22 13:46:02.382 RuntimeVC[6928:1463675] 方法的参数和返回值：@16@0:8
     2017-02-22 13:46:02.382 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.382 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.383 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.383 RuntimeVC[6928:1463675] 方法的返回值描述：@
     2017-02-22 13:46:02.383 RuntimeVC[6928:1463675] 方法描述：-- 名称：init -- 类型： @16@0:8
     2017-02-22 13:46:02.384 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.384 RuntimeVC[6928:1463675] 方法名称：run
     2017-02-22 13:46:02.384 RuntimeVC[6928:1463675] 方法实现：0x10238b810
     2017-02-22 13:46:02.384 RuntimeVC[6928:1463675] 方法的参数和返回值：v16@0:8
     2017-02-22 13:46:02.385 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.385 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.385 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.385 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.386 RuntimeVC[6928:1463675] 方法描述：-- 名称：run -- 类型： v16@0:8
     2017-02-22 13:46:02.386 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.386 RuntimeVC[6928:1463675] 方法名称：height
     2017-02-22 13:46:02.387 RuntimeVC[6928:1463675] 方法实现：0x10238b970
     2017-02-22 13:46:02.387 RuntimeVC[6928:1463675] 方法的参数和返回值：d16@0:8
     2017-02-22 13:46:02.387 RuntimeVC[6928:1463675] 方法的参数数量：2
     2017-02-22 13:46:02.387 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.387 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 方法的返回值描述：d
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 方法描述：-- 名称：height -- 类型： d16@0:8
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 方法名称：setHeight:
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 方法实现：0x10238b990
     2017-02-22 13:46:02.388 RuntimeVC[6928:1463675] 方法的参数和返回值：v24@0:8d16
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法的参数数量：3
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法的参数描述：@
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法的参数描述：:
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法的参数描述：d
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法的返回值描述：v
     2017-02-22 13:46:02.389 RuntimeVC[6928:1463675] 方法描述：-- 名称：setHeight: -- 类型： v24@0:8d16
     2017-02-22 13:46:02.390 RuntimeVC[6928:1463675] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     */
    
#pragma mark - 动态创建类和对象

#pragma mark - 动态创建类
    /*
     使用步骤：
     1、objc_allocateClassPair
     2、class_addIvar 、 class_addProperty 、 class_addMethod 、 class_addProtocol
     3、objc_registerClassPair
     */
    //一、创建类 -- 对比oc创建，知道“父类”、“类名”
    Class newClass = objc_allocateClassPair([NSObject class], "MyNewClass", 0);
    /*
     方法说明：
     1、第一个参数传需要继承的父类；
     2、第二个参数传类的名称；
     3、第三个参数默认传0；
     备注：如果累的名称已经存在，会创建失败；
     */
    
    //二、添加实例变量
    //2.1、添加字符串
    if (class_addIvar(newClass, "_ivar1", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *))) {
        NSLog(@"添加实例变量成功！！！！");
    } else {
        NSLog(@"添加实例变量失败啦啦啦啦！！！！");
    }
    //2.2、添加int
    if (class_addIvar(newClass, "_ivar2", sizeof(int), log2(sizeof(int)), @encode(int))) {
        NSLog(@"添加实例变量成功！！！！");
    } else {
        NSLog(@"添加实例变量失败啦啦啦啦！！！！");
    }
    
    /*
     方法描述：
     1、类名称，不是元类！
     2、实例变量名称，添加下划线的，_ivar
     3、实例变量的大小，使用 sizeof(NSString *)   ---  sizeof(OC数据类型)
     4、alignment动态配置，传 log2(sizeof(pointer_type))  --- log2(sizeof(OC数据类型))
     5、实例变量的编码类型，使用 @encode(NSString *) 来获取  ---  @encode(OC数据类型)
     
     注意：
     1、这个方法在objc_allocateClassPair方法之后，objc_registerClassPair方法之前调用；添加一个实例变量到已经存在的类是不支持的；
     2、类不能是metaclass，把实例变量添加大metaclass是不支持的，实例变量只能添加到class中；
     3、alignment传递参数为：log2(sizeof(pointer_type))，代表是可以动态变化支持的
     */
    
    unsigned int ivarCount = 0;
    Ivar *newIvars = class_copyIvarList(newClass, &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = newIvars[i];
        const char *name = ivar_getName(ivar);
        const char *typeEncoding = ivar_getTypeEncoding(ivar);
        NSLog(@"实例变量名称：%s  ---  实例变量编码类型：%s", name, typeEncoding);
        NSLog(@"----------我是分割线--------");
    }
    
    //三、添加属性
    objc_property_attribute_t typeAtt = {"T", @encode(NSString *)};
    objc_property_attribute_t atomicAtt = {"N", ""};
    objc_property_attribute_t varAtt = {"V", "_newPro"};
    objc_property_attribute_t memoryAtt = {"C", ""};
    objc_property_attribute_t readAtt = {"R", ""};
    objc_property_attribute_t setterAtt = {"S", "cusSetNewPro"};
    objc_property_attribute_t getterAtt = {"G", "cusGetNewPro"};
    objc_property_attribute_t atts[] = {typeAtt, atomicAtt, varAtt, memoryAtt, readAtt, setterAtt, getterAtt};
    
    if (class_addProperty(newClass, "newPro", atts, 7)) {
        NSLog(@"添加属性成功!!");
    } else {
        NSLog(@"添加属性失败!!");
    }

    unsigned int proCount = 0;
    objc_property_t *properties = class_copyPropertyList(newClass, &proCount); //获取属性列表
    for (int i = 0; i < proCount; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);  //获取属性名称
        const char *att = property_getAttributes(property); //获取属性对应的“特性”  // Objective-C Runtime Programming Guide
    
        NSLog(@"属性名称：%s -- 属性特性：%s", name, att);

        unsigned int count = 0;
        objc_property_attribute_t *atts = property_copyAttributeList(property, &count); //获取属性特性列表

        for (int i = 0; i < count; i++) {
            objc_property_attribute_t att = atts[i];

            char *value = property_copyAttributeValue(property, att.name);//等价于att.value

            NSLog(@"属性特性 -- 名称为：%s -- 值为：%s --", att.name, value); //
            
        }
        
        NSLog(@"----------我是分割线--------");
    }
    
    //四、添加实例方法
    SEL methodSEL1 = sel_registerName("method1");
    IMP methodIMP1 = imp_implementationWithBlock(^(id obj, NSString *string){
        NSLog(@"%@", string);
    });
    if (class_addMethod(newClass, methodSEL1, methodIMP1, "@:@")) {
        NSLog(@"添加实例方法成功！！！");
    } else {
        NSLog(@"添加实例方法失败啦啦啦啦！！");
    }
    
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(newClass, &methodCount);
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        SEL selName = method_getName(method);
        const char *name = sel_getName(selName);
        IMP imp = method_getImplementation(method);
        const char *typeEncoding = method_getTypeEncoding(method);
        
        NSLog(@"方法的名称：%s -- 方法的实现：%p -- 方法的类型编码：%s", name, imp, typeEncoding);
        NSLog(@"----------我是分割线--------");
    }
    
    
    //四、注册类
    objc_registerClassPair(newClass);
    
    
    /*
     打印：
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] 添加实例变量成功！！！！
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] 添加实例变量成功！！！！
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] 实例变量名称：_ivar1  ---  实例变量编码类型：@
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] ----------我是分割线--------
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] 实例变量名称：_ivar2  ---  实例变量编码类型：i
     2017-02-23 10:11:20.713 RuntimeVC[1616:443255] ----------我是分割线--------
     2017-02-23 10:11:20.755 RuntimeVC[1616:443255] 添加属性成功!!
     2017-02-23 10:11:20.755 RuntimeVC[1616:443255] 属性名称：newPro -- 属性特性：T@,N,V_newPro,C,R,ScusSetNewPro,GcusGetNewPro
     2017-02-23 10:11:20.755 RuntimeVC[1616:443255] 属性特性 -- 名称为：T -- 值为：@ --
     2017-02-23 10:11:20.755 RuntimeVC[1616:443255] 属性特性 -- 名称为：N -- 值为： --
     2017-02-23 10:11:20.756 RuntimeVC[1616:443255] 属性特性 -- 名称为：V -- 值为：_newPro --
     2017-02-23 10:11:20.756 RuntimeVC[1616:443255] 属性特性 -- 名称为：C -- 值为： --
     2017-02-23 10:11:20.756 RuntimeVC[1616:443255] 属性特性 -- 名称为：R -- 值为： --
     2017-02-23 10:11:20.756 RuntimeVC[1616:443255] 属性特性 -- 名称为：S -- 值为：cusSetNewPro --
     2017-02-23 10:11:20.756 RuntimeVC[1616:443255] 属性特性 -- 名称为：G -- 值为：cusGetNewPro --
     2017-02-23 10:11:20.757 RuntimeVC[1616:443255] ----------我是分割线--------
     2017-02-23 10:11:20.757 RuntimeVC[1616:443255] 添加实例方法成功！！！
     2017-02-23 10:11:20.757 RuntimeVC[1616:443255] 方法的名称：method1 -- 方法的实现：0x115546020 -- 方法的类型编码：@:@
     2017-02-23 10:11:20.757 RuntimeVC[1616:443255] ----------我是分割线--------
     */

//#pragma mark - 动态创建对象
//    
////    id instan = class_createInstance(newClass, 0); //'class_createInstance' is unavailable: not available in automatic reference counting mode
//    
//    id insta = [[newClass alloc] init];
//    
//    
//    
//    
//    
////    class_createInstance
//    
//    
//    NSLog(@"----------");
    
    
#pragma mark - 消息机制
    
//    Person *per = [[Person alloc] init];
    
    //id objc_msgSend(id self, SEL op, ...)
    
//   id result = objc_msgSend(per, @selector(addCalculateWithNum1:num2:), 10, 20);
    
    
    
//
    
//#pragma mark - “类方法”列表
//    Person *person = [[Person alloc] init];
//    person.name = @"Jack";
//    person.age = 25;
//    person.weight = 170.0;
//    person.height = 177.0;
//
//    Class personMeta = objc_getMetaClass(class_getName([person class])); //获取“元类”
//    
//    unsigned int outcout = 0;
//    Method *methodsMeta = class_copyMethodList(personMeta, &outcout); //这里传入的是“元类”
//    for (int i = 0; i < outcout; i++) {
//        Method method = methodsMeta[i];
//
//        SEL nameSel = method_getName(method);  //方法的名称 -- SEL
//        const char *name = sel_getName(nameSel); //方法的名称 -- NSString
//        NSLog(@"方法名称：%s", name);
//
//        IMP implement = method_getImplementation(method);  //方法的实现 -- IMP
//        NSLog(@"方法实现：%p", implement);
//
//        const char *typeEncoding = method_getTypeEncoding(method);  //方法的参数和返回值
//        NSLog(@"方法的参数和返回值：%s", typeEncoding);
//
//        unsigned int numberOfArguments = method_getNumberOfArguments(method); //方法参数数量
//        NSLog(@"方法的参数数量：%d", numberOfArguments);
//        for (int j = 0; j < numberOfArguments; j++) {
//            char *describingTheTypeOfTheParameter = method_copyArgumentType(method, j); //方法参数描述
//            NSLog(@"方法的参数描述：%s", describingTheTypeOfTheParameter);
//        }
//
//        char *returnType = method_copyReturnType(method); //方法返回值描述
//        NSLog(@"方法的返回值描述：%s", returnType);
//
//        struct objc_method_description *methodDescription = method_getDescription(method);  //描述描述
//        SEL methodDescriptionName = methodDescription->name;
//        char *methodDescriptionTypes = methodDescription->types;
//        
//        NSLog(@"方法描述：-- 名称：%s -- 类型： %s", sel_getName(methodDescriptionName), methodDescriptionTypes);
//    
//        NSLog(@"分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
//    }
//    
    /*
     打印：
     2017-02-22 14:27:17.585 RuntimeVC[8212:1776416] 方法名称：swim
     2017-02-22 14:27:17.585 RuntimeVC[8212:1776416] 方法实现：0x100b169a0
     2017-02-22 14:27:17.586 RuntimeVC[8212:1776416] 方法的参数和返回值：v16@0:8
     2017-02-22 14:27:17.586 RuntimeVC[8212:1776416] 方法的参数数量：2
     2017-02-22 14:27:17.586 RuntimeVC[8212:1776416] 方法的参数描述：@
     2017-02-22 14:27:17.586 RuntimeVC[8212:1776416] 方法的参数描述：:
     2017-02-22 14:27:17.587 RuntimeVC[8212:1776416] 方法的返回值描述：v
     2017-02-22 14:27:17.587 RuntimeVC[8212:1776416] 方法描述：-- 名称：swim -- 类型： v16@0:8
     2017-02-22 14:27:17.587 RuntimeVC[8212:1776416] 分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     */
//
//    
//    
//    method_exchangeImplementations(eatMethod, runMethod); //交换两个方法的实现 -- Method
//    
//    [person run]; //打印：人可以吃饭    ---- 原先打印： 人可以跑
//    [person eat]; //打印：人可以跑      ---- 原先打印： 人可以吃饭
//    
//    
    
#pragma mark - 类方法用“class_getClassMethod”获取，实例方法用“class_getInstanceMethod”获取，如果方法错误的话获取不到方法
    
#pragma mark - 获取实例方法
    
//    Method runM = class_getClassMethod([person class], @selector(run));  //run为实例方法，获取为空
//    Method eatM = class_getClassMethod([person class], @selector(eat));  //eat为实例方法，获取为空
    
    //方法一、获取相应的方法Method，直接交换两个方法的实现
//    Person *person = [[Person alloc] init];
//    
//    [person run];  //打印：人可以跑
//    [person eat];  //打印：人可以吃饭
    
//    Method runM = class_getInstanceMethod([person class], @selector(run));  //SEL类型的快捷方法：@selector(方法名称)
//    Method eatM = class_getInstanceMethod([person class], @selector(eat));  //SEL类型的快捷方法：@selector(方法名称)
//    
//    method_exchangeImplementations(runM, eatM); //交换方法的实现
//    
//    [person run];  //打印：人可以吃饭
//    [person eat];  //打印：人可以跑

    
    //方法二、获取相应的方法Method和实现IMP，设置方法的实现IMP
//    Person *person = [[Person alloc] init];
//    
//    [person run];  //打印：人可以跑
//    [person eat];  //打印：人可以吃饭
//    
//    Method runM = class_getInstanceMethod([person class], @selector(run));  //SEL类型的快捷方法：@selector(方法名称)
//    Method eatM = class_getInstanceMethod([person class], @selector(eat));  //SEL类型的快捷方法：@selector(方法名称)
//    
//    IMP rumIMP = method_getImplementation(runM);
//    IMP eatIMP = method_getImplementation(eatM);
//    
//    method_setImplementation(runM, eatIMP);
//    method_setImplementation(eatM, rumIMP);
//    
//    [person run]; //打印：人可以吃饭
//    [person eat]; //打印：人可以跑
    
    
#pragma mark - 获取类方法
//    Method swimMethod = class_getClassMethod([person class], @selector(swim));
//    
//    SEL swimSELName = method_getName(swimMethod);
//    IMP swimIMP = method_getImplementation(swimMethod);
//    
//    NSLog(@"%s--%p", sel_getName(swimSELName), swimIMP); //打印： swim 0x100f29ca0 (HYKit`+[Person swim] at Person.m:25)	0x0000000100f29ca0
//    
    
    
    
    NSLog(@"-------");
    


    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.frame = CGRectMake(50, 200, 200, 200);
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
//    imageView.image = [UIImage imageNamed:@"123456"];

    
//    NSObject *ob = [[NSObject alloc] init];
//    
//    NSLog(@"之前-----%@", ob.hy_name);
//    
//    ob.hy_name = @"NSObject";
//    
//    NSLog(@"之后-----%@", ob.hy_name);
//    
//    
//    NSObject *another = [[NSObject alloc] init];
//    
//    NSLog(@"另外一个-----%@", another.hy_name);
//    
//    NSLog(@"----------");
    
    Person *person = [[Person alloc] init];
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

 
// /**
// * Creates a new class and metaclass.
// *
// * @param superclass The class to use as the new class's superclass, or \c Nil to create a new root class.
// * @param name The string to use as the new class's name. The string will be copied.
// * @param extraBytes The number of bytes to allocate for indexed ivars at the end of
// *  the class and metaclass objects. This should usually be \c 0.
// *
// * @return The new class, or Nil if the class could not be created (for example, the desired name is already in use).
// *
// * @note You can get a pointer to the new metaclass by calling \c object_getClass(newClass).
// * @note To create a new class, start by calling \c objc_allocateClassPair.
// *  Then set the class's attributes with functions like \c class_addMethod and \c class_addIvar.
// *  When you are done building the class, call \c objc_registerClassPair. The new class is now ready for use.
// * @note Instance methods and instance variables should be added to the class itself.
// *  Class methods should be added to the metaclass.
// */
//OBJC_EXPORT Class objc_allocateClassPair(Class superclass, const char *name,
//                                         size_t extraBytes)
//OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0);
//
///**
// * Registers a class that was allocated using \c objc_allocateClassPair.
// *
// * @param cls The class you want to register.
// */
//OBJC_EXPORT void objc_registerClassPair(Class cls)
//OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0);

- (void)jump:(NSString *)num{
    NSLog(@"SEL实现：跳跃了%@次----", num);
}

void jumpIMP(id self, SEL _cmd, NSString *num){
    NSLog(@"IMP实现：跳跃了%@次----", num);
}

@end
