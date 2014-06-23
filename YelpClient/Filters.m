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
        self.categories = [NSArray arrayWithObjects:@"Desserts", @"Foor Trucks", @"Gelato", @"Grocery", nil];
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
