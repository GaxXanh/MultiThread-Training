//
//  BasicGCDViewController.h
//  Exercise 15 - Multi Thread
//
//  Created by Pham Anh on 3/29/16.
//  Copyright © 2016 com.gaxxanh. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef void(^DownloadSuccessBlock)(UIImage *image);
typedef void(^DownloadFailureBlock)(NSError *error);

@interface BasicGCDViewController : UIViewController

+ (void) downloadImageWithUrl:(NSURL*)url success:(DownloadSuccessBlock)success failure:(DownloadFailureBlock)failure;

@end
