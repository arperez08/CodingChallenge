//
//  MessageDetailsViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 6/4/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MessageDetailsViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblBy;
    IBOutlet UILabel *lblCreated;
    NSArray *queryResults;
}
@property (strong, nonatomic) PFObject *currentObject;
@property (nonatomic, strong) IBOutlet UITableView *tblMessages;
@end
