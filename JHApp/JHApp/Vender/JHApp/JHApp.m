//
//  JHApp.m
//  JHApp
//
//  Created by HaoCold on 2023/2/3.
//

#import "JHApp.h"

@implementation JHApp

+ (instancetype)app
{
    static JHApp *app;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app = [[JHApp alloc] init];
    });
    return app;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size = [[JHAppSize alloc] init];
    }
    return self;
}

@end
