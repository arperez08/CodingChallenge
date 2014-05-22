//
//  AccountViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface AccountViewController : UIViewController{
        PFUser * userDetails;
}
@property (strong, nonatomic) PFUser *userDetails;
@end
