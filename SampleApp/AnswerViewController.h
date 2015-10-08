//
//  AnswerViewController.h
//  SampleApp
//
//  Created by Prachi on 3/11/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSString *inputTraits;
@property (strong,nonatomic) NSArray * resultArray;

@end
