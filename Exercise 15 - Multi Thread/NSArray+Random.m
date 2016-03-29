//
//  NSArray+Random.m
//  Exercise 15 - Multi Thread
//
//  Created by Pham Anh on 3/29/16.
//  Copyright © 2016 com.gaxxanh. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

-(id)randomObject {
    NSUInteger myCount = [self count];
    if (myCount)
        return [self objectAtIndex:arc4random_uniform(myCount)];
    else
        return nil;
}

@end
