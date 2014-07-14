//
//  BrowseViewController.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseViewController.h"

#import "Beer.h"
#import "BrowseBeersDisplayData.h"
#import "BrowseBeersDisplaySection.h"
#import "BrowseBeersDisplayItem.h"


static NSString* const BrowseEntryCellIdentifier = @"BrowseEntryCell";


@interface BrowseViewController ()

@property (nonatomic, strong)   BrowseBeersDisplayData* data;

// The view controller seems to have a weak reference to the table view.
// We need to keep a strong reference to the table view for times when we remove the table view from the view controller
@property (nonatomic, strong)   UITableView*            strongTableView;

@end


@implementation BrowseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.strongTableView = self.tableView;
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


- (void)configureView
{
    self.navigationItem.title = @"BEERCHOOSER";
    
}


- (void)showNoContentMessage
{
    self.view = self.noContentView;
}


- (void)showBrowseBeersDisplayData:(BrowseBeersDisplayData *)data
{
    self.view = self.strongTableView;
    
    self.data = data;
    [self reloadEntries];
}


- (void)reloadEntries
{
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data.sections count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BrowseBeersDisplaySection *browseSection = self.data.sections[section];
    
    return [browseSection.items count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BrowseBeersDisplaySection *browseSection = self.data.sections[section];
    
    return browseSection.name;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BrowseBeersDisplaySection *section = self.data.sections[indexPath.section];
    BrowseBeersDisplayItem *item = section.items[indexPath.row];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:BrowseEntryCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = item.beerName;
    cell.detailTextLabel.text = item.brewery;
    cell.imageView.image = [UIImage imageNamed:section.imageName];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end