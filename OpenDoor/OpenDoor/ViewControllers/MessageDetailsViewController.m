//
//  MessageDetailsViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 6/4/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import "MessageDetailsViewController.h"
#import "MessagesDataTableViewCell.h"

@interface MessageDetailsViewController ()

@end

@implementation MessageDetailsViewController
@synthesize currentObject,tblMessages;

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
    lblBy.text = [self getUserInfo:[currentObject objectForKey:@"creator_id"]];
    //lblBy.text = [currentObject objectForKey:@"creator_id"];
    lblCreated.text = [NSString stringWithFormat:@"%@",currentObject.createdAt];

//    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
//    [query whereKey:@"messages" equalTo:messages];
//    queryResults = [[NSArray alloc] init];
//    queryResults = [query findObjects];
//    NSLog(@"%@",queryResults);
    

    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    //[query whereKey:@"messages" equalTo:[currentObject objectForKey:@"messages"]];
    //[query whereKey:@"messages" equalTo:[PFObject objectWithoutDataWithClassName:@"Message_Thread" objectId:currentObject.objectId]];
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];
    NSLog(@"== %@",queryResults);
}

- (NSString *) getUserInfo:(NSString *) creator_id {
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"objectId" equalTo:creator_id];
    NSArray *arrayResult = [query findObjects];
    NSLog(@"== %@",arrayResult);
    return creator_id;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [queryResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *currentObjectData = [queryResults objectAtIndex:indexPath.section];
    
    static NSString *simpleTableIdentifier = @"Cell";
    MessagesDataTableViewCell *cell = (MessagesDataTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MessagesDataTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //NSLog(@"%@",[currentObjectData objectForKey:@"title"]);
    cell.lblCreator.text= [currentObjectData objectForKey:@"user_id"];
    cell.lblDate.text = [NSString stringWithFormat:@"%@",currentObject.createdAt];
    cell.lblMessage.text =[currentObjectData objectForKey:@"text"];

    return cell;
}




@end
