//
//  KIEntryAccess.m
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIDBEntryAccess.h"
#import "KIEntry.h"
#import "FMDB.h"
#import "FMDatabase.h"
#import "KIDBInitializer.h"

@implementation KIDBEntryAccess

#pragma mark KIDataAccess
-(bool) isAvailable
{
    return true;
}

#pragma mark KIEntryAccess delegate

-(NSArray*) getAllEntries
{
    NSMutableArray* entries = [[NSMutableArray alloc] init];
    
    [self openDB:^(FMDatabase* db) {
        FMResultSet* set = [db executeQuery:@"select id, isSystemDefined, isUsed, name, thumbnailFileId from Entries"];
        while([set next])
        {
            KIEntry* entry = [[KIEntry alloc] init];
            entry.id = [set intForColumn:@"id"];
            entry.isSystemDefined = [set intForColumn:@"isSystemDefined"];
            entry.isUsed = [set intForColumn:@"isUsed"];
            entry.name = [set stringForColumn:@"name"];
            entry.thumbnailFileId = [set intForColumn:@"thumbnailFileId"];
            
            [entries addObject:entry];
        }
    }];
    
    return entries;
}

-(NSArray*) getUsedEntries
{
    NSMutableArray* entries = [[NSMutableArray alloc] init];
    
    [self openDB:^(FMDatabase* db) {
        FMResultSet* set = [db executeQuery:@"select id, isSystemDefined, isUsed, name, thumbnailFileId from Entries where isUsed=?", [NSNumber numberWithBool:true]];
        while([set next])
        {
            KIEntry* entry = [[KIEntry alloc] init];
            entry.id = [set intForColumn:@"id"];
            entry.isSystemDefined = [set intForColumn:@"isSystemDefined"];
            entry.isUsed = [set intForColumn:@"isUsed"];
            entry.name = [set stringForColumn:@"name"];
            entry.thumbnailFileId = [set intForColumn:@"thumbnailFileId"];
            
            [entries addObject:entry];
        }
    }];
    
    return entries;
}

-(bool) addEntry:(KIEntry*) entry
{
    __block bool successful = false;
    [self openDB:^(FMDatabase *db) {
        successful = [db executeUpdate:@"insert into Entries (isSystemDefined, isUsed, name, thumbnailFileId) Values(?,?,?,?)", [NSNumber numberWithBool:entry.isSystemDefined], [NSNumber numberWithBool:entry.isUsed], entry.name, entry.thumbnailFileId];
    }];
    
    return successful;
}

-(bool) removeEntry:(int)entryId
{
    __block bool successful = false;
    [self openDB:^(FMDatabase *db) {
        successful = [db executeUpdate:@"delete from Entries where id=?", entryId];
    }];
    return successful;
}

-(bool) updateEntry:(KIEntry*) entry
{
    __block bool successful = false;
    [self openDB:^(FMDatabase *db) {
        successful = [db executeUpdate:@"update Entries set isSystemDefined=?, isUsed=?, name=?, thumbnailFileId=? where id=?", [NSNumber numberWithBool:entry.isSystemDefined], [NSNumber numberWithBool:entry.isUsed], entry.name, entry.thumbnailFileId, [NSNumber numberWithInt:entry.id]];
    }];
    
    return successful;
}

@end
