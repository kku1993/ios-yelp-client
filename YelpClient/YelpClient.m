//
//  YelpClient.m
//  YelpClient
//
//  Created by Kevin Ku on 6/21/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "YelpClient.h"

@implementation YelpClient

- (id)init {
    // load API keys from config
    NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSDictionary *config = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return [self initWithConsumerKey:config[@"consumer_key"] consumerSecret:config[@"consumer_secret"] accessToken:config[@"token"] accessSecret:config[@"token_secret"]];
}

- (id)initWithConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken accessSecret:(NSString *)accessSecret {
    NSURL *baseURL = [NSURL URLWithString:@"http://api.yelp.com/v2/"];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        BDBOAuthToken *token = [BDBOAuthToken tokenWithToken:accessToken secret:accessSecret expiration:nil];
        [self.requestSerializer saveAccessToken:token];
    }
    return self;
}

- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSDictionary *parameters = @{@"term": term, @"location" : @"San Francisco"};
    
    return [self GET:@"search" parameters:parameters success:success failure:failure];
}

@end
