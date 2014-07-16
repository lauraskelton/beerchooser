//
//  Configuration.h
//  SecretHandshake
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject

@property (nonatomic, readonly) NSString *beerChooserClientID;
@property (nonatomic, readonly) NSString *beerChooserClientSecret;
@property (nonatomic, readonly) NSString *testFlightAppID;
@property (nonatomic, readonly) NSString *userAccountName;
@property (nonatomic, readonly) NSString *userAccountPassword;

@end