//
//  BaseAPINetwork.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BaseAPINetwork.h"
#import "Configuration.h" // do this here or separate oauth handler with new API eventually?
#import "AFNetworking.h"

static NSString * const kAFBeerChooserBaseURLString = @"http://beerchooser.com/";

@interface BaseAPINetwork ()

@property (nonatomic, retain) NSString *beerChooserClientID;
@property (nonatomic, retain) NSString *beerChooserClientSecret;
@property (nonatomic, retain) AFHTTPSessionManager *manager;

@property (nonatomic, retain) NSString *userAccountName;
@property (nonatomic, retain) NSString *userAccountPassword;

@end

@implementation BaseAPINetwork

- (id)init
{
    if ((self = [super init]))
    {
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kAFBeerChooserBaseURLString]];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        Configuration *config = [Configuration new];
        self.beerChooserClientID = config.beerChooserClientID;
        self.beerChooserClientSecret = config.beerChooserClientSecret;
        
        self.userAccountName = config.userAccountName;
        self.userAccountPassword = config.userAccountPassword;
        config = nil;
    }
    
    return self;
}

- (void)apiRequestWithLink:(NSString *)apiLink
                parameters:(NSDictionary *)parameters
                   success:(APINetworkFetchSuccessBlock)successBlock
                   failure:(APINetworkFetchFailureBlock)failureBlock
{
    NSMutableDictionary *paramDictionary = [parameters mutableCopy];
    [paramDictionary addEntriesFromDictionary:@{@"username":self.userAccountName,@"password":self.userAccountPassword}];
    
    [self.manager POST:apiLink
            parameters:paramDictionary
               success:^(NSURLSessionDataTask *task, id JSON) {
                   if ([JSON objectForKey:@"error"]) {
                       if (failureBlock)
                       {
                           failureBlock([NSError errorWithDomain:@"BeerChooser" code:1 userInfo:@{NSLocalizedDescriptionKey:[JSON objectForKey:@"error"]}]);
                       }
                   }
                   if (successBlock)
                   {
                       successBlock(JSON);
                   }
               }
               failure:^(NSURLSessionDataTask *task, NSError *error) {
                   if (failureBlock)
                   {
                       failureBlock(error);
                   }
               }];
}

@end
