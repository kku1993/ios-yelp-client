//
//  Filters.m
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "Filters.h"

@implementation Filters

- (id)init {
    self = [super init];
    if(self) {
        self.mostPopular = [NSArray arrayWithObjects:@"Open Now", @"Hot & New", @"Offering a Deal", @"Delivery", nil];
        self.generalFeatures = [NSArray arrayWithObjects:@"Take-Out", @"Good for Groups", @"Takes Reservations", nil];
    }
    return self;
}

- (void)setPrice:(int)index {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:index forKey:@"price"];
    [defaults synchronize];
}

- (int)getPrice {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    @try{
        int defaultTipIndex = [defaults integerForKey:@"price"];
        return defaultTipIndex;
    }@catch (NSException *e) {
        NSLog(@"Exception %@", e);
        return 0;
    }
}


@end
