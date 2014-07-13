//
//  KIDBRatingAccess.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIDBRatingAccess.h"
#import "KIRating.h"

@implementation KIDBRatingAccess

- (bool) rate:(int)entryId rating:(float)rating
{
    __block bool successful = false;
    [self openDB:^(FMDatabase *db) {
        successful = [db executeUpdate:@"insert into Rating (ratingDate, ratingTime, ratingDateTime, rating, entryId) values(date('now','localtime'),time('now','localtime'),?,?,?)",[NSDate date], [NSNumber numberWithFloat:rating], [NSNumber numberWithInt:entryId]];
    }];
    
    return successful;
}

- (NSDictionary*) getTodayRating
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    
    [self openDB:^(FMDatabase *db) {
        FMResultSet* set = [db executeQuery:@"select id, ratingDate, ratingTime, ratingDateTime, rating, entryId from Rating where ratingDate=date('now','localtime') order by ratingTime DESC"];
        
        while([set next])
        {
            KIRating* rating = [[KIRating alloc] init];
            rating.id = [set intForColumn:@"id"];
            rating.ratingDate = [set stringForColumn:@"ratingDate"];
            rating.ratingTime = [set stringForColumn:@"ratingTime"];
            rating.rating = (float)[set doubleForColumn:@"rating"];
            rating.entryId = [set intForColumn:@"entryId"];
            rating.ratingDateTime = [set dateForColumn:@"ratingDateTime"];
            if([dic objectForKey:[NSNumber numberWithInt:rating.entryId]] == nil)
                [dic setObject:rating forKey:[NSNumber numberWithInt:rating.entryId]];
        }
    }];
    
    return dic;
}

- (NSDictionary*) getRating:(NSDate*)startDate endDate:(NSDate*)endDate
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];

    [self openDB:^(FMDatabase *db) {
        FMResultSet* set;
        if(startDate && endDate)
        {
            set = [db executeQuery:@"select id, ratingDate, ratingTime, ratingDateTime, rating, entryId from Rating where ratingDate>=? and ratingDate<=? group by ratingDate, entryId", startDate, endDate];
        }
        else if(startDate && !endDate)
        {
            set = [db executeQuery:@"select id, ratingDate, ratingTime, ratingDateTime, rating, entryId from Rating where ratingDate>=? group by ratingDate, entryId", startDate];
        }
        else
        {
            set = [db executeQuery:@"select id, ratingDate, ratingTime, ratingDateTime, rating, entryId from Rating group by ratingDate, entryId"];
        }
        
        while([set next])
        {
            KIRating* rating = [[KIRating alloc] init];
            rating.id = [set intForColumn:@"id"];
            rating.ratingDate = [set stringForColumn:@"ratingDate"];
            rating.ratingTime = [set stringForColumn:@"ratingTime"];
            rating.rating = (float)[set doubleForColumn:@"rating"];
            rating.entryId = [set intForColumn:@"entryId"];
            rating.ratingDateTime = [set dateForColumn:@"ratingDateTime"];
            
            if(!rating.ratingDate)
                continue;
            
            if(![dic objectForKey:rating.ratingDate])
            {
                NSMutableDictionary* oneDayRating = [[NSMutableDictionary alloc] init];
                [dic setObject:oneDayRating forKey:rating.ratingDate];
            }
            
            [dic[rating.ratingDate] setObject:rating forKey:[NSNumber numberWithInt:rating.entryId]];
        }
    }];
    
    return dic;
}

@end
