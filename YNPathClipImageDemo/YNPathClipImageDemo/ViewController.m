//
//  ViewController.m
//  YNPathClipImageDemo
//
//  Created by liyangly on 2018/10/19.
//  Copyright © 2018 liyang. All rights reserved.
//

#import "ViewController.h"
// category
#import "UIImage+YNPathClip.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self orignViewTest];
    [self pathClipViewTest];
}

- (void)orignViewTest {
    
    UIImage *image = [UIImage imageNamed:@"banner_picture0"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.frame = CGRectMake(169, 100, 169, 193);
    [self.view addSubview:imgView];
    
    UIImageView *imgView2 = [[UIImageView alloc] initWithImage:image];
    imgView2.frame = CGRectMake(169, 100 + 193, 169, 193);
    [self.view addSubview:imgView2];
    
    UIImageView *imgView3 = [[UIImageView alloc] initWithImage:image];
    imgView3.frame = CGRectMake(169, 100 + 193*2, 169, 193);
    [self.view addSubview:imgView3];
}

- (void)pathClipViewTest {
    
    UIImage *originImg = [UIImage imageNamed:@"banner_picture0"];
    
    UIImage *image = [originImg pathClipWithAddLineBlock:^(CGContextRef  _Nonnull ctxRef, CGFloat imgWidth, CGFloat imgHeight) {
        CGContextMoveToPoint(ctxRef, imgWidth, imgHeight/6);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight/3);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight);
        CGContextAddLineToPoint(ctxRef, imgWidth, imgHeight);
        CGContextClosePath(ctxRef);
    }];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.frame = CGRectMake(0, 100, 169, 193);
    [self.view addSubview:imgView];
    
    UIImage *image2 = [originImg pathClipWithAddLineBlock:^(CGContextRef  _Nonnull ctxRef, CGFloat imgWidth, CGFloat imgHeight) {
        CGContextMoveToPoint(ctxRef, imgWidth, 0);
        CGContextAddLineToPoint(ctxRef, imgWidth, imgHeight/6);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight/3);
        CGContextAddLineToPoint(ctxRef, 0, 0);
        CGContextClosePath(ctxRef);
        CGContextMoveToPoint(ctxRef, imgWidth, imgHeight*2/3);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight*5/6);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight);
        CGContextAddLineToPoint(ctxRef, imgWidth, imgHeight);
        CGContextClosePath(ctxRef);
    }];
    
    UIImageView *imgView2 = [[UIImageView alloc] initWithImage:image2];
    imgView2.frame = CGRectMake(0, 100 + 193, 169, 193);
    [self.view addSubview:imgView2];
    
    UIImage *image3 = [originImg pathClipWithAddLineBlock:^(CGContextRef  _Nonnull ctxRef, CGFloat imgWidth, CGFloat imgHeight) {
        CGContextMoveToPoint(ctxRef, 0, 0);
        CGContextAddLineToPoint(ctxRef, imgWidth, 0);
        CGContextAddLineToPoint(ctxRef, imgWidth, imgHeight*2/3);
        CGContextAddLineToPoint(ctxRef, 0, imgHeight*5/6);
        CGContextClosePath(ctxRef);
    }];
    
    UIImageView *imgView3 = [[UIImageView alloc] initWithImage:image3];
    imgView3.frame = CGRectMake(0, 100 + 193*2, 169, 193);
    [self.view addSubview:imgView3];
}


@end
