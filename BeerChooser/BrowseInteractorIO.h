//
//  BrowseInteractorIO.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BrowseInteractorInput <NSObject>
- (void)findBrowseBeers;
@end


@protocol BrowseInteractorOutput <NSObject>

- (void)foundBeers:(NSArray *)beers;

@end
