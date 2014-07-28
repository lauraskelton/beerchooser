//
//  TmpFileStore.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "TmpFileStore.h"

@implementation TmpFileStore

+ (BOOL)saveImage:(UIImage *)image ForBeerID:(NSNumber *)beerID
{
    NSURL *tmpDirURL = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
    NSURL *fileURL = [[tmpDirURL URLByAppendingPathComponent:[NSString stringWithFormat:@"beer_label_%@", beerID]] URLByAppendingPathExtension:@"jpg"];
    NSLog(@"fileURL: %@", [fileURL path]);
    
    NSData* data = UIImageJPEGRepresentation(image, 0.85);
    return [data writeToURL:fileURL atomically:YES];
}

+ (UIImage *)savedImageForBeerID:(NSNumber *)beerID
{
    NSURL *tmpDirURL = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
    NSURL *fileURL = [[tmpDirURL URLByAppendingPathComponent:[NSString stringWithFormat:@"beer_label_%@", beerID]] URLByAppendingPathExtension:@"jpg"];
    NSLog(@"fileURL: %@", [fileURL path]);
    
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:fileURL]];
}

@end
