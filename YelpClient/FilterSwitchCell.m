//
//  FilterSwitchCell.m
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "FilterSwitchCell.h"

@implementation FilterSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initViews:(NSIndexPath *)indexPath {
    [super initViews:indexPath];
    self.indexPath = indexPath;
    
    if(indexPath.section == 1) {
        // most popular
        self.descriptionLabel.text = self.filters.mostPopular[indexPath.row];
    }
    else {
        // general feature
        self.descriptionLabel.text = self.filters.generalFeatures[indexPath.row];
    }
}

@end
