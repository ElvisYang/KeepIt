//
//  KIEntryTableViewCell.h
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIEntry.h"
#import "RatingView.h"

@interface KIEntryTableViewCell : UITableViewCell

@property (nonatomic, weak) KIEntry* entry;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *nameValue;
@property (weak, nonatomic) IBOutlet RatingView *ratingView;

@end
