//
//  SettingViewController.m
//  KeepIt
//
//  Created by Elvis on 3/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KISettingViewController.h"
#import <Parse/Parse.h>
#import "KIUserAuthenticationViewController.h"

@interface KISettingViewController ()

@end

@implementation KISettingViewController
@synthesize userName, userEmail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PFUser *currentUser = [PFUser currentUser];
    if(currentUser)
    {
        userName.text = currentUser.username;
        userEmail.text = currentUser.email;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logoutPress:(id)sender {
    [PFUser logOut];
    
    KIUserAuthenticationViewController *authenticationController = [[KIUserAuthenticationViewController alloc] init];
    [self presentViewController:authenticationController animated:YES completion:nil];
}
@end
