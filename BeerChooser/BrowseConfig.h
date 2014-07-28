//
//  BrowseConfig.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CoreDataStore, PageType, BaseAPINetwork, BaseImageDownloader;

@interface BrowseConfig : NSObject

@property (nonatomic, retain) CoreDataStore *dataStore;
@property (nonatomic, retain) BaseAPINetwork *baseAPINetwork;
@property (nonatomic, retain) BaseImageDownloader *baseImageDownloader;
@property (nonatomic, retain) PageType *pageType;
@property (nonatomic, retain) UIViewController *viewController;

- (id)initWithCoreDataStore:(CoreDataStore *)dataStore baseAPINetwork:(BaseAPINetwork *)baseAPINetwork baseImageDownloader:(BaseImageDownloader *)baseImageDownloader andPageType:(PageType *)pageType;

@end
