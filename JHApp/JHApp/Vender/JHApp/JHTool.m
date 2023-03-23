//
//  JHTool.m
//  JHApp
//
//  Created by HaoCold on 2023/3/10.
//

#import "JHTool.h"

// --- deviceType ---
#import <sys/sysctl.h>
#import <sys/utsname.h>
// ---

// --- macAddress ---
//#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
// ---

// --- ipAdress --
#import <ifaddrs.h>
#import <netinet/ip.h>
#import <arpa/inet.h>
// ---

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"

@implementation JHTool

+ (NSString *)deviceType
{
    static NSString *device;
    if (device.length) {
        return device;
    }
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    
    struct utsname systemInfo;
    uname(&systemInfo);
    platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    NSDictionary *typeToName = @{
        @"iPhone3,1": @"iPhone 4",
        @"iPhone3,2": @"iPhone 4",
        @"iPhone3,3": @"iPhone 4",
        @"iPhone4,1": @"iPhone 4S",
        @"iPhone5,1": @"iPhone 5",
        @"iPhone5,2": @"iPhone 5",
        @"iPhone5,3": @"iPhone 5c",
        @"iPhone5,4": @"iPhone 5c",
        @"iPhone6,1": @"iPhone 5s",
        @"iPhone6,2": @"iPhone 5s",
        @"iPhone7,1": @"iPhone 6 Plus",
        @"iPhone7,2": @"iPhone 6",
        @"iPhone8,1": @"iPhone 6s",
        @"iPhone8,2": @"iPhone 6s Plus",
        @"iPhone8,4": @"iPhone SE",
        @"iPhone9,1": @"iPhone 7",
        @"iPhone9,2": @"iPhone 7 Plus",
        @"iPhone9,3": @"iPhone 7",
        @"iPhone9,4": @"iPhone 7 Plus",
        @"iPhone10,1": @"iPhone 8",
        @"iPhone10,2": @"iPhone 8 Plus",
        @"iPhone10,4": @"iPhone 8",
        @"iPhone10,5": @"iPhone 8 Plus",
        @"iPhone10,3": @"iPhone X",
        @"iPhone10,6": @"iPhone X",
        @"iPhone11,2": @"iPhone XS",
        @"iPhone11,4": @"iPhone XS Max",
        @"iPhone11,6": @"iPhone XS Max",
        @"iPhone11,8": @"iPhone XR",
        @"iPhone12,1": @"iPhone 11",
        @"iPhone12,3": @"iPhone 11 Pro",
        @"iPhone12,5": @"iPhone 11 Pro Max",
        @"iPhone12,8": @"iPhone SE 2",
        @"iPhone13,1": @"iPhone 12 mini",
        @"iPhone13,2": @"iPhone 12",
        @"iPhone13,3": @"iPhone 12 Pro",
        @"iPhone13,4": @"iPhone 12 Pro Max",
        @"iPhone14,4": @"iPhone 13 mini",
        @"iPhone14,5": @"iPhone 13",
        @"iPhone14,2": @"iPhone 13 Pro",
        @"iPhone14,3": @"iPhone 13 Pro Max",
        @"iPhone14,6": @"iPhone SE 3",
        @"iPhone14,7": @"iPhone 14",
        @"iPhone14,8": @"iPhone 14 Plus",
        @"iPhone15,2": @"iPhone 14 Pro",
        @"iPhone15,3": @"iPhone 14 Pro Max",
        @"i386": @"Simulator",
        @"x86_64": @"Simulator",
        @"iPod1,1": @"iPod Touch 1G",
        @"iPod2,1": @"iPod Touch 2G",
        @"iPod3,1": @"iPod Touch 3G",
        @"iPod4,1": @"iPod Touch 4G",
        @"iPod5,1": @"iPod Touch 5G",
        @"iPod7,1": @"iPod Touch 6G",
        @"iPod9,1": @"iPod Touch 7G",
        @"iPad1,1": @"iPad",
        @"iPad1,2": @"iPad 3G",
        @"iPad2,1": @"iPad 2",
        @"iPad2,2": @"iPad 2",
        @"iPad2,3": @"iPad 2",
        @"iPad2,4": @"iPad 2",
        @"iPad2,5": @"iPad Mini",
        @"iPad2,6": @"iPad Mini",
        @"iPad2,7": @"iPad Mini",
        @"iPad3,1": @"iPad 3",
        @"iPad3,2": @"iPad 3",
        @"iPad3,3": @"iPad 3",
        @"iPad3,4": @"iPad 4",
        @"iPad3,5": @"iPad 4",
        @"iPad3,6": @"iPad 4",
        @"iPad4,1": @"iPad Air",
        @"iPad4,2": @"iPad Air",
        @"iPad4,3": @"iPad Air",
        @"iPad4,4": @"iPad Mini 2",
        @"iPad4,5": @"iPad Mini 2",
        @"iPad4,6": @"iPad Mini 2",
        @"iPad4,7": @"iPad Mini 3",
        @"iPad4,8": @"iPad Mini 3",
        @"iPad4,9": @"iPad Mini 3",
        @"iPad5,1": @"iPad Mini 4",
        @"iPad5,2": @"iPad Mini 4",
        @"iPad5,3": @"iPad Air 2",
        @"iPad5,4": @"iPad Air 2",
        @"iPad6,3": @"iPad Pro 9.7",
        @"iPad6,4": @"iPad Pro 9.7",
        @"iPad6,7": @"iPad Pro 12.9",
        @"iPad6,8": @"iPad Pro 12.9",
        @"iPad6,11": @"iPad 5",
        @"iPad6,12": @"iPad 5",
        @"iPad7,1": @"iPad Pro 12.9 inch 2nd gen",
        @"iPad7,2": @"iPad Pro 12.9 inch 2nd gen",
        @"iPad7,3": @"iPad Pro 10.5 inch",
        @"iPad7,4": @"iPad Pro 10.5 inch",
        @"iPad7,5": @"iPad 6",
        @"iPad7,6": @"iPad 6",
        @"iPad7,11": @"iPad 7",
        @"iPad7,12": @"iPad 7",
        @"iPad8,1": @"iPad Pro 11-inch",
        @"iPad8,2": @"iPad Pro 11-inch",
        @"iPad8,3": @"iPad Pro 11-inch",
        @"iPad8,4": @"iPad Pro 11-inch",
        @"iPad8,5": @"iPad Pro 12.9-inch 3rd gen",
        @"iPad8,6": @"iPad Pro 12.9-inch 3rd gen",
        @"iPad8,7": @"iPad Pro 12.9-inch 3rd gen",
        @"iPad8,8": @"iPad Pro 12.9-inch 3rd gen",
        @"iPad8,9": @"iPad Pro 11-inch 2nd gen",
        @"iPad8,10": @"iPad Pro 11-inch 2nd gen",
        @"iPad8,11": @"iPad Pro 12.9-inch 4th gen",
        @"iPad8,12": @"iPad Pro 12.9-inch 4th gen",
        @"iPad11,1": @"iPad Mini 5",
        @"iPad11,2": @"iPad Mini 5",
        @"iPad11,3": @"iPad Air 3",
        @"iPad11,4": @"iPad Air 3",
        @"iPad11,6": @"iPad 8",
        @"iPad11,7": @"iPad 8",
        @"iPad13,1": @"iPad Air 4",
        @"iPad13,2": @"iPad Air 4",
        @"iPad12,1": @"iPad 9",
        @"iPad12,2": @"iPad 9",
        @"iPad14,1": @"iPad Mini 6",
        @"iPad14,2": @"iPad Mini 6",
        @"iPad13,4": @"iPad Pro 11-inch 3nd gen",
        @"iPad13,5": @"iPad Pro 11-inch 3nd gen",
        @"iPad13,6": @"iPad Pro 11-inch 3nd gen",
        @"iPad13,7": @"iPad Pro 11-inch 3nd gen",
        @"iPad13,8": @"iPad Pro 12.9-inch 5th gen",
        @"iPad13,9": @"iPad Pro 12.9-inch 5th gen",
        @"iPad13,10": @"iPad Pro 12.9-inch 5th gen",
        @"iPad13,11": @"iPad Pro 12.9-inch 5th gen",
        @"iPad13,16": @"iPad Air 5",
        @"iPad13,17": @"iPad Air 5",
        @"iPad13,18": @"iPad 10",
        @"iPad13,19": @"iPad 10",
        @"iPad14,3": @"iPad Pro 11-inch 4th gen",
        @"iPad14,4": @"iPad Pro 11-inch 4th gen",
        @"iPad14,5": @"iPad Pro 12.9-inch 6th gen",
        @"iPad14,6": @"iPad Pro 12.9-inch 6th gen"
    };
    
    NSString *name = typeToName[platform];
    if (name) {
        device = name;
    }else{
        device = platform;
    }

    return device;
}

+ (NSString *)macAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

+ (NSString *)ipAddress
{
    return [self getIPAddress:YES];
}

+ (NSString *)getIPAddress:(BOOL)ipv4
{
    NSArray *searchArray = ipv4 ?
    @[ IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6 ] :
    @[ IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4 ] ;
    
    
    NSDictionary *addresses = [self getIPAddresses];
    
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

@end
