//
//  MessagesViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import "MessagesViewController.h"
#import <Parse/Parse.h>

@interface MessagesViewController ()

@end

@implementation MessagesViewController
@synthesize userDetails;

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
    self.title = @"Messages";

    NSString *username = [userDetails objectForKey:@"username"];
   
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"username" equalTo:username];
    
    NSArray *userData = [query findObjects];
    NSLog(@"count: %d %@",[userData count], username);
    
    //NSMutableDictionary *dictUserData= [userData objectAtIndex:0];
    //NSString *userObjectId = [dictUserData objectForKey:@"objectId"];
    //NSLog(@"userObjectId = %@",userObjectId);
    //[self getMessages:userObjectId];
    
}

-(void) getMessages: (NSString *)userObjectId{
    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    [query whereKey:@"user_id" equalTo:userObjectId];
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];
    NSLog(@"%@",[queryResults objectAtIndex:0]);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
