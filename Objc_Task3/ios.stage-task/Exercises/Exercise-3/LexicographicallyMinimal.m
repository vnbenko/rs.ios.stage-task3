#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    
    while ([string1 length] && [string2 length]) {
        const char *s1 = [string1 UTF8String];
        const char *s2 = [string2 UTF8String];
        
        if (s1[0] <= s2[0]) {
            [result appendString: [string1 substringToIndex: 1]];
            string1 = [string1 substringFromIndex: 1];
        } else {
            [result appendString: [string2 substringToIndex: 1]];
            string2 = [string2 substringFromIndex: 1];
        }
    }
    
    if ([string1 length]) {
        [result appendString: string1];
    } else {
        [result appendString: string2];
    }
    
    return result;
}

@end
