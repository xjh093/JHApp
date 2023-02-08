//
//  JHAppDefine.h
//  JHApp
//
//  Created by HaoCold on 2023/2/6.
//

#ifndef JHAppDefine_h
#define JHAppDefine_h

// 日志打印
#if DEBUG
#define kJHLog(...) NSLog(__VA_ARGS__)
#else
#define kJHLog(...)
#endif

// Weak & Strong
#define kWeakSelf    __weak typeof(self) weakSelf = self;
#define kStrongSelf  __strong typeof(weakSelf) strongSelf = weakSelf;

// 类空实现
#define kClassIMP(class) \
@implementation class \
@end

// 把一个数字变成字符串
#define kNumToString(n) @#n

// 字符串格式化
#define kStringForamt(format, string) \
({ \
    NSString *s = [NSString stringWithFormat:format, string?:@""]; \
    if ([s isEqualToString:@"<null>"] || [s isEqualToString:@"(null)"]) { \
        s = @""; \
    } \
    s; \
})

// 屏幕宽度
#define kScreenWidth  [JHApp app].size.width
// 屏幕高度
#define kScreenHeight  [JHApp app].size.height
// 1个像素
#define k1Pixel  [JHApp app].size.onePixel
// 状态栏高度
#define kStatusBarHeight  [JHApp app].size.statusBarHeight
// 导航栏高度(包含状态栏)
#define kTopBarHeight  [JHApp app].size.topBarHeight
// 底部安全区域高度
#define kBottomSafeAreaHeight  [JHApp app].size.bottomSafeAreaHeight
// tabbar 高度
#define kTabbarHeight  [JHApp app].size.tabbarHeight
// 是否是全屏系列
#define kFullScreen  [JHApp app].size.isFullScreen


#endif /* JHAppDefine_h */
