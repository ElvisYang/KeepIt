//
//  KIEntryManager.h
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIEntry.h"

@interface KIEntryManager : NSObject

-(NSArray*) getAllEntries;
-(NSArray*) getUsedEntries;
-(bool) addEntry:(KIEntry*) entry;
-(bool) removeEntry:(int)entryId;
-(bool) updateEntry:(KIEntry*) entry;

+ (KIEntryManager*) sharedInstance;

@end
