//
//  KIFIle.h
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KIFileType.h"

@interface KIFile : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, copy) NSString* path;
@property (nonatomic, assign) enum KIFileType type;

@end
