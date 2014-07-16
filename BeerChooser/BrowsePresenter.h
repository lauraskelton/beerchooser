//
//  BrowsePresenter.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BrowseModuleInterface.h"
#import "BrowseInteractorIO.h"
#import "BrowseWireframe.h"

@protocol BrowseViewInterface;

@interface BrowsePresenter : NSObject <BrowseInteractorOutput, BrowseModuleInterface>

@property (nonatomic, strong) id<BrowseInteractorInput>    browseInteractor;
@property (nonatomic, strong) BrowseWireframe*             browseWireframe;

@property (nonatomic, strong) UIViewController<BrowseViewInterface> *userInterface;

@property (nonatomic, retain) NSString *sectionTitle;

@end