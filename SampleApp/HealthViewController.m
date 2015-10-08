//
//  HealthViewController.m
//  SampleApp
//
//  Created by Prachi on 3/19/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import "HealthViewController.h"

@interface HealthViewController ()

@property NSArray *answersArray;

@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitButton:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://iossampleapp.eu-gb.mybluemix.net/question-answer"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *text = [NSString stringWithFormat:@"questionText=%@",self.questionTextField.text];
    NSLog(@"%@",text);
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    NSURLResponse *response;
    NSError *error;
    
    NSData *responseHealthAnswer = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if(!error)
    {
        //NSLog(@"No error:%@",responseHealthAnswer);
        
    }else{
        NSLog(@"Error:%@",error.description);
    }
    
    NSError *serializationError;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseHealthAnswer options:NSJSONReadingMutableContainers error:&serializationError];
    if (serializationError) {
        NSLog(@"%@",serializationError.description);
    }
    else
    {
       
        self.answersArray = [[dictionary objectForKey:@"question"] objectForKey:@"answers"];
        for (NSDictionary *answer in self.answersArray) {
            NSLog(@"%@\n",[answer objectForKey:@"text"]);
        }
    }
    [self.myTableView reloadData];


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[self.answersArray count]);
    return [self.answersArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *answerCell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!answerCell) {
        answerCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    answerCell.textLabel.numberOfLines = 0;
    answerCell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    answerCell.textLabel.text = [self.answersArray[indexPath.row] objectForKey:@"text"];
    return answerCell;
}

@end
