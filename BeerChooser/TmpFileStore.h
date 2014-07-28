//
//  TmpFileStore.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TmpFileStore : NSObject

+ (BOOL)saveImage:(UIImage *)image ForBeerID:(NSNumber *)beerID;

+ (UIImage *)savedImageForBeerID:(NSNumber *)beerID;

@end
