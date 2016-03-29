//
//  BasicBlockViewController.m
//  Exercise 15 - Multi Thread
//
//  Created by Pham Anh on 3/29/16.
//  Copyright © 2016 com.gaxxanh. All rights reserved.
//

#import "BasicBlockViewController.h"

typedef void(^myBlock)(NSArray *);
myBlock printArrayString = ^(NSArray *arrayString){
    for (NSString *item in arrayString) {
        NSLog(@"%@", item);
    }
};

typedef void(^newBlock)(NSDictionary *);
newBlock printDictionary = ^(NSDictionary *dictObj){
    for (NSString *key in [dictObj allKeys]){
        NSLog(@"Key: %@ - Value: %@", key, dictObj[key]);
    }
};

typedef void(^DownloadSuccessBlock)(id result);
typedef void(^DownloadFailureBlock)(NSError *error);

@implementation BasicBlockViewController

#pragma mark - View Life Cycle

- (void) viewDidLoad;
{
    // Give NSArray of NSString items. Use block to print to debug screen
    NSArray *array = [NSArray arrayWithObjects:@"Lan", @"Phuong", @"Thuy", @"Anh", nil];
    printArrayString(array);
    
    
}

@end
