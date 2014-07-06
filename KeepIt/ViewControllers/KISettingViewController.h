//
//  SettingViewController.h
//  KeepIt
//
//  Created by Elvis on 3/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KISettingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userEmail;

- (IBAction)logoutPress:(id)sender;
@end
