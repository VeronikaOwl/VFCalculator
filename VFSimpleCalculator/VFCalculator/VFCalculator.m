//
//  VFCalculator.m
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 20/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import "VFCalculator.h"

@implementation VFCalculator
{
  CGFloat operand1;
  CGFloat operand2;
}

@synthesize accumulator;


- (CGFloat) performOperator:(char)op
{
  CGFloat result;
  
  switch (op)
  {
    case '+':
      result = [accumulator add: accumulator += value];
      break;
    case '-':
      result = [operand1 subtract: operand2];
      break;
    case '*':
      result = [operand1 multiply: operand2];
      break;
    case '/':
      result = [operand1 divide: operand2];
      break;
  }
  
  accumulator = result;
  
  return accumulator;
}

- (void) add: (CGFloat) value
{
  accumulator += value;
}

- (void) subtract: (CGFloat) value
{
  accumulator -= value;
}

- (void) multiply: (CGFloat) value
{
  accumulator *= value;
}

- (void) divide: (CGFloat) value
{
  accumulator /= value;
}

- (void) clear
{
  accumulator = 0;
}

@end
