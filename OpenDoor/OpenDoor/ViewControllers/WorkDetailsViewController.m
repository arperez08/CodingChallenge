//
//  WorkDetailsViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/25/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import "WorkDetailsViewController.h"

@interface WorkDetailsViewController ()

@end

@implementation WorkDetailsViewController
@synthesize currentObject;

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

    lblTitle.text = [currentObject objectForKey:@"title"];
    NSString *strEarnings = [NSString stringWithFormat:@"%@ %@",[currentObject objectForKey:@"earn_currency"],[currentObject objectForKey:@"earn"]];
    lblEarn.text = strEarnings;
    lblPost.text = [NSString stringWithFormat:@"%@",[currentObject objectForKey:@"post_date"]];
    lblExpire.text = [NSString stringWithFormat:@"%@",[currentObject objectForKey:@"expiry_date"]];
    lbldesc.text = [NSString stringWithFormat:@"%@",[currentObject objectForKey:@"desc"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
