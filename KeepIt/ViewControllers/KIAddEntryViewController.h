//
//  AddEntryViewController.h
//  KeepIt
//
//  Created by Elvis on 5/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIEntry.h"

@interface KIAddEntryViewController : UIViewController

@property (weak, nonatomic) KIEntry* entry;
@property (weak, nonatomic) IBOutlet UITextField *nameValue;

- (IBAction)AddEntryAction:(id)sender;

@end
