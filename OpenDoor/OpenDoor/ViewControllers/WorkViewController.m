//
//  WorkViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import "WorkViewController.h"
#import <Parse/Parse.h>
#import "WorkTableViewCell.h"
#import "WorkDetailsViewController.h"
#import "MyTableController.h"
@interface WorkViewController ()

@end

@implementation WorkViewController
@synthesize tblActiveWorks;

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
    
    //HUB = [[MBProgressHUD alloc]initWithView:self.view];
    //[self.view addSubview:HUB];
    //HUB.labelText = @"Loading...";
    //[HUB showWhileExecuting:@selector(runQuery) onTarget:self withObject:nil animated:YES];
}

- (void) runQuery {
    PFQuery *query = [PFQuery queryWithClassName:@"Task"];
    [query whereKey:@"is_active" equalTo:@YES];
    //[query whereKey:@"expiry_date" lessThan:@(dateNow)];
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
