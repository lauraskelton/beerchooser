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
@class RootWireframe;

@interface BrowseWireframe : NSObject

@property (nonatomic, strong) BrowsePresenter *browsePresenter;
@property (nonatomic, strong) RootWireframe *rootWireframe;

- (void)presentBrowseInterfaceFromWindow:(UIWindow *)window;

@end
