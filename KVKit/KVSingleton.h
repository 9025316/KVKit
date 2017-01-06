
//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//判断系统版本的宏
#define DEVICE_IOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0))
#define DEVICE_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0))
#define DEVICE_IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0))
#define DEVICE_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)&&\
([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0))
#define DEVICE_IOS10 [[UIDevice currentDevice].systemVersion floatValue] >= 10.0

/// 线程不安全
#define __PROPERTY_NO_COPY__(type, object)   @property(nonatomic, copy)type      object
#define __PROPERTY_NO_ASSIGN__(type, object) @property(nonatomic, assign)type    object

#define __PROPERTY_NO_STRONG__(type, object) @property(nonatomic,strong)type object
#define __PROPERTY_NO_WEAK__(type, object)   @property(nonatomic,weak)type   object

// 线程安全
#define __PROPERTY_AT_COPY__(type, object)   @property(atomic,copy)type      object
#define __PROPERTY_AT_ASSIGN__(type, object) @property(atomic,assign)type    object
#define __PROPERTY_AT_STRONG__(type, object) @property(atomic,strong)type    object
#define __PROPERTY_AT_WEAK__(type, object)   @property(atomic,weak)type   object

// 只读(线程不安全)
#define __PROPERTY_NO_COPY__READONLY__(type, object)   @property(nonatomic,copy,readonly)type   object
#define __PROPERTY_NO_ASSIGN__READONLY__(type, object) @property(nonatomic,assign,readonly)type object
#define __PROPERTY_NO_STRONG__READONLY__(type, object) @property(nonatomic,strong,readonly)type object
#define __PROPERTY_NO_WEAK__READONLY__(type, object)   @property(nonatomic,weak,readonly)type   object

// 只读(线程安全)
#define __PROPERTY_AT_COPY__READONLY__(type, object)   @property(atomic,copy,readonly)type      object
#define __PROPERTY_AT_ASSIGN__READONLY__(type, object) @property(atomic,assign,readonly)type    object
#define __PROPERTY_AT_STRONG__READONLY__(type, object) @property(atomic,strong,readonly)type    object
#define __PROPERTY_AT_WEAK__READONLY__(type, object)   @property(atomic,weak,readonly)type      object

#define __GET_APPDELEGGATE__(object) AppDelegate *object = (AppDelegate *)[UIApplication sharedApplication].delegate;

//NavBar高度
#define NavigationBar_HEIGHT 44
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ((IOS_VERSION<8 && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ((IOS_VERSION<8 && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#pragma mark -- 单例设计模式
// .h文件
#define KVSingletonH(name) + (instancetype)shared##name;

// .m文件
#define KVSingletonM(name) \
static id _instance; \
 \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
 \
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
 \
- (id)copyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}

//获取weakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

///GCD，获取一个全局队列
#define GCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

//主线程
#define GCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)

///延迟处理
#define GCDAfter(seconds, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( seconds * NSEC_PER_SEC)),dispatch_get_main_queue(), block)

//定时器停止
#define KESAFA_DELETE_TIMER(timer) { \
if (timer != nil) { \
[timer invalidate]; \
timer = nil; \
} \
}

// 判断字典是否包含某个key
#define DICKEY_ISCONTKEY__(NSDIC, OBJECT)     [[NSDIC allKeys] containsObject:OBJECT]

/**
 *  get the saved objects       获得存储的对象
 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

//1个像素的宽度
#define SINGLE_LINE_WIDTH (1.0f/[UIScreen mainScreen].scale)
//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//图片
#define ImageWithName(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//rgb颜色(十进制)
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//rgb颜色(十六进制)
#define UIColorFromHexValue(HexValue) [UIColor colorWithRed:((float)((HexValue & 0xFF0000) >> 16))/255.0 green:((float)((HexValue & 0xFF00) >> 8))/255.0 blue:((float)(HexValue & 0xFF))/255.0 alpha:1.0]
//将对象转换成弱引用类型，有block时使用
#define WeakObj(obj) __block __weak typeof(obj) weak_##obj = obj
//document目录
#define DOCUMENT NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject

//DEBUG模式下,打印日志(包括函数名、行号)
#ifdef DEBUG
# define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
# define DLog(...)
#endif
