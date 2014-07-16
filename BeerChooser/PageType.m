//
//  PageType.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "PageType.h"

static NSString * const PageTitleKey = @"Page_Title";
static NSString * const TabTitleKey = @"Tab_Title";
static NSString * const TabImageKey = @"Tab_Image";
static NSString * const APILinkKey = @"API_Link";
static NSString * const IndexNameKey = @"Index_Name";

@interface PageType ()
@property (nonatomic, strong) NSDictionary *plist;
@end

@implementation PageType

- (id)initWithDictionary:(NSDictionary *)otherDictionary
{
    self = [super init];
    if (!self) return nil;
    
    self.plist = otherDictionary;
    
    return self;
}

- (NSString *)pageTitle
{
    return self.plist[PageTitleKey];
}

- (NSString *)tabTitle
{
    return self.plist[TabTitleKey];
}

- (NSString *)tabImageName
{
    return self.plist[TabImageKey];
}

- (NSString *)apiLink
{
    return self.plist[APILinkKey];
}

- (NSString *)indexKey
{
    return self.plist[IndexNameKey];
}

@end


