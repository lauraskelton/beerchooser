//
//  BeerDetailDataManager.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStore;
@class Beer;

@interface BeerDetailDataManager : NSObject

@property (nonatomic, strong) CoreDataStore *dataStore;

- (void)fetchDetailsForBeer:(Beer *)beer;

@end