//
//  MDTableBuilder.m
//  Median
//
//  Created by Jurica Beroš on 1/7/13.
//  Copyright (c) 2013 Habitatus. All rights reserved.
//

#import "HBTTableBuilder.h"

@implementation HBTTableBuilder

- (id)init {
	self = [super init];
	if(self) {
		self.sections = [NSMutableArray array];
	}
	return self;
}

- (void)addSection:(MDTableSection *)section {
	[self.sections addObject:section];
}

- (MDTableSection *)addSectionWithTitle:(NSString *)title {
	MDTableSection *section = [MDTableSection sectionWithTitle:title];
	[self addSection:section];
	return section;
}


- (MDTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath {
	MDTableSection *section = [self.sections objectAtIndex:indexPath.section];
	MDTableRow *row = [section.rows objectAtIndex:indexPath.row];
	return row;
}

- (UITableViewCell *)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	MDTableRow *row = [self rowAtIndexPath:indexPath];
	if(row.setupBlock) {
		return row.setupBlock(cell, indexPath);
	} else return nil;
}

- (void)runActionForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	MDTableRow *row = [self rowAtIndexPath:indexPath];
	if(row.actionBlock)
		row.actionBlock(cell, indexPath);
}

- (BOOL)canRunActionForRowAtIndexPath:(NSIndexPath *)indexPath {
	MDTableRow *row = [self rowAtIndexPath:indexPath];
	return (row.actionBlock != nil);
}

@end


@implementation MDTableSection

+ (MDTableSection *)sectionWithTitle:(NSString *)title {
	MDTableSection *section = [[MDTableSection alloc] init];
	section.title = title;
	return section;
}

- (id)init {
	self = [super init];
	if(self) {
		self.rows = [NSMutableArray array];
	}
	return self;
}

- (void)addRow:(MDTableRow *)row {
	[self.rows addObject:row];
}

- (MDTableRow *)addRowWithTitle:(NSString *)title setupBlock:(HBTSetupBlock)setupBlock actionBlock:(HBTCellActionBlock)actionBlock {
	MDTableRow *row = [MDTableRow rowWithTitle:title setupBlock:setupBlock actionBlock:actionBlock];
	[self addRow:row];
	return row;
}

- (void)addRows:(NSArray *)rows {
	[self.rows addObjectsFromArray:rows];
}

@end



@implementation MDTableRow

+ (MDTableRow *)rowWithTitle:(NSString *)title setupBlock:(HBTSetupBlock)setupBlock actionBlock:(HBTCellActionBlock)actionBlock {
	MDTableRow *row = [[MDTableRow alloc] init];
	row.title = title;
	row.setupBlock = setupBlock;
	row.actionBlock = actionBlock;
	return row;
}

@end

