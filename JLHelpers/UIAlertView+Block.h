//
//  UIAlertView+Block.h
//
//  Created by julian on 14-5-4.
//

#import <UIKit/UIKit.h>
typedef void(^AlertBlock)(NSInteger buttonIndex);
@interface UIAlertView (Block)<UIAlertViewDelegate>
@property(nonatomic)AlertBlock block;
-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
             block:(AlertBlock)block
 cancelButtonTitle:(NSString *)cancelButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ...;
@end
