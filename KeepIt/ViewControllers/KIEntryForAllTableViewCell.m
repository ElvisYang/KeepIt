//
//  KIEntryForAllTableViewCell.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIEntryForAllTableViewCell.h"
#import "KIEntryManager.h"

@implementation KIEntryForAllTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchChanged:(id)sender {
    
    self.entry.isUsed = ((UISwitch*)sender).on;
    
    [[KIEntryManager sharedInstance] updateEntry:self.entry];
}
@end
