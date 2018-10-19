//
//  UIImage+YNPathClip.m
//  
//
//  Created by liyangly on 2018/10/19.
//  Copyright © 2018 liyang. All rights reserved.
//

#import "UIImage+YNPathClip.h"

@implementation UIImage (YNPathClip)

- (UIImage *)pathClipWithAddLineBlock:(void(^)(CGContextRef ctxRef, CGFloat imgWidth, CGFloat imgHeight))addlineBlock {
    
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    // begin
    UIGraphicsBeginImageContext(self.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    
    // add line
//    CGContextMoveToPoint(gc, 0, 0);
//    CGContextAddLineToPoint(gc, width, 0);
//    CGContextAddLineToPoint(gc, width, height*2/3);
//    CGContextAddLineToPoint(gc, 0, height*5/6);
//    CGContextClosePath(gc);
    addlineBlock(gc, width, height);
    // clip, even-odd fill
    CGContextAddRect(gc, CGContextGetClipBoundingBox(gc));
    CGContextEOClip(gc);
    
    // translate coordinate system
    CGContextTranslateCTM(gc, 0, height);
    CGContextScaleCTM(gc, 1, -1);
    CGContextDrawImage(gc, CGRectMake(0, 0, width, height), [self CGImage]);
    
    // get image
    UIImage *destImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // end
    UIGraphicsEndImageContext();
    
    return destImg;
}

@end
