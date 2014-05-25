//
//  AccountViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import "AccountViewController.h"
#import <Parse/Parse.h>

@interface AccountViewController ()

@end

@implementation AccountViewController
@synthesize userDetails;
@synthesize scrollView;

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
    self.title = @"Account";
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 550);

    lblMobNum.text = [NSString stringWithFormat:@"%@",[userDetails objectForKey:@"username"]];
    lblFname.text = [userDetails objectForKey:@"first_name"];
    lblLname.text = [userDetails objectForKey:@"last_name"];
    PFGeoPoint *lastLocation = [userDetails objectForKey:@"last_location"];
    //PFObject *accounts = [userDetails objectForKey:@"accounts"];
    [self UserGeoLocation:lastLocation];

    
}

-(void) getHistory{
    
}


-(void) UserGeoLocation:(PFGeoPoint*)lastLocation {
    PFQuery *query = [PFQuery queryWithClassName:@"User_Fav_Location"];
    [query whereKey:@"geopoint" nearGeoPoint:lastLocation];
    query.limit = 3;
    NSArray *queryResults = [query findObjects];
    
    for (int i=0; i < [queryResults count]; i++) {
        NSMutableDictionary *dictResult = [queryResults objectAtIndex:i];
        NSString * locType = [dictResult objectForKey:@"type"];
        if ([locType isEqual:@"home"]) {
            lblHome.text = [dictResult objectForKey:@"name"];
        }
        else if ([locType isEqual:@"work"]){
            lblWork.text = [dictResult objectForKey:@"name"];
        }
        else{
            lblOther.text = [dictResult objectForKey:@"name"];
        }
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
