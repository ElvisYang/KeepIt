//
//  AddEntryViewController.m
//  KeepIt
//
//  Created by Elvis on 5/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIAddEntryViewController.h"
#import "KIEntryManager.h"

@interface KIAddEntryViewController ()

@end

@implementation KIAddEntryViewController

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
    
    if(self.entry)
    {
        self.nameValue.text = self.entry.name;
        self.navigationItem.title = @"Edit Entry";
    }
    else
        self.navigationItem.title = @"Add Entry";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddEntryAction:(id)sender {
    if(self.entry)
    {
        self.entry.name = self.nameValue.text;
        [[KIEntryManager sharedInstance] updateEntry:self.entry];
    }
    else
    {
        KIEntry* entry = [[KIEntry alloc] init];
        entry.name = self.nameValue.text;
        entry.isUsed = true;
        
        [[KIEntryManager sharedInstance] addEntry:entry];
    }

    [self.navigationController popViewControllerAnimated:YES];
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
