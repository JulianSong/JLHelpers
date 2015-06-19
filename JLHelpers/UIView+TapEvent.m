//
//  UIView+UIView_TapEvent.m
//
//  Created by Julian on 13-9-11.
//

#import "UIView+TapEvent.h"
#import <objc/runtime.h>
@implementation UIView (TapEvent)
-(void)handleTapEventBlock:(void (^)(UIView *))block
{
    objc_setAssociatedObject (self,@"handleTapEventBlock",[block copy],OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    
    tap.numberOfTapsRequired = 2; // tap
    
    [self addGestureRecognizer:tap];
}

-(void)singleTap:(UITapGestureRecognizer *) tap
{
    void (^handleTapEventBlock)(UIView *theView) = objc_getAssociatedObject(self,@"handleTapEventBlock");
    handleTapEventBlock(self);
}
@end
