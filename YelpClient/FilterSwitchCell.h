//
//  FilterSwitchCell.h
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCell.h"

@interface FilterSwitchCell : FilterCell
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;

@property (strong, nonatomic) NSIndexPath *indexPath;

@end
