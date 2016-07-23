//
//  UIView+UIView_TapEvent.h
//
//  Created by Julian on 13-9-11.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_TapEvent)

-(void)handleTapEventBlock:( void (^) (UIView *view)) block;
@end
