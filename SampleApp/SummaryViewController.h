//
//  SummaryViewController.h
//  SampleApp
//
//  Created by Prachi on 3/12/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController

@property (weak,nonatomic) NSString *inputSummary;
@property (weak, nonatomic) IBOutlet UILabel *summaryText;

@end
