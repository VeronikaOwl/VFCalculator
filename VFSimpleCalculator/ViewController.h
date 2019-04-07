//
//  ViewController.h
//  VFSimpleCalculator
//
//  Created by Филиппов Алексей on 19/03/2019.
//  Copyright © 2019 BuboBubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

  @property (strong, nonatomic) IBOutlet UILabel *displayLabel;
  @property (strong, nonatomic) IBOutlet UILabel *displayLabelCurrent;


- (IBAction)equalButtonClicked;
- (IBAction)clearButtonClicked:(id)sender;

- (IBAction)num:(id)sender;

- (IBAction)addButtonClicked;
- (IBAction)subtractButtonClicked;
- (IBAction)multiplyButtonClicked;
- (IBAction)divideButtonClicked;

@end

