//
//  KITodayViewController.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KITodayViewController.h"
#import "KIEntryManager.h"

@interface KITodayViewController ()

@end

@implementation KITodayViewController
{
    NSArray* usedEntries;
}

@synthesize entriesTableView;

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
    usedEntries = [[KIEntryManager sharedInstance] getUsedEntries];
    self.entriesTableView.dataSource = self;
    self.entriesTableView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    usedEntries = [[KIEntryManager sharedInstance] getUsedEntries];
    [self.entriesTableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return usedEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell"];
    
//    KIEntry* entry = (KIEntry*)usedEntries[indexPath.row];
//    cell.entry = entry;
//    
//    ((UILabel*)cell.contentView.subviews[1]).text = entry.name;
//    
//    
//    UISwitch* switcher = (UISwitch*)cell.contentView.subviews[2];
//    switcher.on = entry.isUsed;
//    
    cell.textLabel.text = ((KIEntry*)usedEntries[indexPath.row]).name;
//    
//    // Configure the cell...
    
    return cell;
}

@end
