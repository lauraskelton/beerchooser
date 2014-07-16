//
//  PageTypeDef.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

typedef NS_ENUM(NSInteger, PageType) {
    firstPage = 0,
    PAGE_NEARBY = firstPage,
    PAGE_RATINGS,
    PAGE_POPULAR,
    PAGE_SUGGESTIONS,
    lastPage = PAGE_SUGGESTIONS
};
