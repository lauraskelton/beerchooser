//
//  BrowseCollectionViewController.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseCollectionViewController.h"

#import "BrowseBeersDisplayData.h"
#import "BrowseBeersDisplaySection.h"
#import "BrowseBeer.h"
#import "BeerCollectionViewCell.h"

@interface BrowseCollectionViewController ()

@property (nonatomic, strong)   BrowseBeersDisplayData* data;

// The view controller seems to have a weak reference to the table view.
// We need to keep a strong reference to the table view for times when we remove the table view from the view controller
@property (nonatomic, strong)   UICollectionView*            strongCollectionView;

-(NSArray *)getVisibleItemsAndPaths:(id)sender;

@end

@implementation BrowseCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.strongCollectionView = self.collectionView;
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"BeerCollectionViewCell"];
    [self configureView];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.eventHandler updateView];
}

-(IBAction)refreshData:(id)sender
{
    [self.eventHandler updateView];
    
}

- (void)configureView
{
    self.navigationItem.title = self.pageTitle;
    
}


- (void)showNoContentMessage
{
    self.view = self.noContentView;
}


- (void)showBrowseBeersDisplayData:(BrowseBeersDisplayData *)data
{
    self.view = self.strongCollectionView;
    //[self.refreshControl endRefreshing];
    
    self.data = data;
    [self reloadEntries];
}

- (void)browseBeer:(BrowseBeer *)browseBeer foundImage:(UIImage *)image
{
    NSIndexPath *beerIndexPath = [self indexPathForVisibleItem:browseBeer];
    if (beerIndexPath) {
        // this beer is currently visible
        BeerCollectionViewCell *cell = (BeerCollectionViewCell *)[self.strongCollectionView cellForItemAtIndexPath:beerIndexPath];
        cell.beerLabelImageView.image = image;
    }
    // we don't need to do anything if the beer is not visible
}


- (void)reloadEntries
{
    [self.collectionView reloadData];
}

-(NSArray *)getVisibleItemsAndPaths:(id)sender
{
    NSMutableArray *visibleItems = [@[] mutableCopy];
    for (NSIndexPath *indexPath in [self.collectionView indexPathsForVisibleItems]) {
        BrowseBeersDisplaySection *section = self.data.sections[indexPath.section];
        BrowseBeer *item = section.items[indexPath.row];
        [visibleItems addObject:@{@"indexPath":indexPath, @"item": item}];
    }
    return visibleItems;
}

-(NSIndexPath *)indexPathForVisibleItem:(BrowseBeer *)item
{
    NSArray *visibleItems = [self getVisibleItemsAndPaths:nil];
    
    for (NSDictionary *itemDict in visibleItems) {
        if ([itemDict[@"item"] isEqual:item]) {
            return itemDict[@"indexPath"];
        }
    }
    return nil;
}

#pragma mark - UICollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.data.sections count];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    BrowseBeersDisplaySection *browseSection = self.data.sections[section];
    
    return [browseSection.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BrowseBeersDisplaySection *section = self.data.sections[indexPath.section];
    BrowseBeer *item = section.items[indexPath.row];
    
    BeerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BeerCollectionViewCell" forIndexPath:indexPath];
    
    cell.beerTitleLabel.text = item.beerName;
    cell.breweryLabel.text = item.brewery;
    [cell setPredictedRating:item.predictedRating userRating:item.userRating];
    cell.beerLabelImageView.image = [self.eventHandler findImageWithBrowseBeer:item];
        
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    BrowseBeersDisplaySection *section = self.data.sections[indexPath.section];
    BrowseBeer *item = section.items[indexPath.row];
    
    [self.eventHandler showDetailViewWithBrowseBeer:item];
    
}

@end
