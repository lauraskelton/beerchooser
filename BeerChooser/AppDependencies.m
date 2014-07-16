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

#import "BrowseConfig.h"

@interface AppDependencies ()

@property (nonatomic, retain) NSMutableArray *moduleArray;
@property (nonatomic, retain) NSMutableArray *viewControllersArray;
@property (nonatomic, retain) RootWireframe *rootWireframe;

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
    [self.rootWireframe showRootViewControllers:self.viewControllersArray inWindow:window];
}


- (void)configureDependencies
{
    // Root Level Classes
    CoreDataStore *dataStore = [[CoreDataStore alloc] init];
    self.rootWireframe = [[RootWireframe alloc] init];
    
    self.moduleArray = [@[] mutableCopy];
    self.viewControllersArray = [@[] mutableCopy];
    
    // Create Browse Module instance for each page
    for (int i = firstPage; i <= lastPage; i++) {
        // create this page and return view controller?
        // will this retain all of the module elements that we need?
        // maybe retain an array of BrowseConfig instances here to keep from losing them
        BrowseConfig *browseConfig = [[BrowseConfig alloc] initWithCoreDataStore:dataStore andPageType:i];
        [self.moduleArray addObject:browseConfig];
        [self.viewControllersArray addObject:browseConfig.viewController];
    }

}

@end
