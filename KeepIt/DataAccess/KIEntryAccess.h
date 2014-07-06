//
//  KIEntryAccess.h
//  KeepIt
//
//  Created by Elvis on 5/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIEntry.h"

@protocol KIEntryAccess <NSObject>

@required
-(NSArray*) getAllEntries;
-(NSArray*) getUsedEntries;
-(bool) addEntry:(KIEntry*) entry;
-(bool) removeEntry:(int)entryId;
-(bool) updateEntry:(KIEntry*) entry;

@end
