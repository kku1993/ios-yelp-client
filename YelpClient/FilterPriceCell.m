//
//  FilterPriceCell.m
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "FilterPriceCell.h"

@implementation FilterPriceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self.filters setPrice:self.priceSelector.selectedSegmentIndex];
}

- (void)initViews:(NSIndexPath *)indexPath {
    [super initViews:indexPath];
    self.priceSelector.selectedSegmentIndex = [self.filters getPrice];
}

@end
