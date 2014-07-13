//
//  KIRating.h
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIRating : NSObject

@property(nonatomic, assign) int id;
@property(nonatomic, assign) NSString* ratingDate;
@property(nonatomic, assign) NSString* ratingTime;
@property(nonatomic, assign) NSDate* ratingDateTime;
@property(nonatomic, assign) float rating;
@property(nonatomic, assign) int entryId;

@end
