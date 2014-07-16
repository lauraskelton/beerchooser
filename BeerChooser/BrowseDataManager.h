//
//  BrowseDataManager.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStore;
@class Beer;

typedef void(^BrowseDataManagerFetchEntriesBlock)(NSArray *entries);

@interface BrowseDataManager : NSObject

@property (nonatomic, strong) CoreDataStore *dataStore;
@property (nonatomic, retain) NSString *indexString;

- (void)browseBeersWithCompletionBlock:(void (^)(NSArray *browseBeers))completionBlock;

@end
