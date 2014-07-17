//
//  BeerDetailViewController.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BeerDetailModuleInterface.h"
#import "BeerDetailViewInterface.h"

@class BeerRatingView;

@interface BeerDetailViewController : UIViewController <BeerDetailViewInterface>

@property (nonatomic, strong) id<BeerDetailModuleInterface> eventHandler;

@end