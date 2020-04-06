#import "ViewController.h"



@interface ViewController() <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *labelResultColor;
@property (nonatomic, strong) UILabel *labelRed;
@property (nonatomic, strong) UILabel *labelGreen;
@property (nonatomic, strong) UILabel *labelBlue;
@property (nonatomic, strong) UIView *viewResultColor;

@property (nonatomic, strong) UITextField *textFieldRed;
@property (nonatomic, strong) UITextField *textFieldGreen;
@property (nonatomic, strong) UITextField *textFieldBlue;

@property (nonatomic, strong) UIButton *buttonProcess;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;



@end


@implementation ViewController

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

- (void)setupUI {
    [self setupViewsAndLabels];
    [self setupTextFields];
    [self setupButtons];
    
}

- (void)setupViewsAndLabels {
    self.view.accessibilityIdentifier = @"mainView";
    
    CGRect frame1 = CGRectMake(15, 100, 100, 40);
    self.labelResultColor = [[UILabel alloc]initWithFrame:frame1];
    self.labelResultColor.text = @"Color";
    self.labelResultColor.accessibilityIdentifier = @"labelResultColor";
    [self.view addSubview:self.labelResultColor];
    
    CGRect frame2 = CGRectMake(15, 160, 85, 40);
    self.labelRed = [[UILabel alloc]initWithFrame:frame2];
    self.labelRed.text = @"RED";
    self.labelRed.accessibilityIdentifier = @"labelRed";
    [self.view addSubview:self.labelRed];
    
    CGRect frame3 = CGRectMake(15, 220, 85, 40);
    self.labelGreen = [[UILabel alloc]initWithFrame:frame3];
    self.labelGreen.text = @"GREEN";
    self.labelGreen.accessibilityIdentifier = @"labelGreen";
    [self.view addSubview:self.labelGreen];
    
    CGRect frame4 = CGRectMake(15, 280, 85, 40);
    self.labelBlue = [[UILabel alloc]initWithFrame:frame4];
    self.labelBlue.text = @"BLUE";
    self.labelBlue.accessibilityIdentifier = @"labelBlue";
    [self.view addSubview: self.labelBlue];
    
    CGRect viewFrame = CGRectMake(120, 100, 230, 40);
    self.viewResultColor = [[UIView alloc]initWithFrame:viewFrame];
    self.viewResultColor.backgroundColor = UIColor.grayColor;
    self.viewResultColor.accessibilityIdentifier = @"viewResultColor";
    [self.view addSubview: self.viewResultColor];
}

- (void)setupTextFields {
    CGRect textFieldRedFrame = CGRectMake(100, 160, 250, 40);
    self.textFieldRed = [[UITextField alloc]initWithFrame:textFieldRedFrame];
    self.textFieldRed.placeholder = @"0..255";
    self.textFieldRed.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldRed.accessibilityIdentifier = @"textFieldRed";
    
    [self.view addSubview: self.textFieldRed];
    
    CGRect textFieldGreenFrame = CGRectMake(100, 220, 250, 40);
    self.textFieldGreen = [[UITextField alloc]initWithFrame:textFieldGreenFrame];
    self.textFieldGreen.placeholder = @"0..255";
    self.textFieldGreen.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldGreen.accessibilityIdentifier = @"textFieldGreen";
    [self.view addSubview: self.textFieldGreen];
    
    CGRect textFieldBlueFrame = CGRectMake(100, 280, 250, 40);
    self.textFieldBlue = [[UITextField alloc]initWithFrame:textFieldBlueFrame];
    self.textFieldBlue.placeholder = @"0..255";
    self.textFieldBlue.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldBlue.accessibilityIdentifier = @"textFieldBlue";
    [self.view addSubview: self.textFieldBlue];
    
    [self configureTextFields];
}


- (void)configureTextFields {
    self.textFieldRed.delegate = self;
    self.textFieldGreen.delegate = self;
    self.textFieldBlue.delegate = self;
    
    //    [self.textFieldRed allowsEditingTextAttributes];
    //    [self.textFieldGreen allowsEditingTextAttributes];
    //    [self.textFieldBlue allowsEditingTextAttributes];
    //    self.textFieldRed.keyboardType = UIKeyboardTypeNumberPad;
    //    self.textFieldGreen.keyboardType = UIKeyboardTypeNumberPad;
    //    self.textFieldBlue.keyboardType = UIKeyboardTypeNumberPad;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    //    NSMutableCharacterSet *inputSet = [[NSMutableCharacterSet alloc]init];
//
//    NSString *allowedCharacters = @"1234567890";
//    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString: allowedCharacters] invertedSet];
//    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//
//    if ([string isEqualToString:filtered]) {
//        return true;
//    }
//    return false;
//}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.labelResultColor.text = @"Color";
    return true;
}

//- (BOOL)textFieldShouldClear:(UITextField *)textField {
//    return true;
//}

- (void)setupButtons {
    CGRect buttonFrame = CGRectMake(self.view.bounds.size.width /2 - 50, 350, 100, 50);
    self.buttonProcess = [[UIButton alloc]initWithFrame:buttonFrame];
    [self.buttonProcess setTitle:@"Process" forState:UIControlStateNormal];
    [self.buttonProcess setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    self.buttonProcess.accessibilityIdentifier = @"buttonProcess";
    [self.view addSubview: self.buttonProcess];
    [self.buttonProcess addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

//(NSString *)hexStringFromColor:(UIColor *)color { const CGFloat *components = CGColorGetComponents(color.CGColor);
//CGFloat r = components[0]; CGFloat g = components[1]; CGFloat b = components[2];
//
//return [NSString stringWithFormat:@"#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)]; }


- (BOOL)checkErrorItems:(NSString *)string {
    NSString *allowedCharacters = @"1234567890";
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString: allowedCharacters] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    if ([string isEqualToString:filtered]) {
        return true;
    }
    return false;
}

- (void)buttonAction {
    
    if (![self.textFieldRed.text isEqualToString:@""] && ![self.textFieldRed.text isEqualToString:@""] && ![self.textFieldRed.text isEqualToString:@""] ) {
        //        if (self.textFieldRed.text == nil && self.textFieldGreen.text == nil && self.textFieldBlue.text == nil) {
        //              self.labelResultColor.text = @"Error";
        //          }
        
        NSString *redColor = self.textFieldRed.text;
        NSString *greenColor = self.textFieldGreen.text;
        NSString *blueColor = self.textFieldBlue.text;
        
//            for (int i=0; i<requestURL.length; i++) {
//                NSString *element = [requestURL substringWithRange:NSMakeRange(i, 1)];
//                if ([element isEqualToString:@"3"]) {
//                    NSLog(@"element %@ if find!", element);
//                }
//            }
        if ([self checkErrorItems:redColor] && [self checkErrorItems:greenColor] && [self checkErrorItems:blueColor]) {
            
//        }
        if ((redColor.intValue >0 && redColor.intValue <=255) &&
            (greenColor.intValue >0 && greenColor.intValue <=255) &&
            (blueColor.intValue >0 && blueColor.intValue <=255)) {
        
            
//            if (redColor.integerValue && greenColor.integerValue && blueColor.integerValue) {
            UIColor *resultColor = [UIColor colorWithRed:(redColor.floatValue/255) green:(greenColor.floatValue)/255 blue:(blueColor.floatValue)/255 alpha:1];
                
                self.viewResultColor.backgroundColor = resultColor;
                self.labelResultColor.text = [self hexStringForColor:resultColor];
        } else {
            self.labelResultColor.text = @"Error";
        }
        } else {
            self.labelResultColor.text = @"Error";
        }
        
    } else {
        self.labelResultColor.text = @"Error";
    }
    [self.view endEditing:YES];
    self.textFieldBlue.text = nil;
    self.textFieldGreen.text = nil;
    self.textFieldRed.text = nil;
}

- (NSString *)hexStringForColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    NSString *hexString=[NSString stringWithFormat:@"0x%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255)];
    return hexString;
}

@end
