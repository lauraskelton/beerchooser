//
//  BaseImageDownloader.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^APINetworkImageDownloadCompletionBlock)(UIImage *image);

@interface BaseImageDownloader : NSObject

-(UIImage *)getImageForBeerID:(NSNumber *)beerID URL:(NSString *)imgURL completion:(APINetworkImageDownloadCompletionBlock)completionBlock;

@end
