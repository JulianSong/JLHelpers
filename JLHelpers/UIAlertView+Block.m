//
//  UIAlertView+Block.m
//
//  Created by julian on 14-5-4.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>
@implementation UIAlertView (Block)
@dynamic block;
-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
             block:(AlertBlock)block
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ...{
    if((self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles,nil])){
        [self setDelegate:self];
        self.block = block;
    }
    return self;
}
- (void)setBlock:(AlertBlock)block
{
    objc_setAssociatedObject(self, @"block_property_key",block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (AlertBlock)block;
{
    return objc_getAssociatedObject(self, @"block_property_key");
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.block(buttonIndex);
}
@end
