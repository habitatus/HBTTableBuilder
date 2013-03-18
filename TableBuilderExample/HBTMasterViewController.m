//
//  HBTMasterViewController.m
//  TableBuilderExample
//
//  Created by Jurica Beroš on 3/18/13.
//  Copyright (c) 2013 Habitatus. All rights reserved.
//

#import "HBTMasterViewController.h"
#import "HBTTableBuilder.h"

@interface HBTMasterViewController ()
@property (nonatomic, strong) HBTTableBuilder *tableBuilder;

- (void)setupTable;

@end

@implementation HBTMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Example";
		self.tableBuilder = [[HBTTableBuilder alloc] init];
    }
    return self;
}
							
- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTable {
	
	// Create a section and add rows to it
	MDTableSection *section1 = [MDTableSection sectionWithTitle:@"Section 1"];
	[section1 addRowWithTitle:@""
				   setupBlock:^ UITableViewCell * (UITableViewCell *cell, NSIndexPath *indexPath) {
					   cell.textLabel.text = @"Row 1";
					   return cell;
				   }
				  actionBlock:^(UITableViewCell *cell, NSIndexPath *indexPath) {
					  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row 1"
																	  message:@"You tapped on row 1"
																	 delegate:self
															cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
					  [alert show];
				  }];
	[section1 addRowWithTitle:@""
				   setupBlock:^ UITableViewCell * (UITableViewCell *cell, NSIndexPath *indexPath) {
					   cell.textLabel.text = @"Row 2";
					   return cell;
				   }
				  actionBlock:^(UITableViewCell *cell, NSIndexPath *indexPath) {
					  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row 2"
																	  message:@"You tapped on row 2"
																	 delegate:self
															cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
					  [alert show];
				  }];

	// Add section to the table view
	[self.tableBuilder addSection:section1];

	
	
	// Repeat for as many sections as you need
	MDTableSection *section2 = [MDTableSection sectionWithTitle:@"Section 2"];
	[section2 addRowWithTitle:@""
				   setupBlock:^ UITableViewCell * (UITableViewCell *cell, NSIndexPath *indexPath) {
					   cell.textLabel.text = @"Row 3";
					   cell.detailTextLabel.text = @"Subtitle";
					   return cell;
				   }
				  actionBlock:^(UITableViewCell *cell, NSIndexPath *indexPath) {
					  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row 3"
																	  message:@"Subtitle"
																	 delegate:self
															cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
					  [alert show];
				  }];
	[section2 addRowWithTitle:@""
				   setupBlock:^ UITableViewCell * (UITableViewCell *cell, NSIndexPath *indexPath) {
					   cell.textLabel.text = @"Row 4";
					   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
					   return cell;
				   }
				  actionBlock:^(UITableViewCell *cell, NSIndexPath *indexPath) {
					  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row 4"
																	  message:@"You tapped on row 4"
																	 delegate:self
															cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
					  [alert show];
				  }];
	[section2 addRowWithTitle:@""
				   setupBlock:^ UITableViewCell * (UITableViewCell *cell, NSIndexPath *indexPath) {
					   cell.textLabel.text = @"Row 5";
					   return cell;
				   }
				  actionBlock:^(UITableViewCell *cell, NSIndexPath *indexPath) {
					  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row 5"
																	  message:@"You tapped on row 5"
																	 delegate:self
															cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
					  [alert show];
				  }];


	[self.tableBuilder addSection:section2];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.tableBuilder.sections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	MDTableSection *sectionObj = [self.tableBuilder.sections objectAtIndex:section];
	return sectionObj.title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	MDTableSection *sectionObj = [self.tableBuilder.sections objectAtIndex:section];
    return [sectionObj.rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

	cell = [self.tableBuilder configureCell:cell atIndexPath:indexPath];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	[self.tableBuilder runActionForCell:nil atIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self.tableBuilder canRunActionForRowAtIndexPath:indexPath];
}


@end
