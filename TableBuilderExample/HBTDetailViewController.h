//
//  HBTDetailViewController.h
//  TableBuilderExample
//
//  Created by Jurica Beroš on 3/18/13.
//  Copyright (c) 2013 Habitatus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBTDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
