//
//  ViewController.m
//  SampleApp
//
//  Created by Prachi on 3/10/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AnswerViewController.h"
#import "SummaryViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize myTextView,description;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"analyseSegue"])
    {
        UITabBarController *tabBarcontroller = [segue destinationViewController];
        //NSLog(@"%@",tabBarcontroller.viewControllers);
        SummaryViewController *summaryController = [tabBarcontroller.viewControllers objectAtIndex:0];
        [summaryController setInputSummary:[NSString stringWithFormat:@"%@",myTextView.text]];
        AnswerViewController *answerController = [tabBarcontroller.viewControllers objectAtIndex:1];
        [answerController setInputTraits:[NSString stringWithFormat:@"%@",myTextView.text]];
    }
}

//- (IBAction)speakButton:(id)sender {
//    
//    NSURL *url = [NSURL URLWithString:@"http://iossampleapp.eu-gb.mybluemix.net/speech-to-text"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    NSString *text = [NSString stringWithFormat:@"text=%@",inputSummary];
//    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = data;
//    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
//    NSURLResponse *response;
//    NSError *error;
//    NSData *responseSummary = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    return responseSummary;
//
//}
@end
