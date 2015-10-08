//
//  ViewController.h
//  SampleApp
//
//  Created by Prachi on 3/10/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *description;
- (IBAction)speakButton:(id)sender;


@end

