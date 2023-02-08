//
//  JHAppColor.h
//  JHApp
//
//  Created by HaoCold on 2023/2/6.
//

#ifndef JHAppColor_h
#define JHAppColor_h

// 16 进制颜色
#define kUIColorFromHex(hex) \
[UIColor colorWithRed:((hex & 0xFF0000) >> 16)/255.0 green:((hex & 0xFF00) >> 8)/255.0 blue:(hex & 0xFF)/255.0 alpha:1.0]
#define kUIColorFromHex2(hex,a) \
[UIColor colorWithRed:((hex & 0xFF0000) >> 16)/255.0 green:((hex & 0xFF00) >> 8)/255.0 blue:(hex & 0xFF)/255.0 alpha:a]

// RGB
#define kUIColorFromRGB(r,g,b)    UIColorFromRGBA(r, g, b, 1.0)
#define kUIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// 随机颜色
#define kUIColorRandom [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1]

// 主题色，自行修改
#define kThemeColor         [UIColor systemRedColor]

// 常用黑色
#define kMainTextColor      kUIColorFromHex(0x333333)
#define kSubTextColor       kUIColorFromHex(0x666666)
#define kDetailTextColor    kUIColorFromHex(0x999999)

// 其他颜色



#endif /* JHAppColor_h */
