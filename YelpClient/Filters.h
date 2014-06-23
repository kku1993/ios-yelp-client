//
//  Filters.h
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filters : NSObject

@property (strong, nonatomic) NSArray *mostPopular;
@property (strong, nonatomic) NSArray *generalFeatures;

- (void)setPrice:(int)index;
- (int)getPrice;

@end
