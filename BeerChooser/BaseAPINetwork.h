//
//  BaseAPINetwork.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^APINetworkFetchSuccessBlock)(id JSON);
typedef void(^APINetworkFetchFailureBlock)(NSError *error);

@interface BaseAPINetwork : NSObject

- (void)apiRequestWithLink:(NSString *)apiLink
                parameters:(NSDictionary *)parameters
                   success:(APINetworkFetchSuccessBlock)successBlock
                   failure:(APINetworkFetchFailureBlock)failureBlock;

@end
