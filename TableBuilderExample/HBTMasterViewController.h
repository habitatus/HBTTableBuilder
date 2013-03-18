//
//  HBTMasterViewController.h
//  TableBuilderExample
//
//  Created by Jurica Beroš on 3/18/13.
//  Copyright (c) 2013 Habitatus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBTDetailViewController;

@interface HBTMasterViewController : UITableViewController

@property (strong, nonatomic) HBTDetailViewController *detailViewController;

@end
