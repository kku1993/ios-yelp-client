//
//  RestaurantCell.h
//  YelpClient
//
//  Created by Kevin Ku on 6/21/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+AFNetworking.h>

@interface RestaurantCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *restaurantReviewImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurantReviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *restaurantStyleLabel;

@property (weak, nonatomic) NSDictionary *restaurantData;

- (RestaurantCell *)updateViews;

@end
