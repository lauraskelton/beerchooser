//
//  BeerDetailModuleInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BeerDetailModuleInterface <NSObject>

- (void)cancelView;
- (void)saveRating:(NSNumber *)rating forBeer:(NSNumber *)beerID;

@end
