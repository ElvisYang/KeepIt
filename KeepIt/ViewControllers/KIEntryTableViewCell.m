//
//  KIEntryTableViewCell.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIEntryTableViewCell.h"
#import "KIRatingManager.h"

@implementation KIEntryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        
    }
    return self;
}

- (id)init
{
    self = [super init];
    if(self)
    {
    
    }
    return self;
}

-(void)ratingChanged:(float)newRating {
    [[KIRatingManager sharedInstance] rate:self.entry.id rating:newRating];
}

- (void)awakeFromNib
{
    // Initialization code
    
//    self.nameValue.text = self.entry.name;
//    
    [self.ratingView setImagesDeselected:@"rating_0.png" partlySelected:@"rating_1.png" fullSelected:@"rating_2.png" andDelegate:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
