//
//  PageType.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageType : NSObject

@property (nonatomic, readonly) NSString *pageTitle;
@property (nonatomic, readonly) NSString *tabTitle;
@property (nonatomic, readonly) NSString *tabImageName;
@property (nonatomic, readonly) NSString *apiLink;
@property (nonatomic, readonly) NSString *indexKey;

- (id)initWithDictionary:(NSDictionary *)otherDictionary;

@end
