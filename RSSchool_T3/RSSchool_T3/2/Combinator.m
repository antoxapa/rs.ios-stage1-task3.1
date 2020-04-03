#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    
    NSNumber *C = array.firstObject;
    NSNumber *n = array.lastObject;
    
    for (int m = 0; m < n.intValue; m++) {
        NSInteger factorialN = [self getFactorial:n.integerValue];
        NSInteger factorialM = [self getFactorial:m];
        NSInteger factorialNM = [self getFactorial:(n.integerValue - m)];
        
        NSInteger result = factorialN / (factorialM * factorialNM);
        
        if (C.integerValue == result) {
            return [NSNumber numberWithInt:m];
        }
    }
    return nil;
}

- (NSInteger) getFactorial:(NSInteger)n {
    if (n <= 1) {
        return 1;
    } else {
        return n * [self getFactorial:(n-1)];
    }
}

@end
