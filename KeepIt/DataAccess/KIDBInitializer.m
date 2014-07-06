//
//  KIDBInitializer.m
//  KeepIt
//
//  Created by Elvis on 5/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIDBInitializer.h"
#import "KIConstant.h"

@implementation KIDBInitializer

static NSString* db_path;

+(bool) init
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    db_path = [libraryDirectory stringByAppendingPathComponent:DB_PATH];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:db_path])
    {
        NSError* error;
        NSString* emptyDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_PATH];
        [fileManager copyItemAtPath:emptyDBPath toPath:db_path error:&error];
        if(error != nil)
            return false;
    }
    
    return true;
}

+(NSString*) getDBPath
{
    return db_path;
}

@end
