//
//  KIHistoryByDateViewController.m
//  KeepIt
//
//  Created by Elvis on 12/7/14.
//  Copyright (c) 2014 Elvis. All rights reserved.
//

#import "KIHistoryByDateViewController.h"

@interface KIHistoryByDateViewController ()

@end

@implementation KIHistoryByDateViewController

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

- ( UIViewController * ) pageViewController : ( UIPageViewController * ) pageViewController viewControllerBeforeViewController : ( UIViewController * ) viewController
{
    return self;
//    
//    NSUInteger index = ( ( PageContentViewController * ) viewController ) .pageIndex;
//    
//    if ( ( index == 0 ) || ( index == NSNotFound ) ) {
//        return nil ;
//    }
//    
//    index -- ;
//    return [ self viewControllerAtIndex : index ] ;
}

- ( UIViewController * ) pageViewController : ( UIPageViewController * ) pageViewController viewControllerAfterViewController : ( UIViewController * ) viewController
{
//    NSUInteger index = ( ( PageContentViewController * ) viewController ) .pageIndex;
//    
//    if ( index == NSNotFound ) {
//        return nil ;
//    }
//    
//    index ++ ;
//    if ( index == [ self.pageTitles count ] ) {
//        return nil ;
//    }
//    return [ self viewControllerAtIndex : index ] ;

    return self;
}

@end
