//
//  AllEntriesViewController.m
//  KeepIt
//
//  Created by Elvis on 5/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIAllEntriesViewController.h"
#import "KIAddEntryViewController.h"
#import "KIEntryManager.h"
#import "KIEntryForAllTableViewCell.h"

@interface KIAllEntriesViewController ()


@end

@implementation KIAllEntriesViewController
{
    NSArray* allEntries;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    allEntries = [[KIEntryManager sharedInstance] getAllEntries];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allEntries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KIEntryForAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCellForAll" forIndexPath:indexPath];
    
    KIEntry* entry = (KIEntry*)allEntries[indexPath.row];
    cell.entry = entry;
    
    ((UILabel*)cell.contentView.subviews[1]).text = entry.name;
    
    
    UISwitch* switcher = (UISwitch*)cell.contentView.subviews[2];
    switcher.on = entry.isUsed;
    
    //cell.textLabel.text = ((KIEntry*)allEntries[indexPath.row]).name;
    
    // Configure the cell...
    
    return cell;
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"EntryCellForAll"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        KIEntry* entry = [allEntries objectAtIndex:indexPath.row];
        if(entry)
        {
            ((KIAddEntryViewController*)[segue destinationViewController]).entry= entry;
        }
    }
}


@end
