//
//  HealthViewController.h
//  SampleApp
//
//  Created by Prachi on 3/19/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *questionTextField;
- (IBAction)submitButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
