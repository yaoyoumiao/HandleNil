//
//  NSMutableArray+NeoMutableArray.m
//  neoShare
//
//  Created by baitian on 2017/1/16.
//  Copyright © 2017年 Appress. All rights reserved.
//

#import "NSMutableArray+NeoMutableArray.h"
#import <objc/runtime.h>

@implementation NSMutableArray (NeoMutableArray)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method orginalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
        Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(neo_addObject:));
        method_exchangeImplementations(orginalMethod,newMethod);
        
        Method orginalMethod1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
        Method newMethod1 = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(neo_objectAtIndex:));
        method_exchangeImplementations(orginalMethod1,newMethod1);
        
    });
}

- (void)neo_addObject:(id)obj
{
    if(obj) {
        [self neo_addObject:obj];
    } else {
        NSLog(@"\n=====================================\n \n warning : nil被添加到数组 obj == %@ \n \n=====================================", obj);
    }
}

- (id)neo_objectAtIndex:(NSUInteger)index
{
    if(index < self.count) {
        return [self neo_objectAtIndex:index];
    }
    return nil;
}

@end
