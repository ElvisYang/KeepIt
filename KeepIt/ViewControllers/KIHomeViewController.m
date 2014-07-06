//
//  HomeViewController.m
//  KeepIt
//
//  Created by Elvis on 2/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIHomeViewController.h"
#import <Parse/Parse.h>
#import <Parse/PFLogInViewController.h>
#import "KIUserAuthenticationViewController.h"

@interface KIHomeViewController ()

@end

@implementation KIHomeViewController

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

    //TODO: ignore authentication for testing
//    if (![PFUser currentUser])
//    {
//        KIUserAuthenticationViewController *authenticationController = [[KIUserAuthenticationViewController alloc] init];
//        [self presentViewController:authenticationController animated:YES completion:nil];
//    }
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

@end
