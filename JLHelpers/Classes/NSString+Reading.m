//
//  NSString+Reading.m
//
//  Created by imac-dev on 15/5/29.
//

#import "NSString+Reading.h"
#import <AVFoundation/AVFoundation.h>
@implementation NSString (Reading)
-(void)read
{
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:self]; //需要转换的文本
    utterance.rate =AVSpeechUtteranceMinimumSpeechRate;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.pitchMultiplier = 1;
    [av speakUtterance:utterance];
}
-(void)spelling
{
    
    AVSpeechSynthesizer *av = [[AVSpeechSynthesizer alloc]init];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                         options:NSStringEnumerationByComposedCharacterSequences
                      usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                          
                          AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc]initWithString:substring]; //需要转换的文本
                          utterance.rate =AVSpeechUtteranceMinimumSpeechRate;
                          utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
                          utterance.pitchMultiplier = 1.3;
                          [av speakUtterance:utterance];
    }];
    AVSpeechUtterance *allutterance = [[AVSpeechUtterance alloc]initWithString:self]; //需要转换的文本
    allutterance.rate =AVSpeechUtteranceMinimumSpeechRate;
    allutterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    allutterance.pitchMultiplier = 1.3;
    [av speakUtterance:allutterance];
}

-(NSString *)stringBySpelling
{
    __block NSString *string;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              if (substringRange.location == 0) {
                                  string = substring ;
                              }else{
                                  string=[string stringByAppendingFormat:@"-%@",substring];
                              }
                          }];
    return string;
}
@end
