//
//  BeerChooserAPIManager.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseAPINetwork.h"
#import "BaseAPINetwork.h"
#import "BrowseAPIDataManager.h"
#import "Beer.h"

@interface BrowseAPINetwork ()

- (void)saveNewBeerWithName:(NSString *)name brewery:(NSString *)brewery predictedRating:(NSNumber *)predictedRating userRating:(NSNumber *)userRating styleName:(NSString *)styleName id:(NSNumber *)beerid imgURL:(NSString *)imgURL index:(NSNumber *)index;

@end

@implementation BrowseAPINetwork

-(void)getBeersToDrink
{
    [self.baseAPINetwork apiRequestWithLink:self.apiLink
                             parameters:@{@"startnum":@"0",@"limit":@"20"}
        success:^(id JSON) {
            NSArray *beersArray = [JSON objectForKey:@"beers"];
            if (beersArray) {
                NSLog(@"beers array: %@", beersArray);
                for (NSDictionary *beerDictionary in beersArray) {
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
                [self.apiNetworkDelegate browseAPIGotData];
            }
        }
        failure:^(NSError *error) {
            NSLog(@"Error downloading beers to drink: %@", error);
            [self.apiNetworkDelegate browseAPIError];
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
