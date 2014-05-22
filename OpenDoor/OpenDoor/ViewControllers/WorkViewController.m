//
//  WorkViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import "WorkViewController.h"
#import <Parse/Parse.h>

@interface WorkViewController ()

@end

@implementation WorkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Work";
 
    HUB = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUB];
    HUB.labelText = @"Loading...";
    [HUB showWhileExecuting:@selector(runQuery) onTarget:self withObject:nil animated:YES];

}

- (void) runQuery {
    int dateNow = [[NSDate date] timeIntervalSince1970];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Task"];
    [query whereKey:@"is_active" equalTo:@YES];
    [query whereKey:@"expiry_date" lessThan:@(dateNow)];
    
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];
    NSLog(@"%@",[queryResults objectAtIndex:0]);
    
    //    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
    //        queryResults = [[NSArray alloc] init];
    //        queryResults = results;
    //        NSLog(@"%@",[results objectAtIndex:0]);
    //    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
