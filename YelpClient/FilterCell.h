//
//  FilterCell.h
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

// Generic interface to be implemented by all cells in the filter table view

#import <UIKit/UIKit.h>
#import "Filters.h"

@interface FilterCell : UITableViewCell

@property (strong, nonatomic) Filters *filters;

- (void)initViews:(NSIndexPath *)indexPath;

@end
