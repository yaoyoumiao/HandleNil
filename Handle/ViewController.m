//
//  ViewController.m
//  Handle
//
//  Created by baitian on 2017/1/17.
//  Copyright © 2017年 ZTE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array1 = @[@"1", @"2", @"3", @"4"];
    NSString *result1 = [array1 objectAtIndex:5];
    NSLog(@"result1 = %@", result1);
    
    NSMutableArray *array2 = [NSMutableArray new];
    [array2 addObject:@"1"];
    [array2 addObject:nil];
    NSLog(@"array2 = %@", array2);
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:nil forKey:@"1"];
    NSLog(@"dict = %@", dict);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
