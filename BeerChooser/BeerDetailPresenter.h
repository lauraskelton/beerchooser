//
//  BeerDetailPresenter.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BeerDetailModuleDelegateInterface.h"
#import "BeerDetailModuleInterface.h"
#import "BeerDetailInteractorIO.h"

@class BeerDetailInteractor;
@class BeerDetailWireframe;
@class BrowseBeer;
@protocol BeerDetailModuleDelegate;
@protocol BeerDetailViewInterface;

@interface BeerDetailPresenter : NSObject <BeerDetailInteractorOutput, BeerDetailModuleInterface>

@property (nonatomic, strong) id<BeerDetailInteractorInput>    beerDetailInteractor;
@property (nonatomic, strong) BeerDetailWireframe *beerDetailWireframe;

@property (nonatomic, weak) id<BeerDetailModuleDelegate> beerDetailModuleDelegate;

@property (nonatomic, strong) UIViewController<BeerDetailViewInterface> *userInterface;

- (void)configureUserInterfaceForPresentation:(id<BeerDetailViewInterface>)beerDetailViewUserInterface withBrowseBeer:(BrowseBeer *)browseBeer;

@end
