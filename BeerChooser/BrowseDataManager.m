//
//  BrowseDataManager.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseDataManager.h"

#import "ManagedBeer.h"
#import "CoreDataStore.h"
#import "Beer.h"
#import "NSArray+POBJ.h"


@implementation BrowseDataManager

- (void)browseBeersWithCompletionBlock:(void (^)(NSArray *browseBeers))completionBlock
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"toDrinkIndex != nil"];
    //NSArray *sortDescriptors = @[];
    NSArray *sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey: @"toDrinkIndex" ascending: YES]];
    
    __weak typeof(self) welf = self;
    [self.dataStore
     fetchEntriesWithPredicate:predicate
     sortDescriptors:sortDescriptors
     completionBlock:^(NSArray *entries) {
         if (completionBlock)
         {
             completionBlock([welf beersFromDataStoreEntries:entries]);
         }
     }];
}


- (NSArray *)beersFromDataStoreEntries:(NSArray *)entries
{
    return [entries arrayFromObjectsCollectedWithBlock:^id(ManagedBeer *aBeer) {
        return [Beer beerWithName:aBeer.beerName description:aBeer.beerDescription brewery:aBeer.brewery predictedRating:aBeer.predictedRating userRating:aBeer.userRating styleName:aBeer.styleName id:aBeer.beerID rateDate:aBeer.rateDate imgURL:aBeer.imgURL toDrinkIndex:aBeer.toDrinkIndex];
    }];
}

@end

