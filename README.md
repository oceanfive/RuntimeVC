# RuntimeVC
OC运行时Runtime探究
# 运行时
## 文章结构：
### 一、基本介绍
#### (一)基本知识
#### (二)头文件
	1、主要的有
	2、次要的有
	3、其他
### 二、解析
#### （一）实例、类、元类
	1、图片
	2、文字描述
	3、代码
#### （二）类相关
##### 1、类的定义
##### 2、类的相关方法
	2.1、父类
	2.2、类的名称
	2.3、类的版本
	2.4、类的信息
	2.5、类的实例大小
##### 3、类的创建
##### 4、给类添加实例变量
##### 5、给类添加属性
##### 6、给类添加方法
##### 7、给类添加协议
##### 8、给类添加分类
#### （三）实例变量相关
##### 1、定义
##### 2、Ivar方法
	2.1、获取实例变量名称
	2.2、获取实例变量的编码类型
	2.3、获取实例变量的偏移量
	2.4、代码
##### 3、使用
	3.1、创建实例变量
	3.2、获取实例变量
	3.3、设置实例变量的值和获取实例变量的值
	3.4、添加实例变量
	3.5、获取实例变量列表
	3.6、代码
##### 4、其他
	4.1、获取类变量
#### （四）属性相关
##### 1、定义
##### 2、方法
	2.1、获取属性名称
	2.2、获取属性特性
	2.3、获取属性特性列表
	2.4、获取属性特性值
##### 3、使用
	3.1、创建属性
	3.2、获取属性
	3.3、设置属性的值和获取属性的值
	3.4、添加属性
	3.5、获取属性列表
	3.6、代码
##### 4、其他
	4.1、替换属性
#### （五）方法相关
##### 1、定义
   	1.1、方法定义
   	1.2、method
			1.2.1、获取SEL
			1.2.1、获取IMP
			1.2.3、获取类型编码
			1.2.4、获取参数数量
			1.2.5、获取返回值描述
			1.2.6、获取参数描述
			1.2.7、获取方法的描述
			1.2.8、设置方法的实现、method_setImplementation
			1.2.9、交换方法的实现、method_exchangeImplementations
	1.3、SEL
			1.3.1、创建、生成
			1.3.2、获取名称
			1.3.3、判断是否相同
	1.4、IMP
			1.4.1、创建、生成
			1.4.2、获取
			1.4.3、移除
	1.5、方法类型Types
	1.6、代码
			1.6.1、获取实例方法列表
			1.6.2、获取类方法列表
			1.6.3、小结
##### 2、其他
	2.1、创建
	2.2、获取
		2.2.1、常规
		2.2.2、获取实例方法
		2.2.3、获取类方法
	2.3、设置SEL和IMP的映射关系
	2.4、添加方法
	2.5、获取方法列表
	2.6、代码
#### (六)、类的创建、给类添加实例变量、属性、方法
	1、使用步骤
	2、代码
### 三、应用
	1、归档存储对象，解档读取对象
	2、给分类添加属性
	3、字典转模型
	4、方法交换，Swizzle
	5、给UINavigationController添加滑动手势
	6、跳转控制器

### 一、基本介绍
#### (一)基本知识
    众所周知，OC是一门“动态”语言，“动态”体现在程序运行时可以改变许多事情，做一些自定义的处理，这些都是依靠底层的runtime来实现的；
	runtime有1.0和2.0两个版本；1.0是传统版本(legacy)，2.0是现代版本(modern)；32位系统上的是1.0版本；64位系统上的是2.0版本；
#### (二) 使用运行时需要导入的头文件有：
##### 1、主要的有：
	#import <objc/runtime.h>：定义了runtime的类型和方法，类型有：类、对象、方法、实例变量、属性、分类、协议等等；方法有三个前缀的：objc_ 、class_ 、object_ 
	#import <objc/message.h>：定义了oc消息机制的一些方法：最主要的是objc_msgSend()
##### 2、次要的有：
	#import <objc/objc.h>：主要定义了类型SEL和IMP以及一些相关方法等
	#import <objc/NSObject.h>：平时经常使用的类NSObject和协议NSObject
	#import <objc/NSObjCRuntime.h>：对NSInteger和NSUInteger进行了定义；在64位操作系统上： typedef long NSInteger; typedef unsigned long NSUInteger;在32位操作系统上： typedef int NSInteger; typedef unsigned int NSUInteger;
##### 3、其他的有
	#import <objc/Protocol.h>：这个头文件中的方法在1.0版本的runtime可以使用，2.0版本的话用objc/runtime.h头文件中的方法
	#import <objc/Object.h>：运行时object的一些方法，如初始化，创建，比较，内存管理等
	#import <objc/objc-sync.h>：未知
	#import <objc/objc-runtime.h>：这个头文件导入了其他两个头文件#include <objc/runtime.h> 和 	#include<objc/message.h>
	#import <objc/objc-load.h>：未知
	#import <objc/objc-exception.h>：未知
	#import <objc/objc-class.h>：这个头文件导入了其他两个头文件#include <objc/runtime.h> 和 #include<objc/message.h>
	#import <objc/objc-auto.h>：该头文件方法都被废除了！！！！！
	#import <objc/objc-api.h>：一大堆宏定义，好像都不使用了
	#import <objc/List.h>：好像没用到
	#import <objc/hashtable2.h>：应该是方法查找相关的
	#import <objc/hashtable.h>：导入了头文件#include <objc/hashtable2.h>
## 二、解析
### (一)实例、类、元类
##### 	1、借用网络上的图片，如下：
[![实例、类、元类关系](http://ok0lwc348.bkt.clouddn.com/%E5%AE%9E%E4%BE%8B%E3%80%81%E7%B1%BB%E3%80%81%E5%85%83%E7%B1%BB%E5%85%B3%E7%B3%BB.png "实例、类、元类关系")](www.romanysoft.com "实例、类、元类关系")
	
##### 	2、文字解析：
	实例的isa指针指向这个实例所属的“类”；
	类的isa指针指向这个类的“元类”；
	元类的isa指针指向“根元类”；即NSObject(metaclass)；
	根元类的isa指针指向“本身”，即NSObject(metaclass)；

	类的superclass指向这个类的父类；
	根类为NSObject(class)；
	根类NSObject(class)的superclass为null；
	元类的父类指向这个元类的父元类；
	根元类为NSObject(metaclass)；
	根元类NSObject(metaclass)的父类为NSObject(class)；

	null的isa和superclass可以理解为指向本身，即null；

##### 3、代码（代码中使用到的方法后面会有描述）
```objective-c
	//类的继承关系为：Person --- HYObject --- NSObject 
	Person *per = [[Person alloc] init];
    
    Class personName = objc_getClass(class_getName([Person class]));  //Person
    Class personMeta = objc_getMetaClass(class_getName([Person class])); //Person
    
    Class hyObject = class_getSuperclass(personName); // HYObject
    Class hyObjectName = objc_getClass(class_getName(hyObject)); // HYObject
    Class hyObjectMeta = objc_getMetaClass(class_getName(hyObject)); // HYObject
    
    Class nsObject = class_getSuperclass(hyObject); //NSObject
    Class nsObjectName = objc_getClass(class_getName(nsObject)); //NSObject
    Class nsObjectMeta = objc_getMetaClass(class_getName(nsObject));//NSObject
    
    Class null = class_getSuperclass(nsObject); //(null)
    Class nullName = objc_getClass(class_getName(null)); //(null)
    Class nullMeta = objc_getMetaClass(class_getName(null)); //(null)
    
    Class root = class_getSuperclass(null); //(null)
    Class rootName = objc_getClass(class_getName(root)); //(null)
    Class rootMeta = objc_getMetaClass(class_getName(root)); //(null)
    
     NSLog(@"\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@\n%@--%@--%@", personName, personName, personMeta, hyObject, hyObjectName, hyObjectMeta, nsObject, nsObjectName, nsObjectMeta, null, nullName, nullMeta, root, rootName, rootMeta);
	 
	/*
	打印：
	Person--Person--Person
	HYObject--HYObject--HYObject
	NSObject--NSObject--NSObject
	(null)--(null)--(null)
	(null)--(null)--(null)
	*/
```
可以看到null的父类和isa都是null，可以理解为指向“本身”，这样就形成了一个闭环；

### （二）类相关
#### 1、类的定义
```objective-c
struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;

#if !__OBJC2__
    Class super_class                                        OBJC2_UNAVAILABLE;
    const char *name                                         OBJC2_UNAVAILABLE;
    long version                                             OBJC2_UNAVAILABLE;
    long info                                                OBJC2_UNAVAILABLE;
    long instance_size                                       OBJC2_UNAVAILABLE;
    struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
    struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;
    struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
    struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
#endif

} OBJC2_UNAVAILABLE;
/* Use `Class` instead of `struct objc_class *` */
```
可以看到：有isa，父类，类的名称、类的版本信息、类的信息、类的实例大小、实例变量列表、方法列表、缓存、协议列表；

#### 2、类的相关方法
##### 2.1、获取父类 (2个方法)
```objective-c
	//类的继承关系为：Person --- HYObject --- NSObject 
    Person *person = [[Person alloc] init];
	
    Class superClassName = class_getSuperclass([person class]); //方法一：runtime
    Class superClassName2 = [person superclass]; //方法二
    NSLog(@"%@---%@", superClassName, superClassName2);
	//打印： HYObject---HYObject
```
##### 2.2、获取类的名称 (3个方法)
```objective-c
    Person *person = [[Person alloc] init];
    
    const char *className = class_getName([person class]);  //方法一、class_getName --- <objc/runtime.h>
    const char *className2 = object_getClassName(person);   //方法二、object_getClassName  --- <objc/runtime.h>
    NSString *className3 = NSStringFromClass([person class]); //方法三、 NSStringFromClass  --- NSObjCRuntime.h
    NSLog(@"%s--%s--%@", className, className2, className3);
    //打印：Person--Person--Person
```
##### 2.3、类的版本(设置方法2个，获取方法2个)
```objective-c
    Person *person = [[Person alloc] init];
    
    //获取类的版本信息 -- 默认为 0  -- 2个方法
    int version = class_getVersion([person class]);  //方法一、  class_getVersion ---  <objc/runtime.h>
    NSInteger version2 = [Person version];  //方法二、[类名 version];  ---  @interface NSObject (NSCoderMethods）
        
    NSLog(@"%d --- %ld", version, version2);
    //打印：0 --- 0
        
    //设置类的版本信息 -- 2个方法
    //    class_setVersion([person class], 5);  //方法一、 class_setVersion  ---  <objc/runtime.h>
    [Person setVersion:5];  //方法二、 [类名 setVersion:]; --- @interface NSObject (NSCoderMethods)
    int version3 = class_getVersion([person class]);
    
    NSLog(@"%d --- %d", version, version3);
    //打印：  0 --- 5
```
类的版本默认为0，获取方法有2个，设置方法有2个；类的版本看官方文档是与对象的序列化有关(object serialization)；

##### 2.4、类的信息

暂无

##### 2.5、类的实例大小
```objective-c
    Person *person = [[Person alloc] init];
    
    size_t size = class_getInstanceSize([person class]);
    NSLog(@"%zu", size);
    //打印： 40  单位为 bytes
    
    NSObject *ob = [[NSObject alloc] init];
    size_t sizeOb = class_getInstanceSize([ob class]);
    NSLog(@"%zu", sizeOb);
    //打印： 8  单位为 bytes
```
#### 3、类的创建
详情见后面(六)，类的创建、给类添加实例变量、属性、方法
#### 4、给类添加实例变量
详情见后面(六)，类的创建、给类添加实例变量、属性、方法
#### 5、给类添加属性
详情见后面(六)，类的创建、给类添加实例变量、属性、方法
#### 6、给类添加方法
详情见后面(六)，类的创建、给类添加实例变量、属性、方法
#### 7、给类添加协议
暂无、待添加；
#### 8、给类添加分类
暂无，待添加；

### （三）实例变量
#### 1、定义
```objective-c
typedef struct objc_ivar *Ivar;

struct objc_ivar {
    char *ivar_name                                          OBJC2_UNAVAILABLE;
    char *ivar_type                                          OBJC2_UNAVAILABLE;
    int ivar_offset                                          OBJC2_UNAVAILABLE;
#ifdef __LP64__
    int space                                                OBJC2_UNAVAILABLE;
#endif
} 
```
实例变量是一个指向结构体的指针；实例变量有：名称、编码类型、偏移量；

#### 2、Ivar方法
##### 2.1、获取实例变量名称
`ivar_getName`
##### 2.2、获取实例变量的编码类型
`ivar_getTypeEncoding`

具体编码类型如下：
[![Objective-C type encodings](http://ok0lwc348.bkt.clouddn.com/Objective-C%20type%20encodings.png "Objective-C type encodings")](www.romanysoft.com "Objective-C type encodings")
上表是从官方文档中截取出来的，具体可以在官方文档 Objective-C Runtime Programming Guide > Type Encodings 中查看；
备注：获取Type Encodings的方式为@encode(type-name)

##### 2.3、获取实例变量的偏移量
`ivar_getOffset`

偏移量可以理解为对象的实例变量的“索引”； index * 8 (index > 0) ；

##### 2.4、代码
```objective-c
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
	Person *person = [[Person alloc] init];
	unsigned int count = 0 ;
    Ivar *ivars = class_copyIvarList([person class], &count);  //获取类的实例变量列表
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);  //获取实例变量名称
        const char *encodingType = ivar_getTypeEncoding(ivar); //获取实例变量的编码，或者说数据类型
        ptrdiff_t offset = ivar_getOffset(ivar); //获取实例变量的偏移量

        NSLog(@"变量名称：%s -- 编码类型：%s -- 偏移量：%td", name, encodingType, offset);
    }

    /*
     打印：
     变量名称：_sex -- 编码类型：@"NSString" -- 偏移量：8
     变量名称：_age -- 编码类型：i -- 偏移量：16
     变量名称：_name -- 编码类型：@"NSString" -- 偏移量：24
     变量名称：_height -- 编码类型：d -- 偏移量：32
     变量名称：_weight -- 编码类型：d -- 偏移量：40
     */
	 
```
从打印结果可以看到：
实例变量的偏移量为：8、16、24、32、40；呈递增趋势，规律为 index * 8 (index > 0)；偏移量理解为“索引”；

#### 3、使用流程
##### 3.1、创建实例变量
创建等价于“添加”，见后面(六)，类的创建、给类添加实例变量、属性、方法；

##### 3.2、获取实例变量
`class_getInstanceVariable`

##### 3.3、设置实例变量的值和获取实例变量的值
###### 3.3.1、设置 
`object_setIvar` ; 

10.0之后还有另外一个方法： `object_setIvarWithStrongDefault` ；

补充：在非ARC环境下，还有另外两个方法：
`object_setInstanceVariable`和`object_setInstanceVariableWithStrongDefault` ；

###### 3.3.2、获取 
`object_getIvar` ; 

补充：在非ARC环境下，还有另外一个方法： `object_getInstanceVariable`

##### 3.4、添加实例变量  
`class_addIvar`
见后面(六)。类的创建、给类添加实例变量、属性、方法；

##### 3.5、获取实例变量列表
`class_copyIvarList`

##### 3.6、代码
```objective-c
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

	Person *person = [[Person alloc] init];

	//获取实例变量
    Ivar sexIvar = class_getInstanceVariable([person class], "_sex");
    Ivar ageIvar = class_getInstanceVariable([person class], "_age");
    Ivar nameIvar = class_getInstanceVariable([person class], "_name");
    Ivar weightIvar = class_getInstanceVariable([person class], "_weight");
    Ivar heightIvar = class_getInstanceVariable([person class], "_height");
	Ivar newIvar = class_getInstanceVariable([person class], "_father");  //没有_father这个实例变量，所以newIvar为nil

    //设置实例变量的值
    object_setIvar(person, sexIvar, @"男");
    object_setIvar(person, ageIvar, @25);
    object_setIvar(person, nameIvar, @"Jack");
    object_setIvar(person, weightIvar, @170.0);
    object_setIvar(person, heightIvar, @177);
	object_setIvar(person, newIvar, @"new");  //没有_father这个实例变量，所以newIvar为nil，设置值也是设置不上，结果为nil

    unsigned int count = 0 ;
    Ivar *ivars = class_copyIvarList([person class], &count);  //获取类的实例变量列表
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);  //获取实例变量名称
        const char *encodingType = ivar_getTypeEncoding(ivar); //获取实例变量的编码，或者说数据类型
        ptrdiff_t offset = ivar_getOffset(ivar); //获取实例变量的偏移量
        
        id value = object_getIvar(person, ivar); //获取实例变量的值

        NSLog(@"变量名称：%s -- 编码类型：%s -- 偏移量：%td -- 值为：%@", name, encodingType, offset, value);
        
    }

    /*
     打印：
     变量名称：_sex -- 编码类型：@"NSString" -- 偏移量：8 -- 值为：男
     变量名称：_age -- 编码类型：i -- 偏移量：16 -- 值为：25
     变量名称：_name -- 编码类型：@"NSString" -- 偏移量：24 -- 值为：Jack
     变量名称：_height -- 编码类型：d -- 偏移量：32 -- 值为：177
     变量名称：_weight -- 编码类型：d -- 偏移量：40 -- 值为：170
     */

```
如果没有_father这个实例变量，获取到的为nil，也无法设置值，也不在实例变量列表中；

#### 4、其他
##### 4.1、获取类变量
`class_getClassVariable`

### （四）属性相关
#### 1、定义
##### 1.1、属性定义
```objective-c
typedef struct objc_property *objc_property_t;
```
##### 1.2、属性的特性定义
```objective-c
/// Defines a property attribute
typedef struct {
    const char *name;           /**< The name of the attribute */
    const char *value;          /**< The value of the attribute (usually empty) */
} objc_property_attribute_t;
```
下面有对属性的特性的详细描述；

#### 2、方法
##### 2.1、获取属性名称
`property_getName`
##### 2.2、获取属性特性
`property_getAttributes`

 如下：
[![Property Type String](http://ok0lwc348.bkt.clouddn.com/Property%20Type%20String.png "Property Type String")](www.romanysoft.com "Property Type String")

属性特性可以理解为对属性的描述：如属性的类型(T)，和类型编码Type Encodings相同；属性的原子性;属性的内存管理；属性对应的实例变量的名称；等等；
具体如下：
1、属性的数据类型(T)，和Type Encodings相同；
2、属性的原子性(N)，原子性(atomic)不显示，非原子性(nonatomic)显示N；
3、属性的对应的实例变量名称(V)，_var；
4、属性的内存管理(C,&,W)， copy策略显示C，retain策略显示&，weak策略显示W；
5、属性的读写性(R)，读写(readwrite)不显示，只读(readonly)显示R；
6、属性的setter(S)和getter(G)名称， 未设置不显示，设置的话显示设置的名称；
7、属性的自动生成setter和getter方法(D), 未设置不显示，设置@dynamic显示D；
8、属性的回收(P)；
9、属性的旧风格编码；

##### 2.3、获取属性特性列表
`property_copyAttributeList`
##### 2.4、获取属性特性值
`property_copyAttributeValue`

#### 3、使用
##### 3.1、创建属性
等同于添加属性，见后面(六)，类的创建、给类添加实例变量、属性、方法；
##### 3.2、获取属性
`class_getProperty`
##### 3.3、设置属性的值和获取属性的值
无直接方法，属性可以理解为setter和getter，使用`objc_getAssociatedObject`获取，使用`objc_setAssociatedObject`进行设置；代码如下
```objective-c
/*
给NSObject添加分类，并在分类中添加属性

//.h文件内容如下：
#import <Foundation/Foundation.h>
@interface NSObject (HYCategory)

@property (nonatomic, copy) NSString *hy_name;

@end


//.m文件内容如下：
#import "NSObject+HYCategory.h"
#import <objc/runtime.h>

static const char hy_nameKey;

@implementation NSObject (HYCategory)

- (NSString *)hy_name{
   return objc_getAssociatedObject(self, &hy_nameKey);
}

- (void)setHy_name:(NSString *)hy_name{
    objc_setAssociatedObject(self, &hy_nameKey, hy_name, OBJC_ASSOCIATION_COPY);
}

@end

*/

//.h文件代码
```

##### 3.4、添加属性 
`class_addProperty`

详情见后面(六)，类的创建、给类添加实例变量、属性、方法；

##### 3.5、获取属性列表
`class_copyPropertyList`
##### 3.6、代码
```objective-c
	/*
     Person头文件定义的实例变量和属性如下：
     {
        NSString *_sex;
     }
     @property (nonatomic, assign) int age;
     @property (nonatomic, assign, getter=cusGetAge) int age; //自定义getter名称
     @property (nonatomic, assign) double height;
     @property (nonatomic, assign) double weight;
	 @property (nonatomic, strong) NSArray *sArray; //strong类型数组
	 @property (nonatomic, weak) NSArray *wArray; //weak类型数组
     */
	Person *person = [[Person alloc] init];
    person.name = @"Jack";
    person.age = 25;
    person.weight = 170.0;
    person.height = 177.0;

    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([person class], &outCount); //获取属性列表
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);  //获取属性名称
        const char *att = property_getAttributes(property); //获取属性对应的“特性” ，详情见 Objective-C Runtime Programming Guide

        NSLog(@"属性名称：%s -- 属性特性：%s", name, att);
        
        unsigned int count = 0;
        objc_property_attribute_t *atts = property_copyAttributeList(property, &count); //获取属性特性列表
        for (int i = 0; i < count; i++) {
            objc_property_attribute_t att = atts[i];
            char *value = property_copyAttributeValue(property, att.name);//等价于att.value
            
            NSLog(@"属性特性 -- 名称为：%s -- 值为：%s --", att.name, value); //
        }
        NSLog(@"-------分割线-----------");
    }
	/*
	打印：
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
```
可以看到：
属性的特性就是对属性的相关描述：
1、属性的数据类型(T)，和Type Encodings相同；
2、属性的原子性(N)，原子性(atomic)不显示，非原子性(nonatomic)显示N；
3、属性的对应的实例变量名称(V)，_var；
4、属性的内存管理(C,&,W)， copy策略显示C，retain策略显示&，weak策略显示W；
5、属性的读写性(R)，读写(readwrite)不显示，只读(readonly)显示R；
6、属性的setter(S)和getter(G)名称， 未设置不显示，设置的话显示设置的名称；
7、属性的自动生成setter和getter方法(D), 未设置不显示，设置@dynamic显示D；
8、属性的回收(P)；
9、属性的旧风格编码t<encoding>；

#### 4、其他
##### 4.1、替换属性
`class_replaceProperty`

### （五）方法相关
#### 1、定义
##### 1.1、方法定义
```objective-c
typedef struct objc_method *Method;

struct objc_method {
    SEL method_name                                          OBJC2_UNAVAILABLE;
    char *method_types                                       OBJC2_UNAVAILABLE;
    IMP method_imp                                           OBJC2_UNAVAILABLE;
}  
```
方法有：方法名称(SEL)、方法的实现(IMP)、方法的类型(types)；

##### 1.2、method
###### 1.2.1、获取SEL
`method_getName`
###### 1.2.1、获取IMP
`method_getImplementation`
###### 1.2.3、获取类型编码
`method_getTypeEncoding`
###### 1.2.4、获取参数数量
`method_getNumberOfArguments`
###### 1.2.5、获取返回值描述
`method_copyReturnType` 、`method_getReturnType`
###### 1.2.6、获取参数描述
`method_copyArgumentType` 、`method_getArgumentType`
###### 1.2.7、获取方法的描述
`method_getDescription`
###### 1.2.8、设置方法的实现
`method_setImplementation`
###### 1.2.9、交换方法的实现
`method_exchangeImplementations`


##### 1.3、SEL
###### 1.3.1、创建、生成(4个方法)
`sel_getUid` ;
`sel_registerName` ;
`NSSelectorFromString` ;
`@selector` ;
```objective-c
//生成SEL方法选择器的四种方式：
//    SEL newM = sel_registerName("newMethod"); //runtime的方法sel_registerName
//    SEL newM = sel_getUid("newMethod");  //runtime的方法sel_getUid
//    SEL newM = NSSelectorFromString(@"newMethod");  //NSObjCRuntime.h 中的方法  NSSelectorFromString
//    SEL newM = @selector(newMethod);  //直接方法： @selector(方法名称) --- 最常用的
```

###### 1.3.2、获取名称(2个方法)
`sel_getName` ；
`NSStringFromSelector` ；
```objective-c
    //获取方法名称的两种方式：
    const char *newName = sel_getName(newM);  //runtime的方法sel_getName
    NSString *newName2 = NSStringFromSelector(newM); //NSObjCRuntime.h 中的方法 NSStringFromSelector
```

###### 1.3.3、判断是否相同 
`sel_isEqual` ；
```objective-c
	//一、
    SEL newM = @selector(newMethod);
    SEL new2 = NSSelectorFromString(@"newMethod");
    if (sel_isEqual(newM, new2)) {
        NSLog(@"两个方法选择器名称相同");  //走这个方法
    } else {
        NSLog(@"两个方法选择器名称不相同");
    }
    
    //二、
    SEL newM = @selector(newMethod);
    SEL new2 = NSSelectorFromString(@"newMethod2");
    if (sel_isEqual(newM, new2)) {
        NSLog(@"两个方法选择器名称相同");
    } else {
        NSLog(@"两个方法选择器名称不相同");  //走这个方法
    }
```

##### 1.4、IMP
###### 1.4.1、创建、生成(2中方法)
`imp_implementationWithBlock`；

(IMP)jumpIMP；用函数转换；
```objective-c
	//一、
    IMP myIMP = imp_implementationWithBlock(^(id obj, NSString *str) {
        
        NSLog(@"%@", str);
        return str;  //这里可以有返回值，也可以没有返回值，根据实际情况具体处理
    });
	//二、
	(IMP)jumpIMP
	
	void jumpIMP(id self, SEL _cmd, NSString *num){
    NSLog(@"IMP实现：跳跃了%@次----", num);
}

```
从方法二可以知道方法的类型types的格式：返回值类型@:参数1类型、参数2类型、参数3类型... 
@代表 id self；
：代表SEL _cmd；

###### 1.4.2、获取 
`imp_getBlock`

备注：其他方法有

`class_getMethodImplementation`、`class_getMethodImplementation_stret`
###### 1.4.3、移除 
`imp_removeBlock`

##### 1.5、方法类型Types
方法类型的格式为：返回值类型@:参数1类型、参数2类型、参数3类型... ；
返回值和参数的编码类型参照 Type Encodings ；
@代表id，：代表SEL，参照方法IMP的实现；
具体见下面代码示例
##### 1.6、代码
###### 1.6.1、获取“实例方法列表”
```objective-c
    /*
     Person头文件定义的实例变量、属性和方法如下：
     {
        NSString *_sex;
     }
     @property (nonatomic, assign) int age;
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, assign) double height;
     @property (nonatomic, assign) double weight;
	 - (void)run;
	 - (void)eat;
	 - (int)addCalculateWithNum1:(int)num1 num2:(int)num2;
	 + (void)swim;
     */
    Person *person = [[Person alloc] init];
    person.name = @"Jack";
    person.age = 25;
    person.weight = 170.0;
    person.height = 177.0;

    unsigned int count = 0;
    Method *methods = class_copyMethodList([person class], &count);  //获取所有的方法列表
	//备注，如果传入的是“类”，获取的是“实例方法列表”；如果传入的是“元类”，获取的是“类方法列表”
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        
        SEL nameSel = method_getName(method);  //方法的名称 -- SEL
        const char *name = sel_getName(nameSel); //方法的名称 -- const char *
        NSLog(@"方法名称：%s", name);

        IMP implement = method_getImplementation(method);  //方法的实现 -- IMP
        NSLog(@"方法实现：%p", implement);

        const char *typeEncoding = method_getTypeEncoding(method);  //方法的参数和返回值
        NSLog(@"方法的参数和返回值：%s", typeEncoding);
        
        unsigned int numberOfArguments = method_getNumberOfArguments(method); //方法参数数量
        NSLog(@"方法的参数数量：%d", numberOfArguments);
        for (int j = 0; j < numberOfArguments; j++) {
            char *describingTheTypeOfTheParameter = method_copyArgumentType(method, j); //方法参数描述
            NSLog(@"方法的参数描述：%s", describingTheTypeOfTheParameter);
        }
        
        char *returnType = method_copyReturnType(method); //方法返回值描述
        NSLog(@"方法的返回值描述：%s", returnType);
        
        struct objc_method_description *methodDescription = method_getDescription(method);  //描述描述
        SEL methodDescriptionName = methodDescription->name;
        char *methodDescriptionTypes = methodDescription->types;
        
        NSLog(@"方法描述：-- 名称：%s -- 类型： %s", sel_getName(methodDescriptionName), methodDescriptionTypes);
    
        NSLog(@"分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    }
    
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

```
有个方法名称.cxx_destruct，这是ARC情况下自动释放相关；可参考文章[.cxx_destruct](http://blog.jobbole.com/65028/ ".cxx_destruct")
注意：这里获取的是都是实例方法，没有类方法`+ (void)swim;`；

###### 1.6.2、获取“类方法列表”
```objective-c
 /*
     Person头文件定义的实例变量、属性和方法如下：
     {
        NSString *_sex;
     }
     @property (nonatomic, assign) int age;
     @property (nonatomic, copy) NSString *name;
     @property (nonatomic, assign) double height;
     @property (nonatomic, assign) double weight;
	 - (void)run;
	 - (void)eat;
	 - (int)addCalculateWithNum1:(int)num1 num2:(int)num2;
	 + (void)swim;
     */
    Person *person = [[Person alloc] init];
    person.name = @"Jack";
    person.age = 25;
    person.weight = 170.0;
    person.height = 177.0;

    Class personMeta = objc_getMetaClass(class_getName([person class])); //获取“元类”
    
    unsigned int outcout = 0;
    Method *methodsMeta = class_copyMethodList(personMeta, &outcout); //这里传入的是“元类”
    for (int i = 0; i < outcout; i++) {
        Method method = methodsMeta[i];

        SEL nameSel = method_getName(method);  //方法的名称 -- SEL
        const char *name = sel_getName(nameSel); //方法的名称 -- NSString
        NSLog(@"方法名称：%s", name);

        IMP implement = method_getImplementation(method);  //方法的实现 -- IMP
        NSLog(@"方法实现：%p", implement);

        const char *typeEncoding = method_getTypeEncoding(method);  //方法的参数和返回值
        NSLog(@"方法的参数和返回值：%s", typeEncoding);

        unsigned int numberOfArguments = method_getNumberOfArguments(method); //方法参数数量
        NSLog(@"方法的参数数量：%d", numberOfArguments);
        for (int j = 0; j < numberOfArguments; j++) {
            char *describingTheTypeOfTheParameter = method_copyArgumentType(method, j); //方法参数描述
            NSLog(@"方法的参数描述：%s", describingTheTypeOfTheParameter);
        }

        char *returnType = method_copyReturnType(method); //方法返回值描述
        NSLog(@"方法的返回值描述：%s", returnType);

        struct objc_method_description *methodDescription = method_getDescription(method);  //描述描述
        SEL methodDescriptionName = methodDescription->name;
        char *methodDescriptionTypes = methodDescription->types;
        
        NSLog(@"方法描述：-- 名称：%s -- 类型： %s", sel_getName(methodDescriptionName), methodDescriptionTypes);
    
        NSLog(@"分割线^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    }
    
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

```
这里获取到的是类方法`+ (void)swim;`；

###### 1.6.3、小结：
对比可以看到，class_copyMethodList方法根据传入的类不同从而获取不同的方法列表；
如果传入的是“类”，获取到的是“实例方法列表”；
如果传入的是“元类”，获取到的是“类方法列表”；
补充：方法列表指的是所有的方法，包含本类和分类的方法；


#### 2、其他
##### 2.1、创建
详情见后面(六)，类的创建、给类添加实例变量、属性、方法
##### 2.2、获取
###### 2.2.1、常规
###### 2.2.2、获取实例方法
`class_getInstanceMethod`
###### 2.2.1、获取类方法
`class_getClassMethod`
##### 2.3、设置SEL和IMP的映射关系
`method_setImplementation`
##### 2.4、添加方法  
`class_addMethod`
##### 2.5、获取方法列表
`class_copyMethodList`
##### 2.6、代码
```objective-c
	//方法一、获取相应的方法Method，直接交换两个方法的实现
    Person *person = [[Person alloc] init];
    
    [person run];  //打印：人可以跑
    [person eat];  //打印：人可以吃饭
    
    Method runM = class_getInstanceMethod([person class], @selector(run));  //SEL类型的快捷方法：@selector(方法名称)
    Method eatM = class_getInstanceMethod([person class], @selector(eat));  //SEL类型的快捷方法：@selector(方法名称)
    
    method_exchangeImplementations(runM, eatM); //交换方法的实现
    
    [person run];  //打印：人可以吃饭
    [person eat];  //打印：人可以跑

#pragma mark --分割线---

	//方法二、获取相应的方法Method和实现IMP，设置方法的实现IMP
    Person *person = [[Person alloc] init];
    
    [person run];  //打印：人可以跑
    [person eat];  //打印：人可以吃饭
    
    Method runM = class_getInstanceMethod([person class], @selector(run));  //SEL类型的快捷方法：@selector(方法名称)
    Method eatM = class_getInstanceMethod([person class], @selector(eat));  //SEL类型的快捷方法：@selector(方法名称)
    
    IMP rumIMP = method_getImplementation(runM);
    IMP eatIMP = method_getImplementation(eatM);
    
    method_setImplementation(runM, eatIMP);
    method_setImplementation(eatM, rumIMP);
    
    [person run]; //打印：人可以吃饭
    [person eat]; //打印：人可以跑

```
可以看到，通过方法`method_exchangeImplementations`和`method_setImplementation`可以对方法的实现进行交换，即改变SEL和IMP的映射关系；
补充：
类方法用“class_getClassMethod”获取，实例方法用“class_getInstanceMethod”获取，如果方法错误的话获取不到方法
### (六)、类的创建、给类添加实例变量、属性、方法
#### 1、使用步骤
1.1、`objc_allocateClassPair`
1.2、`class_addIvar` 、 `class_addProperty` 、 `class_addMethod` 、 `class_addProtocol`
1.3、`objc_registerClassPair`
#### 2、代码
```objective-c
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

```

### 三、应用
#### 1、归档存储对象，解档读取对象
#### 2、给分类添加属性
#### 3、字典转模型
#### 4、方法交换，Swizzle
#### 5、给UINavigationController添加滑动手势
#### 6、跳转控制器

应用可参考文章：
[OC最实用的runtime总结，面试、工作你看我就足够了！](http://www.jianshu.com/p/ab966e8a82e2 "OC最实用的runtime总结，面试、工作你看我就足够了！")
[iOS 万能跳转界面方法 (runtime实用篇一)](http://www.jianshu.com/p/8b3a9155468d "iOS 万能跳转界面方法 (runtime实用篇一)")

最后[链接](https://github.com/oceanfive/RuntimeVC "链接")！



