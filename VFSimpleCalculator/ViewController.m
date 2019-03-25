//
//  ViewController.m
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 19/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "ViewController.h"
#import "VFCalculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
  char op;
  NSInteger currentNumber;
  BOOL firstOperand;
  VFCalculator *myCalculator;
  NSMutableString *displayString;
  NSMutableString *currentNumberDisplayString;
}

@synthesize calculateDisplay, currentNumberDisplay;

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  firstOperand = YES;
  displayString = [NSMutableString stringWithCapacity: 40];
  myCalculator = [[VFCalculator alloc] init];
}

- (void) processDigit: (NSInteger) digit
{
  currentNumber = currentNumber * 10 + digit;
  
  [displayString appendString:
   [NSString stringWithFormat: @"%li", digit]];
  calculateDisplay.text = displayString;
  
  [currentNumberDisplayString appendString:
   [NSString stringWithFormat: @"%li", digit]];
  currentNumberDisplay.text = currentNumberDisplayString;
}

- (void) processOp: (char) theOp
{
  NSString *opStr;
  
  op = theOp;
  
  switch (theOp)
  {
    case '+':
      opStr = @"+";
      break;
    case '-':
      opStr = @"-";
      break;
    case '*':
      opStr = @"x";
      break;
    case '/':
      opStr = @":";
      break;
  }
  
  //[self storePart];
  firstOperand = NO;
  
  [displayString appendString: opStr];
  calculateDisplay.text = displayString;
}

- (void) storePart
{
  if (firstOperand)
  {
    myCalculator = currentNumber;
  }
  else
  {
    myCalculator = currentNumber;
    firstOperand = YES;
  }
  
  currentNumber = 0;
}


#pragma mark - clickMethods

- (IBAction)clickDigit:(UIButton *)sender
{
  NSInteger digit = sender.tag;
  
  [self processDigit: digit];
}

- (IBAction)clickPlus
{
  [self processOp: '+'];
}

- (IBAction)clickMinus
{
  [self processOp: '-'];
}

- (IBAction)clickMultiply
{
  [self processOp: 'x'];
}

- (IBAction)clickDivide
{
  [self processOp: ':'];
}

- (IBAction)clickClear
{
  firstOperand = YES;
  currentNumber = 0;
  [myCalculator clear];
  
  [displayString setString: @""];
  calculateDisplay.text = displayString;
  currentNumberDisplay.text = displayString;
}

- (IBAction)clickEquals
{
  if (firstOperand == NO)
  {
    [self storePart];
    [myCalculator performOperator: op];
     
    [displayString appendString: @"="];
    [displayString appendString: myCalculator.accumulator];
    
    calculateDisplay.text = displayString;
    
    [displayString setString: @""];
    currentNumberDisplay.text = displayString;
    
    currentNumber = 0;
    firstOperand = YES;
    [displayString setString: @""];
    
  }
}

@end
