//
//  WorkViewController.h
//  OpenDoor
//
//  Created by Arnel Perez on 5/21/14.
//
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WorkViewController : UIViewController{
    NSArray *queryResults;
    MBProgressHUD *HUB;
}

@property (nonatomic, strong) IBOutlet UITableView *tblActiveWorks;

@end
