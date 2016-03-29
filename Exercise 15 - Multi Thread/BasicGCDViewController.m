//
//  BasicGCDViewController.m
//  Exercise 15 - Multi Thread
//
//  Created by Pham Anh on 3/29/16.
//  Copyright © 2016 com.gaxxanh. All rights reserved.
//

#import "BasicGCDViewController.h"



@interface BasicGCDViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation BasicGCDViewController

- (void) viewDidLoad;
{
    NSString *stringURL = @"http://www.myfountainonline.com/wp-content/uploads/2013/12/phoenix-bird-1440x900.jpg";
    NSURL *url = [NSURL URLWithString:stringURL];
    [BasicGCDViewController downloadImageWithUrl:url success:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.image setImage:image];
        });
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

+ (void) downloadImageWithUrl:(NSURL*)url success:(DownloadSuccessBlock)success failure:(DownloadFailureBlock)failure;
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *sessionTask = [session dataTaskWithRequest:[NSURLRequest requestWithURL:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            UIImage *image = [UIImage imageWithData:data];
            success(image);
        } else {
            failure(error);
        }
    }];
    [sessionTask resume];
}

@end
