//
//  JHTool.h
//  JHApp
//
//  Created by HaoCold on 2023/3/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHTool : NSObject

/// 设备名称（根据设备型号 -> 设备名称）
+ (NSString *)deviceType;

/// 获取 mac 地址
+ (NSString *)macAddress;

/// ip 地址
+ (NSString *)ipAddress;

@end

NS_ASSUME_NONNULL_END
