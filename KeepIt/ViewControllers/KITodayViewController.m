//
//  KITodayViewController.m
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KITodayViewController.h"
#import "KIEntryManager.h"
#import "KIRatingManager.h"
#import "RatingView.h"
#import "KIRating.h"
#import "KIEntryTableViewCell.h"

@interface KITodayViewController ()

@end

@implementation KITodayViewController
{
    NSArray* m_usedEntries;
    NSDictionary* m_todayRating;
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
//    m_usedEntries = [[KIEntryManager sharedInstance] getUsedEntries];
//    m_todayRating = [[KIRatingManager sharedInstance] getTodayRating];
    self.entriesTableView.dataSource = self;
    self.entriesTableView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    m_usedEntries = [[KIEntryManager sharedInstance] getUsedEntries];
    m_todayRating = [[KIRatingManager sharedInstance] getTodayRating];
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
    return m_usedEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KIEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell"];
    
    KIEntry* entry = m_usedEntries[indexPath.row];
    cell.entry = entry;
    
    cell.nameValue.text = entry.name;
    
    KIRating* rating = [m_todayRating objectForKey:[NSNumber numberWithInt:entry.id]];
    if(rating)
    {
        [cell.ratingView displayRating:rating.rating noCallback:YES];
    }
    
    return cell;
}

#pragma mark Rating View
-(void)ratingChanged:(float)newRating {
    ;
}

@end
