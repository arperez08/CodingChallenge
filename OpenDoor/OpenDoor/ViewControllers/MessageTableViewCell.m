//
//  MessageTableViewCell.m
//  OpenDoor
//
//  Created by Arnel Perez on 6/4/14.
//  Copyright (c) 2014 Newton Circus. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell
@synthesize lblTitle,lblCreated;
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
