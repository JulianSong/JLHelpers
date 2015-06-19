//
//  UIImage+ColorMake.m
//  WordNote
//
//  Created by imac-dev on 15/6/9.
//  Copyright (c) 2015年 com.jullian. All rights reserved.
//

#import "UIImage+ColorMake.h"

@implementation UIImage (ColorMake)
+(UIImage  *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0,size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
