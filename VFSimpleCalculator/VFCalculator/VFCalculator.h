//
//  VFCalculator.h
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 20/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VFCalculator : NSObject

@property CGFloat accumulator;

- (CGFloat) performOperator: (char) op;

- (void) add: (CGFloat) value;
- (void) subtract: (CGFloat) value;
- (void) multiply: (CGFloat) value;
- (void) divide: (CGFloat) value;

- (void) clear;

@end

NS_ASSUME_NONNULL_END
