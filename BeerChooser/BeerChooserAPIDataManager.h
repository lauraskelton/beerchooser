//
//  BeerChooserAPIDataManager.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStore;
@class Beer;

@interface BeerChooserAPIDataManager : NSObject

@property (nonatomic, strong) CoreDataStore *dataStore;
@property (nonatomic, retain) NSString *indexString;

- (void)addNewBeer:(Beer *)aBeer;

@end
