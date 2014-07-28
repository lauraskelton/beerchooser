//
//  BaseImageDownloader.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BaseImageDownloader.h"
#import "AFNetworking.h"
#import "TmpFileStore.h"

static NSString * const kAFBeerChooserImageURLString = @"http://beerchooser.com/components/com_virtuemart/shop_image/product/";

@interface BaseImageDownloader ()

@property (nonatomic, retain) AFHTTPSessionManager *manager;

- (void)downloadImageWithURL:(NSString *)imageURL
                  completion:(APINetworkImageDownloadCompletionBlock)completionBlock;

@end

@implementation BaseImageDownloader

- (id)init
{
    if ((self = [super init]))
    {
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kAFBeerChooserImageURLString]];
        self.manager.responseSerializer = [AFImageResponseSerializer serializer];
    }
    
    return self;
}

-(UIImage *)getImageForBeerID:(NSNumber *)beerID URL:(NSString *)imgURL completion:(APINetworkImageDownloadCompletionBlock)completionBlock
{
    // first, check if the image is already saved
    
    UIImage *beerImage = [TmpFileStore savedImageForBeerID:beerID];
    
    if (beerImage) {
        // return the image
        return beerImage;
    } else {
        // if not, tell the API manager to download the image
        [self downloadImageWithURL:imgURL completion:^(UIImage *image) {
            if (image) {
                // save the image
                [TmpFileStore saveImage:image ForBeerID:beerID];
                
                if (completionBlock)
                {
                    completionBlock(image);
                }
            }
        }];
    }
    return nil;
}

- (void)downloadImageWithURL:(NSString *)imageURL
                  completion:(APINetworkImageDownloadCompletionBlock)completionBlock
{
    [self.manager GET:[kAFBeerChooserImageURLString stringByAppendingString:imageURL]
           parameters:nil
              success:^(NSURLSessionDataTask *task, id UIImage) {
                  if (completionBlock)
                  {
                      completionBlock(UIImage);
                  }
              }
              failure:^(NSURLSessionDataTask *task, NSError *error) {
                  NSLog(@"error downloading image: %@", error);
                  if (completionBlock)
                  {
                      completionBlock(nil);
                  }
              }];
}

@end
