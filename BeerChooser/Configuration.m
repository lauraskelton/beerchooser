//
//  Configuration.m
//  SecretHandshake
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "Configuration.h"

static NSString * const BeerChooserDictKey = @"BeerChooserAPI";
static NSString * const TestFlightDictKey = @"TestFlightAPI";
static NSString * const UserAccountDictKey = @"UserAccountInfo";

@interface Configuration ()
@property (nonatomic, strong) NSDictionary *plist;
@end

@implementation Configuration

- (id)init {
    return [self initWithBundle:NSBundle.mainBundle];
}

- (id)initWithBundle:(NSBundle *)bundle {
    self = [super init];
    if (!self) return nil;
    
    NSString *plistPath = [bundle pathForResource:@"Configuration" ofType:@"plist"];
    if (plistPath == nil) {
        [NSException raise:@"FileNotFoundException" format:@"No Configuration.plist file was found."];
    }
    self.plist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    return self;
}

- (NSString *)beerChooserClientID {
    return self.plist[BeerChooserDictKey][@"ClientID"];
}

- (NSString *)beerChooserClientSecret {
    return self.plist[BeerChooserDictKey][@"ClientSecret"];
}

- (NSString *)testFlightAppID {
    return self.plist[TestFlightDictKey][@"AppID"];
}

- (NSString *)userAccountName {
    return self.plist[UserAccountDictKey][@"Username"];
}

- (NSString *)userAccountPassword {
    return self.plist[UserAccountDictKey][@"Password"];
}

@end
