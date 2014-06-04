//
//  WorkDetailsViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/25/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface WorkDetailsViewController : UIViewController{
    PFObject *currentObject;
    
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblEarn;
    IBOutlet UILabel *lblPost;
    IBOutlet UILabel *lblExpire;
    IBOutlet UILabel *lbldesc;
    
}
@property (strong, nonatomic) PFObject *currentObject;
@end
