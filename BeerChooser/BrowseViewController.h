//
//  BrowseViewController.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BrowseViewInterface.h"
#import "BrowseModuleInterface.h"


@interface BrowseViewController : UITableViewController <BrowseViewInterface>

@property (nonatomic, strong) IBOutlet UIView*              noContentView;

@property (nonatomic, strong) id<BrowseModuleInterface>    eventHandler;

@end
