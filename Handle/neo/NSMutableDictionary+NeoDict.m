//
//  NSMutableDictionary+NeoDict.m
//  neoShare
//
//  Created by baitian on 2017/1/16.
//  Copyright © 2017年 Appress. All rights reserved.
//

#import "NSMutableDictionary+NeoDict.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (NeoDict)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
        Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(neo_addObject:forKey:));
        method_exchangeImplementations(orginalMethod, newMethod);
        
    });
}

- (void)neo_addObject:(id)obj forKey:(id)key
{
    if(obj) {
        [self neo_addObject:obj forKey:key];
    } else {
        NSLog(@"\n=====================================\n \n warning : nil被添加到字典 obj == %@ \n \n=====================================", obj);
    }
}

@end
