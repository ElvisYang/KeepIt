//
//  KPEntry.h
//  KeepIt
//
//  Created by Elvis on 4/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KIEntry : NSObject

@property (nonatomic, assign) int id;
@property (nonatomic, assign) bool isSystemDefined;
@property (nonatomic, assign) bool isUsed; //only used entry can be seen in today's tab
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) int thumbnailFileId;

@end
