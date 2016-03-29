//
//  ImagesLoaderViewController.m
//  Exercise 15 - Multi Thread
//
//  Created by Pham Anh on 3/29/16.
//  Copyright © 2016 com.gaxxanh. All rights reserved.
//

#import "ImagesLoaderViewController.h"
#import "NSArray+Random.h"
#import "BasicGCDViewController.h"

@interface ImagesLoaderViewController ()

@property (weak, nonatomic) IBOutlet UILabel *clockLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property NSMutableArray *array;

@end

@implementation ImagesLoaderViewController

- (void) updateClockLabel;
{
    NSDateFormatter *clockFormat = [[NSDateFormatter alloc] init];
    [clockFormat setDateFormat:@"hh:mm:ss a"];
    self.clockLabel.text = [clockFormat stringFromDate:[NSDate date]];
    [self performSelector:@selector(updateClockLabel) withObject:self afterDelay:1.0];
}

- (void) updateImage;
{
    NSString *stringURL = [self.array randomObject];
    NSURL *url = [NSURL URLWithString:stringURL];
    [BasicGCDViewController downloadImageWithUrl:url success:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.image setImage:image];
        });
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    [self performSelector:@selector(updateImage) withObject:self afterDelay:5.0];
}

- (void) viewDidLoad;
{
    
    [self updateClockLabel];
    [self updateImage];
    self.array = [[NSMutableArray alloc] init];
    [self.array addObject:@"http://manila.coconuts.co/sites/manila.coconuts.co/files/field/image/mariaozawa01.jpg"];
    [self.array addObject:@"http://xmedia.nguoiduatin.vn/thumb_x500x/133/2014/4/8/maria-ozawa1.jpg"];
    [self.array addObject:@"http://xmedia.nguoiduatin.vn/thumb_x500x/133/2014/4/8/maria-ozawa.jpg"];
    [self.array addObject:@"http://xmedia.nguoiduatin.vn/thumb_x500x/133/2014/4/8/maria-ozawa3.jpg"];
    [self.array addObject:@"http://resizing.flixster.com/ZjP3xX3mGx1lKyXPh4LoiIcjpsA=/400x600/dkpu1ddg7pbsk.cloudfront.net/photo/12/71/37/12713768_ori.jpg"];
    
}

@end
