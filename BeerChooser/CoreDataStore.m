//
//  CoreDataStore.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "CoreDataStore.h"
#import "ManagedBeer.h"

@interface CoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataStore

- (id)init
{
    if ((self = [super init]))
    {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"BEERCHOOSER.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
        
    }
    
    return self;
}


- (void)fetchEntriesWithPredicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                  completionBlock:(DataStoreFetchCompletionBlock)completionBlock
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Beer"];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setSortDescriptors:nil];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (completionBlock)
        {
            completionBlock(results);
        }
    }];
}

-(ManagedBeer *)newBeerWithUniqueID:(NSNumber *)uniqueBeerID
{
    ManagedBeer *newBeer = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    request.entity = [NSEntityDescription entityForName:@"Beer" inManagedObjectContext:self.managedObjectContext];
    request.predicate = [NSPredicate predicateWithFormat:@"beerID = %@",uniqueBeerID];
    NSError *executeFetchError= nil;
    newBeer = [[self.managedObjectContext executeFetchRequest:request error:&executeFetchError] lastObject];
    
    if (executeFetchError) {
        NSLog(@"[%@, %@] error looking up beer with beerID: %@ with error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), uniqueBeerID, [executeFetchError localizedDescription]);
    } else if(!newBeer) {
        
        newBeer = [NSEntityDescription insertNewObjectForEntityForName:@"Beer"
                                                inManagedObjectContext:self.managedObjectContext];
        
    }
    
    return newBeer;
}


- (void)save
{
    [self.managedObjectContext save:NULL];
}

@end
