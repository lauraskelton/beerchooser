//
//  BeerDetailWireframe.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailWireframe.h"

#import "BeerDetailPresenter.h"
#import "BeerDetailViewController.h"

#import "BrowseBeersDisplayItem.h"

static NSString *BeerDetailViewControllerIdentifier = @"BeerDetailViewController";

@interface BeerDetailWireframe ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation BeerDetailWireframe

- (void)presentBeerDetailInterfaceFromNavigationController:(UINavigationController *)navigationController withDisplayItem:(BrowseBeersDisplayItem *)displayItem
{
    BeerDetailViewController *beerDetailViewController = [self beerDetailViewController];
    beerDetailViewController.eventHandler = self.beerDetailPresenter;
    
    [self.beerDetailPresenter configureUserInterfaceForPresentation:beerDetailViewController withDisplayItem:displayItem];
    
    [navigationController pushViewController:beerDetailViewController animated:YES];
    
    self.navigationController = navigationController;
}


- (void)dismissBeerDetailInterface
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (BeerDetailViewController *)beerDetailViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    BeerDetailViewController *beerDetailViewController = [storyboard instantiateViewControllerWithIdentifier:BeerDetailViewControllerIdentifier];
    
    return beerDetailViewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
