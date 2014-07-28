//
//  BrowseCollectionViewController.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BrowseViewInterface.h"
#import "BrowseModuleInterface.h"

@interface BrowseCollectionViewController : UICollectionViewController <BrowseViewInterface>

@property (nonatomic, strong) IBOutlet UIView*              noContentView;

@property (nonatomic, strong) id<BrowseModuleInterface>    eventHandler;

@property (nonatomic, retain) NSString *pageTitle;

-(IBAction)refreshData:(id)sender;

@end
