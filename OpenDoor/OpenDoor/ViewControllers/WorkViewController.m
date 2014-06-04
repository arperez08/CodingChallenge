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
    
    PFQuery *query = [PFQuery queryWithClassName:@"Task"];
    [query whereKey:@"is_active" equalTo:@YES];
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];
    
   //NSLog(@"%d", [queryResults count]);
    
}

- (void)didReceiveMemoryWarning{
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
    PFObject *currentObject = [queryResults objectAtIndex:indexPath.section];
    
    static NSString *simpleTableIdentifier = @"Cell";
    WorkTableViewCell *cell = (WorkTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WorkTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSLog(@"%@",[currentObject objectForKey:@"title"]);
    cell.lblTitle.text = [currentObject objectForKey:@"title"];
    cell.lblLocation.text = [currentObject objectForKey:@"loc_name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *currentObject = [queryResults objectAtIndex:indexPath.section];
    
	WorkDetailsViewController *wdvc = [[WorkDetailsViewController alloc] initWithNibName:@"WorkDetailsViewController" bundle:[NSBundle mainBundle]];
    
    wdvc.currentObject =currentObject;
    
    [self.navigationController setNavigationBarHidden:NO];
	[self.navigationController pushViewController:wdvc animated:YES];
}



@end
