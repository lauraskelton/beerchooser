//
//  BeerChooserAPIManager.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerChooserAPINetwork.h"
#import "Configuration.h" // do this here or separate oauth handler with new API eventually?
#import "AFNetworking.h"
#import "BeerChooserAPIDataManager.h"
#import "Beer.h"

static NSString * const kAFBeerChooserBaseURLString = @"http://beerchooser.com/";

@interface BeerChooserAPINetwork ()

@property (nonatomic, retain) NSString *beerChooserClientID;
@property (nonatomic, retain) NSString *beerChooserClientSecret;
@property (nonatomic, retain) AFHTTPSessionManager *manager;

@property (nonatomic, retain) NSString *userAccountName;
@property (nonatomic, retain) NSString *userAccountPassword;

- (void)saveNewBeerWithName:(NSString *)name brewery:(NSString *)brewery predictedRating:(NSNumber *)predictedRating userRating:(NSNumber *)userRating styleName:(NSString *)styleName id:(NSNumber *)beerid imgURL:(NSString *)imgURL index:(NSNumber *)index;

@end

@implementation BeerChooserAPINetwork

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

-(void)getBeersToDrink
{
    [self.manager POST:self.apiLink
            parameters:@{@"startnum":@"0",@"limit":@"20",@"username":self.userAccountName,@"password":self.userAccountPassword}
               success:^(NSURLSessionDataTask *task, id JSON) {
                   NSArray *beersArray = [JSON objectForKey:@"beers"];
                   if (beersArray) {
                       NSLog(@"beers array: %@", beersArray);
                       for (NSDictionary *beerDictionary in beersArray) {
                           //NSLog(@"beerDictionary: %@", beerDictionary);
                           [self saveNewBeerWithName:beerDictionary[@"beername"]
                                             brewery:beerDictionary[@"brewery"]
                                     predictedRating:@([beerDictionary[@"predictnum"] integerValue])
                                          userRating:@([beerDictionary[@"ratenum"] integerValue])
                                           styleName:beerDictionary[@"style"]
                                                  id:@([beerDictionary[@"productid"] integerValue])
                                              imgURL:beerDictionary[@"imageurl"]
                                        index:@([beerDictionary[@"id"] integerValue])
                            ];
                       }
                       [self.apiNetworkDelegate beerChooserAPIGotData];
                   } else {
                       NSLog(@"Error downloading beers to drink: %@", [JSON objectForKey:@"error"]);
                   }
               }
               failure:^(NSURLSessionDataTask *task, NSError *error) {
                   NSLog(@"Error downloading beers to drink: %@", error);
                   [self.apiNetworkDelegate beerChooserAPIError];
               }];
}

- (void)saveNewBeerWithName:(NSString *)name brewery:(NSString *)brewery predictedRating:(NSNumber *)predictedRating userRating:(NSNumber *)userRating styleName:(NSString *)styleName id:(NSNumber *)beerid imgURL:(NSString *)imgURL index:(NSNumber *)index
{
    Beer *newBeer = [Beer beerWithName:name
                           description:nil
                               brewery:brewery
                       predictedRating:predictedRating
                            userRating:userRating
                             styleName:styleName
                                    id:beerid
                              rateDate:nil
                                imgURL:imgURL
                          index:index];
        
    [self.apiDataManager addNewBeer:newBeer];
}

@end
