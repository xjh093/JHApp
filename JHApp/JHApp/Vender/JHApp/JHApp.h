//
//  JHApp.h
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "JHAppSize.h"
#import "JHAppFont.h"
#import "JHAppColor.h"
#import "JHAppDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHApp : NSObject

+ (instancetype)app;

#pragma mark --- 尺寸
@property (nonatomic,  strong) JHAppSize *size;

@end

NS_ASSUME_NONNULL_END


#pragma mark --- 数值转化，避免虚化
/// 数值转化，避免虚化
NS_INLINE CGFloat jh_standardizeNumber(CGFloat number)
{
    static CGFloat scale;
    scale = [UIScreen mainScreen].scale;
    
    if (number == 0 || number == CGFLOAT_MAX || number == -CGFLOAT_MAX) {
        return number;
    }
    
    /*
     因为设备点转化为像素时，如果偏移了半个像素点就有可能会产生虚化的效果，因此这里要将设备点先转化为像素点，
     然后再添加 0.5 个偏移取整后再除以倍数则是转化为有效的设备逻辑点。
     */
    
#if CGFLOAT_IS_DOUBLE == 1
    if (number < 0) {
        return ceil(fma(number, scale, -0.5)) / scale;
    }else{
        return floor(fma(number, scale, 0.5)) / scale;
    }
#else
    if (number < 0) {
        return ceilf(fmaf(number, scale, -0.5f)) / scale;
    }else{
        return floorf(fmaf(number, scale, 0.5f)) / scale;
    }
#endif
}

#pragma mark --- 根据 iPhone 6 的尺寸来调整数值
/// 根据 iPhone 6 的尺寸来调整数值
NS_INLINE float jh_numberFit(float iPhone6Value)
{
    CGFloat number = iPhone6Value * [[UIScreen mainScreen] bounds].size.width / 375.0f;
    return jh_standardizeNumber(number);
}

#pragma mark --- 对象是否为空
/// 对象是否为空
NS_INLINE bool jh_objectIsEmpty(id _Nullable obj) {
    return obj == nil || [obj isKindOfClass:[NSNull class]];
}
