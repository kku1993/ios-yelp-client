//
//  MainViewController.m
//  YelpClient
//
//  Created by Kevin Ku on 6/21/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic) YelpClient *yelpClient;
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *restaurants;

@property (weak, nonatomic) IBOutlet UITableView *restaurantsTableView;
@property (nonatomic) FilterViewController *filterViewController;
@end

@implementation MainViewController

- (void)onFilterButtonClicked {
    self.filterViewController = [[FilterViewController alloc] init];
    [self.filterViewController setTitle:@"Filters"];
    
    [self.navigationController pushViewController:self.filterViewController animated:true];
}

- (void)addSearchBar {
    // add search bar in the navigation bar
    UIButton *filterButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width * 0.3, self.navigationController.navigationBar.frame.size.height - 5)];
    [filterButton setTitle:@"Filters" forState:UIControlStateNormal];
    [filterButton sizeToFit];
    
    [filterButton addTarget:self action:@selector(onFilterButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // gap between filter button and searchbar
    CGFloat gap = 20;
    
    self.searchBar.frame = CGRectMake(filterButton.frame.size.width + gap, 0, self.view.frame.size.width - filterButton.frame.size.width - gap - 20, self.navigationController.navigationBar.frame.size.height - 5);
    [self.searchBar setBarTintColor:[UIColor clearColor]];
    
    // create a view to wrap both filter button and searchbar
    UIView *barWrapper = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.searchBar.frame.size.width + filterButton.frame.size.width + gap, self.searchBar.frame.size.height)];
    [barWrapper setBackgroundColor:[UIColor clearColor]];
    [barWrapper addSubview:filterButton];
    [barWrapper addSubview:self.searchBar];
    self.navigationItem.titleView = barWrapper;	
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1 green:0.08 blue:0 alpha:1];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.yelpClient = [[YelpClient alloc] init];
        
        self.searchBar = [[UISearchBar alloc] init];
        self.searchBar.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSearchBar];
    self.restaurants = nil;
    
    self.restaurantsTableView.delegate = self;
    self.restaurantsTableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.isMovingToParentViewController == NO) {
        // returning from filters view
        if(self.filterViewController.searchPressed) {
            [self searchBarSearchButtonClicked:self.searchBar];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self addSearchBar];
}

// search bar functions
- (void)onSearchResult:(NSDictionary *)results {
    self.restaurants = [results objectForKey:@"businesses"];

    void (^updateUI)(void) = ^{
        [[self restaurantsTableView] reloadData];
    };
    
    // update table view
    if([NSThread isMainThread]) {
        updateUI();
    }
    else {
        dispatch_sync(dispatch_get_main_queue(), updateUI);
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:true animated:true];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.text = @"";
    [searchBar setShowsCancelButton:false animated:true];
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if([self.searchBar.text length] <= 0)
        return;
    
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
    [MMProgressHUD showWithTitle:@"Searching" status:[@"Searching for " stringByAppendingString:searchBar.text]];
    
    [searchBar setShowsCancelButton:false animated:true];
    [searchBar resignFirstResponder];
    
    [self.yelpClient searchWithTerm:searchBar.text success:^(AFHTTPRequestOperation *operation, id response) {
        [MMProgressHUD dismiss];
        [self onSearchResult:response];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MMProgressHUD dismiss];
        NSLog(@"error: %@", [error description]);
    }];
}

// table view functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if(self.restaurants)
        return 1;
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(self.restaurants)
        return [self.restaurants count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"RestaurantCell";
    
    RestaurantCell *cell = [self.restaurantsTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RestaurantCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.restaurantData = [self.restaurants objectAtIndex:indexPath.row];
    return [cell updateViews];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // open restaurant detail view
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    id data = [self.restaurants objectAtIndex:indexPath.row];
    NSLog(@"%@", data);
}

@end
