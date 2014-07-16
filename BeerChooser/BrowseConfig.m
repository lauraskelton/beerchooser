//
//  BrowseConfig.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseConfig.h"

#import "CoreDataStore.h"

#import "BrowseDataManager.h"
#import "BrowseInteractor.h"
#import "BrowsePresenter.h"
#import "BrowseWireframe.h"

#import "BeerChooserAPINetwork.h"
#import "BeerChooserAPIDataManager.h"

#import "PageType.h"

@interface BrowseConfig ()

@property (nonatomic, strong) BrowseWireframe *browseWireframe;

@end


@implementation BrowseConfig
@synthesize dataStore = _dataStore, pageType = _pageType;

- (id)initWithCoreDataStore:(CoreDataStore *)dataStore andPageType:(PageType *)pageType
{
    if ((self = [super init]))
    {
        self.dataStore = dataStore;
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
    
    // Network Classes
    BeerChooserAPINetwork *apiNetwork = [[BeerChooserAPINetwork alloc] init];
    BeerChooserAPIDataManager *apiDataManager = [[BeerChooserAPIDataManager alloc] init];
    
    BrowseInteractor *browseInteractor = [[BrowseInteractor alloc] initWithDataManager:browseDataManager andAPINetwork:apiNetwork];
    
    // Browse Module Classes
    browseInteractor.output = browsePresenter;
    
    browsePresenter.browseInteractor = browseInteractor;
    browsePresenter.browseWireframe = browseWireframe;
    browsePresenter.sectionTitle = self.pageType.pageTitle;
    
    browseWireframe.browsePresenter = browsePresenter;
    browseWireframe.pageTitle = self.pageType.pageTitle;
    self.browseWireframe = browseWireframe;
    
    browseDataManager.dataStore = self.dataStore;
    browseDataManager.indexString = self.pageType.indexKey;
    
    // Network Classes
    apiNetwork.apiDataManager = apiDataManager;
    apiNetwork.apiLink = self.pageType.apiLink;
    apiNetwork.apiNetworkDelegate = browseInteractor;
    
    apiDataManager.dataStore = self.dataStore;
    apiDataManager.indexString = self.pageType.indexKey;
    
}

@end
