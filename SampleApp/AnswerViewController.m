//
//  AnswerViewController.m
//  SampleApp
//
//  Created by Prachi on 3/11/15.
//  Copyright (c) 2015 Prachi. All rights reserved.
//

#import "AnswerViewController.h"
#import "ViewController.h"
#import "SummaryViewController.h"


@interface AnswerViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AnswerViewController

@synthesize inputTraits, resultArray;


- (void)viewDidLoad {
    [super viewDidLoad];
   
    //NSLog(@"%@",inputTraits);
    
    NSData *responseTraits = [self loadResults];
    //NSLog(@"%@",responseTraits);
    
    NSError *serializationError;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseTraits options:NSJSONReadingMutableContainers error:&serializationError];
    if (serializationError) {
        NSLog(@"%@",serializationError.description);
    }
    else
    {
        //extract summary from bluemix
        resultArray = [[dictionary objectForKey:@"tree"] objectForKey:@"children"];
        NSLog(@"Result Array:%@",resultArray);
    }


}

- (NSData*)loadResults
{
    NSURL *url = [NSURL URLWithString:@"http://iossampleapp.eu-gb.mybluemix.net"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *text = [NSString stringWithFormat:@"text=%@",inputTraits];
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPMethod = @"POST";
    request.HTTPBody = data;
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    return responseData;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [resultArray count];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //[resultArray[section] objectForKey:@"name"];
    return @"Header";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[[resultArray[section] objectForKey:@"children"] objectAtIndex:0] objectForKey:@"children"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [[[[[resultArray[indexPath.section] objectForKey:@"children"] objectAtIndex:0] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"name"];
    NSNumber *percentage = [[[[[resultArray[indexPath.section] objectForKey:@"children"] objectAtIndex:0] objectForKey:@"children"] objectAtIndex:indexPath.row] objectForKey:@"percentage"];
    
    cell.detailTextLabel.text = [NSString  stringWithFormat:@"%.2f",percentage.floatValue*100];
    return cell;
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

@end
