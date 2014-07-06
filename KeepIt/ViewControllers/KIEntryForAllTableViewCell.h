//
//  KIEntryForAllTableViewCell.h
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIEntry.h"

@interface KIEntryForAllTableViewCell : UITableViewCell

@property (nonatomic, weak) KIEntry* entry;

- (IBAction)switchChanged:(id)sender;

@end
