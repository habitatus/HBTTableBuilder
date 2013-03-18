//
//  MDTableBuilder.h
//  Median
//
//  Created by Jurica Beroš on 1/7/13.
//  Copyright (c) 2013 Habitatus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UITableViewCell * (^HBTSetupBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
typedef void (^HBTCellActionBlock)(UITableViewCell *cell, NSIndexPath *indexPath);

@class MDTableSection;
@class MDTableRow;

@interface HBTTableBuilder : NSObject

@property (nonatomic, strong) NSMutableArray *sections;

- (void)addSection:(MDTableSection *)section;
- (MDTableSection *)addSectionWithTitle:(NSString *)title;
- (MDTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)runActionForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (BOOL)canRunActionForRowAtIndexPath:(NSIndexPath *)indexPath;

@end





// Table section
@interface MDTableSection : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *rows;

+ (MDTableSection *)sectionWithTitle:(NSString *)title;
- (void)addRow:(MDTableRow *)row;
- (MDTableRow *)addRowWithTitle:(NSString *)title setupBlock:(HBTSetupBlock)setupBlock actionBlock:(HBTCellActionBlock)actionBlock;
- (void)addRows:(NSArray *)rows;

@end





// Table section row
@interface MDTableRow : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) HBTSetupBlock setupBlock;
@property (nonatomic, strong) HBTCellActionBlock actionBlock;

+ (MDTableRow *)rowWithTitle:(NSString *)title setupBlock:(HBTSetupBlock)setupBlock actionBlock:(HBTCellActionBlock)actionBlock;

@end
