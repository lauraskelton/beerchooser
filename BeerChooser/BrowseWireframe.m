//
//  BrowseWireframe.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseWireframe.h"

#import "BrowsePresenter.h"
#import "BrowseViewController.h"
#import "RootWireframe.h"

#import "BrowseBeersDisplayData.h"
#import "BrowseBeersDisplaySection.h"
#import "BrowseBeersDisplayItem.h"


static NSString *BrowseViewControllerIdentifier = @"BrowseViewController";

@interface BrowseWireframe ()

@property (nonatomic, strong) BrowseViewController *browseViewController;

@end

@implementation BrowseWireframe

- (void)presentBrowseInterfaceFromWindow:(UIWindow *)window
{
    BrowseViewController *browseViewController = [self browseViewControllerFromStoryboard];
    browseViewController.eventHandler = self.browsePresenter;
    self.browsePresenter.userInterface = browseViewController;
    self.browseViewController = browseViewController;
    
    [self.rootWireframe showRootViewController:browseViewController
                                      inWindow:window];
}

- (BrowseViewController *)browseViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    BrowseViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:BrowseViewControllerIdentifier];
    
    return viewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
