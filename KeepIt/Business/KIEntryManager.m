//
//  KIEntryManager.m
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIEntryManager.h"
#import "KIEntryAccess.h"
#import "KIDBEntryAccess.h"

@implementation KIEntryManager
{
    KIDBEntryAccess* m_entryAccess;
    NSArray* m_allEntriesCache;
    NSArray* m_usedEntriesCache;
    bool m_all_cache_invalid;
    bool m_used_cache_invalid;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        m_entryAccess = [[KIDBEntryAccess alloc] init];
        m_allEntriesCache = [[NSArray alloc] init];
        m_usedEntriesCache = [[NSArray alloc] init];
        m_all_cache_invalid = true;
        m_used_cache_invalid = true;
    }
    
    return self;
}

+ (KIEntryManager*) sharedInstance
{
    static dispatch_once_t pred;
    static KIEntryManager* gInstance = nil;
    
    dispatch_once(&pred, ^{
        gInstance = [[self alloc] init];
    });
    
    return gInstance;
}

-(NSArray*) getAllEntries
{
    if(!m_all_cache_invalid)
        return m_allEntriesCache;
    else
    {
        m_allEntriesCache = [m_entryAccess getAllEntries];
        m_all_cache_invalid = false;
        return m_allEntriesCache;
    }
}

-(NSArray*) getUsedEntries
{
    if(!m_used_cache_invalid)
        return m_usedEntriesCache;
    else
    {
        m_usedEntriesCache = [m_entryAccess getUsedEntries];
        m_used_cache_invalid = false;
        return m_usedEntriesCache;
    }
}

-(bool) addEntry:(KIEntry*) entry
{
    m_all_cache_invalid = true;
    m_used_cache_invalid = true;
    return [m_entryAccess addEntry:entry];
}

-(bool) removeEntry:(int)entryId
{
    m_all_cache_invalid = true;
    m_used_cache_invalid = true;
    return [m_entryAccess removeEntry:entryId];
}

-(bool) updateEntry:(KIEntry*) entry
{
    m_all_cache_invalid = true;
    m_used_cache_invalid = true;
    return [m_entryAccess updateEntry:entry];
}

@end
