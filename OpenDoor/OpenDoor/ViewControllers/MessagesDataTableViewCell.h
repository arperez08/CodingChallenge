//
//  MessagesDataTableViewCell.h
//  OpenDoor
//
//  Created by Arnel Perez on 6/4/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessagesDataTableViewCell : UITableViewCell
{

}

@property (nonatomic, strong) IBOutlet UILabel *lblCreator;
@property (nonatomic, strong) IBOutlet UILabel *lblDate;
@property (nonatomic, strong) IBOutlet UILabel *lblMessage;
@end
