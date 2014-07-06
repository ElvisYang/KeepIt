//
//  KIDataAccess.h
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface KIDataAccess : NSObject
{
@protected
    KIDataAccess* m_next;
}

-(bool) isAvailable;
-(void) openDB:(void(^)(FMDatabase* db))processor;

@end
