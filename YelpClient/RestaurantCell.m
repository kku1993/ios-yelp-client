//
//  RestaurantCell.m
//  YelpClient
//
//  Created by Kevin Ku on 6/21/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "RestaurantCell.h"

@implementation RestaurantCell

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

- (RestaurantCell *)updateViews {
    NSURL *restaurantImgURL = [NSURL URLWithString:self.restaurantData[@"image_url"]];
    [self.restaurantImageView setImageWithURL:restaurantImgURL];
    
    NSURL *reviewImgURL = [NSURL URLWithString:self.restaurantData[@"rating_img_url"]];
    [self.restaurantReviewImage setImageWithURL:reviewImgURL];
    
    self.restaurantNameLabel.text = self.restaurantData[@"name"];
    self.restaurantAddressLabel.text = self.restaurantData[@"location"][@"address"][0];
    //self.restaurantReviewLabel.text = [NSString stringWithFormat:@"%@ reviews", self.restaurantData[@"review_count"]];
    self.restaurantStyleLabel.text = self.restaurantData[@"categories"][0][0];
    
    return self;
}

@end
