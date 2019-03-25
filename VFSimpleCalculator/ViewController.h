//
//  ViewController.h
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 19/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *calculateDisplay;
@property (strong, nonatomic) IBOutlet UILabel *currentNumberDisplay;

- (void) processDigit: (NSInteger) digit;
- (void) processOp: (char) theOp;
- (void) storePart;
//Implicit conversion of 'NSInteger' (aka 'long') to 'VFCalculator * _Nonnull' is disallowed with ARC

- (IBAction)clickDigit:(UIButton *)sender;

- (IBAction)clickPlus;
- (IBAction)clickMinus;
- (IBAction)clickMultiply;
- (IBAction)clickDivide;

- (IBAction)clickClear;
- (IBAction)clickEquals;

@end

