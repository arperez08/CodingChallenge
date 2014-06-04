//
//  MessagesViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"


@interface MessagesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    MBProgressHUD *HUB;
    NSArray *queryResults;
}
@property (strong, nonatomic) PFUser *userDetails;
@property (nonatomic, strong) IBOutlet UITableView *tblMessages;
@end
