//
//  KIFileManager.h
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIFile.h"

@interface KIFileManager : NSObject

-(KIFile*) saveFile:(NSData*)fileContent;
-(KIFile*) getFile:(int)fileId;
-(void) updateFile:(KIFile*)file;
-(bool) removeFile:(int)fileId;

@end
