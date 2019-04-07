//
//  ViewController.m
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 19/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "ViewController.h"
//#import "VFCalculator.h"

typedef NS_ENUM (NSUInteger, VFCalculatorState)
{
  VFCalculatorStateCleared = 0,
  VFCalculatorStateNumberOneEntering = 1,
  VFCalculatorStateOperatorEntered = 2,
  VFCalculatorStateNumberTwoEntering = 3,
  VFCalculatorStateCalculated = 4
};

typedef NS_ENUM(NSUInteger, VFCalculatorOperator)
{
  VFCalculatorOperatorNone,
  VFCalculatorOperatorAdd,
  VFCalculatorOperatorSubtract,
  VFCalculatorOperatorMultiply,
  VFCalculatorOperatorDivide,
};

@interface ViewController ()
{
  double operand1;
  double operand2;
  VFCalculatorOperator operator;
  VFCalculatorState state;
  double currentOperand;
}

@end

@implementation ViewController

@synthesize displayLabel, displayLabelCurrent;


- (void) viewDidLoad
{
  [super viewDidLoad];
  //Do any additional setup after loading the view, typically from a nib.
  self.displayLabel.text = @"0";
  self.displayLabelCurrent.text = @"0";
}

- (void) viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  
  [self roundButtons];
}

- (void) roundButtons
{
  [self roundIfNeeded: self.view];
}

- (void) roundIfNeeded: (UIView *) checkView
{
  for (UIView *subview in checkView.subviews)
  {
    if ([subview isKindOfClass: [UIButton class]])
    {
      subview.layer.cornerRadius = subview.frame.size.width / 2.0;
    }
    else
    {
      [self roundIfNeeded: subview];
    }
  }
}

- (void) displayCalculateNumber
{
  NSString *operatorString;
  
  switch (operator)
  {
    case VFCalculatorOperatorNone:
      operatorString = @"";
      break;
    case VFCalculatorOperatorAdd:
      operatorString = @"+";
      break;
    case VFCalculatorOperatorSubtract:
      operatorString = @"-";
      break;
    case VFCalculatorOperatorMultiply:
      operatorString = @"*";
      break;
    case VFCalculatorOperatorDivide:
      operatorString = @"/";
      break;
  }
  
  NSString *displayString;
  
  switch (state)
  {
    case VFCalculatorStateCleared:
      displayString = @"0";
      break;
    case VFCalculatorStateNumberOneEntering:
      displayString = [NSString stringWithFormat: @"%g", currentOperand];
      break;
    case VFCalculatorStateOperatorEntered:
      displayString = [NSString stringWithFormat: @"%g %@", operand1, operatorString];
      break;
    case VFCalculatorStateNumberTwoEntering:
      displayString = [NSString stringWithFormat: @"%g %@ %g", operand1, operatorString, currentOperand];
      break;
    case VFCalculatorStateCalculated:
      displayString = [NSString stringWithFormat: @"%g %@ %g", operand1, operatorString, operand2];
      break;
  }
  
  displayLabel.text = displayString;
}

- (void) displayNumber: (double) number
{
  NSString *str = [NSString stringWithFormat: @"%g", number];
  [displayLabelCurrent setText: str];
}

- (IBAction)equalButtonClicked
{
  
  switch (state)
  {
    case VFCalculatorStateCleared:
      
      break;
    case VFCalculatorStateNumberOneEntering:
      [self displayCalculateNumber];
      state = VFCalculatorStateCalculated;
      operand1 = currentOperand;
      currentOperand = 0;
      break;
    case VFCalculatorStateOperatorEntered:
      operator = VFCalculatorOperatorNone;
      [self displayCalculateNumber];
      state = VFCalculatorStateCalculated;
      break;
    case VFCalculatorStateNumberTwoEntering:
      state = VFCalculatorStateCalculated;
      operand2 = currentOperand;
      [self displayCalculateNumber];
      [self calculate];
      currentOperand = 0;
      [self displayNumber: operand1];
      break;
    case VFCalculatorStateCalculated:
      currentOperand = 0;
      operand2 = 0;
      operator = VFCalculatorOperatorNone;
      
      break;
  }
}

- (IBAction)clearButtonClicked:(id)sender
{
  operand1 = 0;
  operand2 = 0;
  currentOperand = 0;
  operator = VFCalculatorOperatorNone;
  state = VFCalculatorStateCleared;
  [self displayNumber: operand1];
  [self displayCalculateNumber];
}

- (IBAction)num:(id)sender
{
  switch (state)
  {
    
    case VFCalculatorStateCleared:
      state = VFCalculatorStateNumberOneEntering;
      currentOperand = [sender tag];
      break;
    case VFCalculatorStateNumberOneEntering:
      currentOperand = (currentOperand * 10.0) + [sender tag];
      break;
    case VFCalculatorStateOperatorEntered:
      state = VFCalculatorStateNumberTwoEntering;
      currentOperand = [sender tag];
      break;
    case VFCalculatorStateNumberTwoEntering:
      currentOperand = (currentOperand * 10.0) + [sender tag];
      break;
    case VFCalculatorStateCalculated:
      operand1 = 0;
      state = VFCalculatorStateNumberOneEntering;
      currentOperand = [sender tag];
      break;
  }
  [self displayCalculateNumber];
}

 
- (IBAction)addButtonClicked
{
  switch (state)
  {
    case VFCalculatorStateNumberOneEntering:
    {
      operand1 = currentOperand;
      break;
    }
    case VFCalculatorStateNumberTwoEntering:
    {
      operand2 = currentOperand;
      [self calculate];
      break;
    }
    default:
      break;
  }
  operator = VFCalculatorOperatorAdd;
  state = VFCalculatorStateOperatorEntered;
  [self displayCalculateNumber];
  currentOperand = 0;
}

- (IBAction)subtractButtonClicked
{
  switch (state)
  {
    case VFCalculatorStateNumberOneEntering:
    {
      operand1 = currentOperand;
      break;
    }
    case VFCalculatorStateNumberTwoEntering:
    {
      operand2 = currentOperand;
      [self calculate];
      break;
    }
    default:
      break;
  }
  operator = VFCalculatorOperatorSubtract;
  state = VFCalculatorStateOperatorEntered;
  [self displayCalculateNumber];
  currentOperand = 0;
}

- (IBAction)multiplyButtonClicked
{
  switch (state)
  {
    case VFCalculatorStateNumberOneEntering:
    {
      operand1 = currentOperand;
      break;
    }
    case VFCalculatorStateNumberTwoEntering:
    {
      operand2 = currentOperand;
      [self calculate];
      break;
    }
    default:
      break;
  }
  operator = VFCalculatorOperatorMultiply;
  state = VFCalculatorStateOperatorEntered;
  [self displayCalculateNumber];
  currentOperand = 0;
}

- (IBAction)divideButtonClicked
{
  switch (state)
  {
    case VFCalculatorStateNumberOneEntering:
    {
      operand1 = currentOperand;
      break;
    }
    case VFCalculatorStateNumberTwoEntering:
    {
      operand2 = currentOperand;
      [self calculate];
      break;
    }
    default:
      break;
  }
  operator = VFCalculatorOperatorDivide;
  state = VFCalculatorStateOperatorEntered;
  [self displayCalculateNumber];
  currentOperand = 0;
}

- (void) calculate
{
  switch (operator)
  {
    case VFCalculatorOperatorNone:
      break;
    case VFCalculatorOperatorAdd:
      operand1 = operand1 + operand2;
      break;
    case VFCalculatorOperatorSubtract:
      operand1 = operand1 - operand2;
      break;
    case VFCalculatorOperatorMultiply:
      operand1 = operand1 * operand2;
      break;
    case VFCalculatorOperatorDivide:
      operand1 = operand1 / operand2;
      break;
  }
  operator = VFCalculatorOperatorNone;
  operand2 = 0;
}

@end
