//
//  KIRatingManager.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIRatingManager.h"
#import "KIDBRatingAccess.h"

@implementation KIRatingManager
{
    KIDBRatingAccess* m_ratingAccess;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        m_ratingAccess = [[KIDBRatingAccess alloc] init];
    }
    return self;
}

+(KIRatingManager*) sharedInstance
{
    static dispatch_once_t pred;
    static KIRatingManager* instance = nil;
    
    dispatch_once(&pred, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (bool) rate:(int)entryId rating:(double)rating
{
    return [m_ratingAccess rate:entryId rating:rating];
}

- (NSDictionary*) getTodayRating
{
    return [m_ratingAccess getTodayRating];
}

@end
