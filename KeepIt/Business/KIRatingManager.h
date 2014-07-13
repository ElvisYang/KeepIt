//
//  KIRatingManager.h
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIRatingManager : NSObject

- (bool) rate:(int)entryId rating:(double)rating;
- (NSDictionary*) getTodayRating;
- (NSDictionary*) getRating:(NSDate*)startDate endDate:(NSDate*)endDate;

+(KIRatingManager*) sharedInstance;

@end
