//
//  BeerDetailAPINetwork.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailAPINetwork.h"
#import "BaseAPINetwork.h"
#import "BaseImageDownloader.h"
#import "BeerDetailAPIDataManager.h"
#import "BrowseBeer.h"

@interface BeerDetailAPINetwork ()

@end

@implementation BeerDetailAPINetwork

- (void)updateRating:(NSNumber *)newUserRating forBeerWithID:(NSNumber *)beerID
{
    [self.baseAPINetwork apiRequestWithLink:@"iosupdaterating.php"
                                 parameters:@{@"rating":[NSString stringWithFormat:@"%@", newUserRating],@"beerid":[NSString stringWithFormat:@"%@", beerID]}
                                    success:^(id JSON) {
                                        [self.apiDataManager updateRating:newUserRating forBeerWithID:beerID];
                                        [self.apiNetworkDelegate beerDetailAPIUpdatedRating];
                                    }
                                    failure:^(NSError *error) {
                                        NSLog(@"Error downloading beers to drink: %@", error);
                                        [self.apiNetworkDelegate beerDetailAPIError];
                                    }];
}

-(UIImage *)getImageForBeer:(BrowseBeer *)browseBeer
{
    return [self.baseImageDownloader getImageForBeerID:browseBeer.beerID URL:browseBeer.imgURL completion:^(UIImage *image) {
        if (image) {
            // return the image
            [self.apiNetworkDelegate beerDetailAPIGotImage:image forBrowseBeer:browseBeer];
        }
    }];
}

@end
