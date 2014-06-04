//
//  AccountViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface AccountViewController : UIViewController{
    PFUser * userDetails;
    IBOutlet UILabel *lblMobNum;
    IBOutlet UILabel *lblFname;
    IBOutlet UILabel *lblLname;
    
    IBOutlet UILabel *lblAccntType;
    IBOutlet UILabel *lblAccntId;
    IBOutlet UILabel *lblPendingPayment;
    IBOutlet UILabel *lblLifeEarning;
    
    IBOutlet UILabel *lblHome;
    IBOutlet UILabel *lblWork;
    IBOutlet UILabel *lblOther;
    MBProgressHUD *HUB;
}
@property (strong, nonatomic) PFUser *userDetails;
@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
- (IBAction)btnLogout:(id)sender;
@end
