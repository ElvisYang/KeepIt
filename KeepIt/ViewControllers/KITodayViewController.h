//
//  KITodayViewController.h
//  KeepIt
//
//  Created by Elvis on 6/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KITodayViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *entriesTableView;
@end
