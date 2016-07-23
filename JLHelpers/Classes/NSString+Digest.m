//
//  NSString+Digest.m
//
//  Created by julian on 14-1-7.
//

#import "NSString+Digest.h"
#import <CommonCrypto/CommonDigest.h>

#define CC_MD5_DIGEST_LENGTH 16   /* digest length in bytes */
@implementation NSString (Digest)
- (NSString *)MD5String
{
    const char *src = [self  UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(src, (CC_LONG)strlen(src), result);
    NSString * ret = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]];
    return [ret lowercaseString];
}
@end
