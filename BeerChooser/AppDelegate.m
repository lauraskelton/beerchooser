//
//  AppDelegate.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/7/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDependencies.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppDependencies *dependencies;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    AppDependencies *dependencies = [[AppDependencies alloc] init];
    self.dependencies = dependencies;
    
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}

@end
