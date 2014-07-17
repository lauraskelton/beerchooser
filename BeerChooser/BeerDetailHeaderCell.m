//
//  BeerDetailHeaderCell.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailHeaderCell.h"

@implementation BeerDetailHeaderCell
@synthesize beerTitleLabel,breweryLabel,abvLabel,styleLabel,labelImageView;

- (void)awakeFromNib
{
    // Initialization code
    self.labelImageView.layer.cornerRadius = 10.0;
    self.labelImageView.clipsToBounds = YES;
}

@end
