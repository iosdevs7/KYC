//
//  SummaryViewController.m
//  SampleApp
//
//  Created by Prachi on 3/12/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

@synthesize inputSummary;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //NSLog(@"%@",inputSummary);
    
    NSData *responseSummary = [self loadSummary];
    NSLog(@"Response summary:%@",responseSummary);
    
    NSMutableString *summary = [NSMutableString stringWithUTF8String:[responseSummary bytes]];
   // NSString *sum = [summary stringByReplacingOccurrencesOfString:@"[" withString:@"\n"];
    //[summary replaceOccurrencesOfString: withString:@"\n" options:NSLiteralSearch range:[NSMakeRange(0, [summary length])]]];
    
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"]\",["];
    NSString *finalSummary = [[summary componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@"\n"];
    
    self.summaryText.text = finalSummary;

  //  NSString *encoded= @[@"2051 371e 00f3 dc51 040d 403d d151 0e72"];
   
    //NSLog(@"%@", [NSString stringWithCString:@"2051 371e 00f3 dc51 040d 403d d151 0e72" encoding:NSUTF8StringEncoding]);
    // Do any additional setup after loading the view.

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSData*)loadSummary
{
    NSURL *url = [NSURL URLWithString:@"http://iossampleapp.eu-gb.mybluemix.net/summary"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *text = [NSString stringWithFormat:@"text=%@",inputSummary];
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    NSURLResponse *response;
    NSError *error;
    NSData *responseSummary = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    return responseSummary;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
