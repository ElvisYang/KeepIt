//
//  KIDataAccess.m
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIDataAccess.h"
#import "KIDBInitializer.h"

@implementation KIDataAccess

//Dacorator pattern, next should be invoked if it is available
-(id) initWithNext:(KIDataAccess*) nextAccess
{
    self = [self init];
    if(self)
    {
        m_next = nextAccess;
    }
    
    return self;
}

-(bool) isAvailable
{
    return true;
}

-(FMDatabase*) getDatabase
{
    return [[FMDatabase alloc] initWithPath:[KIDBInitializer getDBPath]];
}

-(void) openDB:(void(^)(FMDatabase* db))processor
{
    FMDatabase* db = [self getDatabase];
    if(![db open])
    {
        NSLog(@"Fail to open db.");
        return;
    }
    
    processor(db);
    
    [db close];
}

@end
