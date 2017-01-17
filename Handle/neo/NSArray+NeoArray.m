//
//  NSArray+NeoArray.m
//  neoShare
//
//  Created by baitian on 2017/1/16.
//  Copyright © 2017年 Appress. All rights reserved.
//

#import "NSArray+NeoArray.h"
#import <objc/runtime.h>

@implementation NSArray (NeoArray)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originalSelector = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
        Method swizzledSelector = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(neo_objectAtIndex:));
        method_exchangeImplementations(originalSelector, swizzledSelector);
        
    });
}

- (id)neo_objectAtIndex:(NSUInteger)index
{
    if(index < self.count) {
        return [self neo_objectAtIndex:index];
    }
    return nil;
}

@end
