//
//  AppDependencies.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "AppDependencies.h"

#import "RootWireframe.h"

#import "CoreDataStore.h"

#import "BrowseDataManager.h"
#import "BrowseInteractor.h"
#import "BrowsePresenter.h"
#import "BrowseWireframe.h"

#import "BeerChooserAPINetwork.h"
#import "BeerChooserAPIDataManager.h"

@interface AppDependencies ()

@property (nonatomic, strong) BrowseWireframe *browseWireframe;

@end


@implementation AppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}


- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.browseWireframe presentBrowseInterfaceFromWindow:window];
}


- (void)configureDependencies
{
    // Root Level Classes
    CoreDataStore *dataStore = [[CoreDataStore alloc] init];
    RootWireframe *rootWireframe = [[RootWireframe alloc] init];
    
    // Browse Modules Classes
    BrowseWireframe *browseWireframe = [[BrowseWireframe alloc] init];
    BrowsePresenter *browsePresenter = [[BrowsePresenter alloc] init];
    BrowseDataManager *browseDataManager = [[BrowseDataManager alloc] init];
    BrowseInteractor *browseInteractor = [[BrowseInteractor alloc] initWithDataManager:browseDataManager];
    
    // Network Classes
    BeerChooserAPINetwork *apiNetwork = [BeerChooserAPINetwork shared];
    BeerChooserAPIDataManager *apiDataManager = [[BeerChooserAPIDataManager alloc] init];
    
    // Browse Module Classes
    browseInteractor.output = browsePresenter;
    
    browsePresenter.browseInteractor = browseInteractor;
    browsePresenter.browseWireframe = browseWireframe;
    
    browseWireframe.browsePresenter = browsePresenter;
    browseWireframe.rootWireframe = rootWireframe;
    self.browseWireframe = browseWireframe;
    
    browseDataManager.dataStore = dataStore;
    
    // Network Classes
    apiNetwork.apiDataManager = apiDataManager;

    apiNetwork.apiNetworkDelegate = browseInteractor;
    
    apiDataManager.dataStore = dataStore;

}

@end
