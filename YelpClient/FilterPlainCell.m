//
//  FilterPlainCell.m
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "FilterPlainCell.h"

@implementation FilterPlainCell

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

- (void) initViews:(NSIndexPath *)indexPath {
    [super initViews:indexPath];

    if(indexPath.section == 2) {
        // distance
        self.cellLabel.text = [NSString stringWithFormat:@"%i miles", 5 * (indexPath.row + 1)];
    }
    else {
        // sort by
        NSString *text;
        switch(indexPath.row) {
            case 0:
                text = @"Best Match";
                break;
            case 1:
                text = @"Distance";
                break;
            case 2:
                text = @"Highest Rated";
                break;
            default:
                text = @"";
                break;
        }
        self.cellLabel.text = text;
    }
}

@end
