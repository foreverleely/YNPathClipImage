//
//  UIImage+YNPathClip.h
//
//
//  Created by liyangly on 2018/10/19.
//  Copyright © 2018 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YNPathClip)

/**
  even-odd clip for image

 @param addlineBlock current context, image width, image height
 @return cliped image
 */
- (UIImage *)pathClipWithAddLineBlock:(void(^)(CGContextRef ctxRef, CGFloat imgWidth, CGFloat imgHeight))addlineBlock;

@end

NS_ASSUME_NONNULL_END
