//
//  BrowseWireframe.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowsePresenter;
@class BrowseViewController;

@interface BrowseWireframe : NSObject

@property (nonatomic, strong) BrowsePresenter *browsePresenter;
@property (nonatomic, retain) NSString *pageTitle;

//- (void)presentBrowseInterfaceFromWindow:(UIWindow *)window;
-(UIViewController *)createBrowseNavigationController;

@end
