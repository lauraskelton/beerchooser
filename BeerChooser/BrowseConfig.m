//
//  BrowseConfig.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseConfig.h"

#import "CoreDataStore.h"
#import "BaseAPINetwork.h"
#import "BaseImageDownloader.h"

#import "BrowseDataManager.h"
#import "BrowseInteractor.h"
#import "BrowsePresenter.h"
#import "BrowseWireframe.h"

#import "BrowseAPINetwork.h"
#import "BrowseAPIDataManager.h"

#import "BeerDetailDataManager.h"
#import "BeerDetailInteractor.h"
#import "BeerDetailPresenter.h"
#import "BeerDetailWireframe.h"

#import "BeerDetailAPINetwork.h"
#import "BeerDetailAPIDataManager.h"

#import "PageType.h"

@interface BrowseConfig ()

@property (nonatomic, strong) BrowseWireframe *browseWireframe;

@end


@implementation BrowseConfig
@synthesize dataStore = _dataStore, baseAPINetwork = _baseAPINetwork, baseImageDownloader = _baseImageDownloader, pageType = _pageType;

- (id)initWithCoreDataStore:(CoreDataStore *)dataStore baseAPINetwork:(BaseAPINetwork *)baseAPINetwork baseImageDownloader:(BaseImageDownloader *)baseImageDownloader andPageType:(PageType *)pageType
{
    if ((self = [super init]))
    {
        self.dataStore = dataStore;
        self.baseAPINetwork = baseAPINetwork;
        self.baseImageDownloader = baseImageDownloader;
        self.pageType = pageType;
        [self configureDependencies];
        self.viewController = [self browseViewController];
    }
    
    return self;
}


- (UIViewController *)browseViewController
{
    UIViewController *navigationController = [self.browseWireframe createBrowseNavigationController];
    navigationController.title = self.pageType.tabTitle;
    navigationController.tabBarItem.image = [UIImage imageNamed:self.pageType.tabImageName];
    return navigationController;
}


- (void)configureDependencies
{
    // Browse Modules Classes
    BrowseWireframe *browseWireframe = [[BrowseWireframe alloc] init];
    BrowsePresenter *browsePresenter = [[BrowsePresenter alloc] init];
    BrowseDataManager *browseDataManager = [[BrowseDataManager alloc] init];
    
    // Beer Detail Module Classes
    BeerDetailWireframe *beerDetailWireframe = [[BeerDetailWireframe alloc] init];
    BeerDetailPresenter *beerDetailPresenter = [[BeerDetailPresenter alloc] init];
    BeerDetailDataManager *beerDetailDataManager = [[BeerDetailDataManager alloc] init];
    
    // Network Classes
    BrowseAPINetwork *apiNetwork = [[BrowseAPINetwork alloc] init];
    apiNetwork.baseAPINetwork = self.baseAPINetwork;
    apiNetwork.baseImageDownloader = self.baseImageDownloader;
    BrowseAPIDataManager *apiDataManager = [[BrowseAPIDataManager alloc] init];
    
    BeerDetailAPINetwork *beerDetailAPINetwork = [[BeerDetailAPINetwork alloc] init];
    beerDetailAPINetwork.baseAPINetwork = self.baseAPINetwork;
    beerDetailAPINetwork.baseImageDownloader = self.baseImageDownloader;
    BeerDetailAPIDataManager *beerDetailAPIDataManager = [[BeerDetailAPIDataManager alloc] init];
    
    BeerDetailInteractor *beerDetailInteractor = [[BeerDetailInteractor alloc] initWithDataManager:beerDetailDataManager andAPINetwork:beerDetailAPINetwork];
    
    BrowseInteractor *browseInteractor = [[BrowseInteractor alloc] initWithDataManager:browseDataManager andAPINetwork:apiNetwork];
    
    // Browse Module Classes
    browseInteractor.output = browsePresenter;
    
    browsePresenter.browseInteractor = browseInteractor;
    browsePresenter.browseWireframe = browseWireframe;
    browsePresenter.sectionTitle = self.pageType.pageTitle;
    
    browseWireframe.browsePresenter = browsePresenter;
    browseWireframe.pageTitle = @"BEERCHOOSER";
    browseWireframe.beerDetailWireframe = beerDetailWireframe;
    self.browseWireframe = browseWireframe;
    
    browseDataManager.dataStore = self.dataStore;
    browseDataManager.indexString = self.pageType.indexKey;
    
    // Browse Network Classes
    apiNetwork.apiDataManager = apiDataManager;
    apiNetwork.apiLink = self.pageType.apiLink;
    apiNetwork.apiNetworkDelegate = browseInteractor;
    apiDataManager.dataStore = self.dataStore;
    apiDataManager.indexString = self.pageType.indexKey;
    
    // Beer Detail Module Classes
    beerDetailPresenter.beerDetailInteractor = beerDetailInteractor;
    
    beerDetailInteractor.output = beerDetailPresenter;
    
    beerDetailWireframe.beerDetailPresenter = beerDetailPresenter;
    
    beerDetailPresenter.beerDetailWireframe = beerDetailWireframe;
    beerDetailPresenter.beerDetailModuleDelegate = browsePresenter;
    
    beerDetailDataManager.dataStore = self.dataStore;
    
    // Beer Detail Network Classes
    beerDetailAPINetwork.apiDataManager = beerDetailAPIDataManager;
    beerDetailAPINetwork.apiNetworkDelegate = beerDetailInteractor;
    beerDetailAPIDataManager.dataStore = self.dataStore;
    
}

@end
