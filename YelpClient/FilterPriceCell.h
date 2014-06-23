//
//  FilterPriceCell.h
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterCell.h"

@interface FilterPriceCell : FilterCell

@property (weak, nonatomic) IBOutlet UISegmentedControl *priceSelector;

@end
