//
//  LoginViewController.m
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "WorkViewController.h"
#import "AccountViewController.h"
#import "HistoryViewController.h"
#import "MessagesViewController.h"
#import "MyTableController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    [alertView performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Open Door";
    
    //[self userLogin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userLogin{
    [PFUser logInWithUsernameInBackground:txtUser.text password:txtPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            userDetails = [[PFUser alloc] init];
                                            userDetails = user;
                                            
                                            NSLog(@"%@", userDetails.username);

                                            [self DoNavigate];
                                        }
                                        else {
                                            // The login failed. Check error to see why.
                                            [self alertStatus:@"Invalid login credentials" :@"The operation couldn’t be completed."];
                                            NSLog(@"Error====%@",error);
                                        }
                                    }];
}

- (void)DoNavigate{
    NSLog(@"%@",userDetails);
    
    WorkViewController *viewController1 = [[WorkViewController alloc] initWithNibName:@"WorkViewController" bundle:nil];
    //MyTableController *viewController1 = [[MyTableController alloc] init];
    HistoryViewController *viewController2 = [[HistoryViewController alloc] initWithNibName:@"HistoryViewController" bundle:nil];
    AccountViewController *viewController3 = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    MessagesViewController *viewController4 = [[MessagesViewController alloc] initWithNibName:@"MessagesViewController" bundle:nil];
    
    viewController1.title = @"Work";
    viewController1.tabBarItem.image = [UIImage imageNamed:@"work"];
    viewController2.title = @"History";
    viewController2.tabBarItem.image = [UIImage imageNamed:@"History"];
    viewController3.title = @"Account";
    viewController3.tabBarItem.image = [UIImage imageNamed:@"Account"];
    viewController3.userDetails = userDetails;
    viewController4.title = @"Messages";
    viewController4.tabBarItem.image = [UIImage imageNamed:@"message"];
    viewController4.userDetails = userDetails;
    
    self.tabBarController = [[UITabBarController alloc] init];
    //self.tabBarController.viewControllers = @[viewController1, viewController2, viewController3, viewController4];
    self.tabBarController.viewControllers = @[viewController1, viewController3, viewController4];
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController pushViewController:self.tabBarController animated:YES];
}

- (IBAction)btnLogin:(id)sender {
    if ([self connected] == NotReachable)
    {
        [self alertStatus:@"No Network Connection" :@"Notification"];
    }
    else
    {
        [self userLogin];
        //HUB = [[MBProgressHUD alloc]initWithView:self.view];
        //[self.view addSubview:HUB];
        //HUB.labelText = @"Logging in...";
        //[HUB showWhileExecuting:@selector(userLogin) onTarget:self withObject:nil animated:YES];
    }
}

- (IBAction)btnReset:(id)sender {
    txtPassword.text = @"";
    txtUser.text = @"";
}

- (IBAction)btnRegister:(id)sender {
//    PFUser *user = [PFUser user];
//    user.username = @"Arnel";
//    user.password = @"09-08-81";
//    user.email = @"ar_perez08@yahoo.com";
//    
//    // other fields can be set just like with PFObject
//    user[@"phone"] = @"0917-845-9881";
//    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            // Hooray! Let them use the app now.
//            NSLog(@"Hooray! Let them use the app now.");
//            
//        }
//        else {
//            NSString *errorString = [error userInfo][@"error"];
//            NSLog(@"Error==%@",errorString);
//            // Show the errorString somewhere and let the user try again.
//        }
//    }];
}

- (BOOL)connected {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus currrentStatus = [reachability currentReachabilityStatus];
    return currrentStatus;
}

@end
