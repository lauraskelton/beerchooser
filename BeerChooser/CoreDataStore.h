//
//  CoreDataStore.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@class ManagedBeer;

typedef void(^DataStoreFetchCompletionBlock)(NSArray *results);

@interface CoreDataStore : NSObject

- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                  completionBlock:(DataStoreFetchCompletionBlock)completionBlock;

-(ManagedBeer *)newBeerWithUniqueID:(NSNumber *)uniqueBeerID;

- (void)save;

@end
