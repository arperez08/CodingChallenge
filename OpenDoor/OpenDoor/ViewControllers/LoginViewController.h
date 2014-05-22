//
//  LoginViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "Reachability.h"
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController{
    
    IBOutlet UITextField *txtUser;
    IBOutlet UITextField *txtPassword;
    MBProgressHUD *HUB;
    PFUser * userDetails;
    
}
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIWindow *window;

- (IBAction)btnLogin:(id)sender;
- (IBAction)btnReset:(id)sender;
- (IBAction)btnRegister:(id)sender;



@end
