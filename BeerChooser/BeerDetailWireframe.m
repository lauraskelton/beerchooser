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

#import "BrowseBeer.h"

static NSString *BeerDetailViewControllerIdentifier = @"BeerDetailViewController";

@interface BeerDetailWireframe ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation BeerDetailWireframe

- (void)presentBeerDetailInterfaceFromNavigationController:(UINavigationController *)navigationController withBrowseBeer:(BrowseBeer *)browseBeer
{
    BeerDetailViewController *beerDetailViewController = [self beerDetailViewController];
    beerDetailViewController.eventHandler = self.beerDetailPresenter;
    self.beerDetailPresenter.userInterface = beerDetailViewController;
    
    [self.beerDetailPresenter configureUserInterfaceForPresentation:beerDetailViewController withBrowseBeer:browseBeer];
    
    [self showDetailView:beerDetailViewController inNavigationController:navigationController];
    
    self.navigationController = navigationController;
}

- (void)showDetailView:(UIViewController *)detailView inNavigationController:(UINavigationController *)navigationController
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        detailView.modalPresentationStyle = UIModalPresentationFormSheet;
        [navigationController presentViewController:detailView animated:YES completion:nil];
    } else {
        [navigationController pushViewController:detailView animated:YES];
    }
}

- (void)dismissBeerDetailInterface
{
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (BeerDetailViewController *)beerDetailViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    BeerDetailViewController *beerDetailViewController = [storyboard instantiateViewControllerWithIdentifier:BeerDetailViewControllerIdentifier];
    
    return beerDetailViewController;
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
