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

#import "BeerDetailWireframe.h"

#import "BrowseBeersDisplayData.h"
#import "BrowseBeersDisplaySection.h"
#import "BrowseBeer.h"


static NSString *BrowseViewControllerIdentifier = @"BrowseViewController";
static NSString *BrowseNavigationControllerIdentifier = @"BrowseNavigationController";

@interface BrowseWireframe ()

@property (nonatomic, strong) BrowseViewController *browseViewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation BrowseWireframe

- (void)presentBeerDetailInterfaceWithBrowseBeer:(BrowseBeer *)browseBeer
{
    [self.beerDetailWireframe presentBeerDetailInterfaceFromNavigationController:self.navigationController withBrowseBeer:browseBeer];
}

-(UIViewController *)createBrowseNavigationController
{
    UINavigationController *navigationController = [self navigationControllerFromStoryboard];
    navigationController.viewControllers = @[[self createBrowseViewController]];
    self.navigationController = navigationController;
    return navigationController;
}

- (UIViewController *)createBrowseViewController
{
    BrowseViewController *browseViewController = [self browseViewControllerFromStoryboard];
    browseViewController.eventHandler = self.browsePresenter;
    browseViewController.pageTitle = self.pageTitle;
    self.browsePresenter.userInterface = browseViewController;
    self.browseViewController = browseViewController;
    return browseViewController;
}

- (UINavigationController *)navigationControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:BrowseNavigationControllerIdentifier];
    
    return navigationController;
}

- (BrowseViewController *)browseViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    BrowseViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:BrowseViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)mainStoryboard
{
    NSString *storyboardName;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        storyboardName = @"Main_iPad";
    } else {
        storyboardName = @"Main_iPhone";
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
