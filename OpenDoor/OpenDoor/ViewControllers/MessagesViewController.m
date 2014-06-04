//
//  MessagesViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import "MessagesViewController.h"
#import <Parse/Parse.h>
#import "MessageTableViewCell.h"
#import "MessageDetailsViewController.h"

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
    
    PFQuery *query = [PFQuery queryWithClassName:@"Message_Thread"];
    queryResults = [[NSArray alloc] init];
    queryResults = [query findObjects];

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
    PFObject *currentObject = [queryResults objectAtIndex:indexPath.section];
    
    static NSString *simpleTableIdentifier = @"Cell";
    MessageTableViewCell *cell = (MessageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSLog(@"%@",currentObject);
    cell.lblTitle.text = [currentObject objectForKey:@"title"];
    cell.lblCreated.text = [NSString stringWithFormat:@"%@",currentObject.createdAt];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PFObject *currentObject = [queryResults objectAtIndex:indexPath.section];
    
	MessageDetailsViewController *wdvc = [[MessageDetailsViewController alloc] initWithNibName:@"MessageDetailsViewController" bundle:[NSBundle mainBundle]];
    
    wdvc.currentObject =currentObject;
    
    [self.navigationController setNavigationBarHidden:NO];
	[self.navigationController pushViewController:wdvc animated:YES];
}



@end
