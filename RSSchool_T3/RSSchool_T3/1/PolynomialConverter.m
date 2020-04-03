#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    
    if (numbers.count == 0) {
        return nil;
    }
    
    NSString *resultString = @"";
    
    unsigned long count = numbers.count;
    for (int i = 0; i < numbers.count; i++) {
        NSNumber *number = [numbers objectAtIndex:i];
        count --;
        if (i == 0) {
            if (number.intValue > 0) {
                if (number.intValue == 1) {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@"x"];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@"x^%lu",count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                } else {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@"%@x",number];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@"%@x^%lu",number,count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                }
            } else if (number.intValue < 0) {
                NSNumber *absoluteValue = [NSNumber numberWithDouble: fabs(number.doubleValue)];
                if (absoluteValue.intValue == 1) {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@"- x"];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@"- x^%lu",count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                    
                } else {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@"- %@x",absoluteValue];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@"- %@x^%lu",absoluteValue,count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                }
                
            } else if (number.intValue == 0){
                
            }
        } else if (i == numbers.count -2) {
            if (number.intValue > 0) {
                if (number.intValue == 1) {
                    NSString *addedString = [NSString stringWithFormat:@" + x"];
                    resultString = [resultString stringByAppendingString:addedString];
                } else {
                    NSString *addedString = [NSString stringWithFormat:@" + %@x",number];
                    resultString = [resultString stringByAppendingString:addedString];
                }
                
            } else if (number.intValue < 0) {
                NSNumber *absoluteValue = [NSNumber numberWithDouble: fabs(number.doubleValue)];
                if (absoluteValue.intValue == 1) {
                    NSString *addedString = [NSString stringWithFormat:@" - x"];
                    resultString = [resultString stringByAppendingString:addedString];
                } else {
                    NSString *addedString = [NSString stringWithFormat:@" - %@x",absoluteValue];
                    resultString = [resultString stringByAppendingString:addedString];
                }
                
            } else if (number.intValue == 0){
                
            }
        } else if (i == numbers.count -1) {
            if (number.intValue > 0) {
                NSString *addedString = [NSString stringWithFormat:@" + %@",number];
                resultString = [resultString stringByAppendingString:addedString];
            } else if (number.intValue < 0) {
                NSNumber *absoluteValue = [NSNumber numberWithDouble: fabs(number.doubleValue)];
                NSString *addedString = [NSString stringWithFormat:@" - %@",absoluteValue];
                resultString = [resultString stringByAppendingString:addedString];
            } else if (number.intValue == 0){
                
            }
        } else {
            if (number.intValue > 0) {
                if (number.intValue == 1) {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@" + x"];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@" + x^%lu",count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                    
                } else {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@" + %@x",number];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@" + %@x^%lu",number,count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                }
            } else if (number.intValue < 0) {
                NSNumber *absoluteValue = [NSNumber numberWithDouble: fabs(number.doubleValue)];
                if (absoluteValue.intValue == 1) {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@" - x"];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@" - x^%lu",count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                    
                } else {
                    if (count == 1) {
                        NSString *addedString = [NSString stringWithFormat:@" - %@x",absoluteValue];
                        resultString = [resultString stringByAppendingString:addedString];
                    } else {
                        NSString *addedString = [NSString stringWithFormat:@" - %@x^%lu",absoluteValue,count];
                        resultString = [resultString stringByAppendingString:addedString];
                    }
                }
                
            } else if (number.intValue == 0){
                
            }
        }
        
    }
 
    return resultString;
}
@end
