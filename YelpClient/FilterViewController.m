//
//  FilterViewController.m
//  YelpClient
//
//  Created by Kevin Ku on 6/22/14.
//  Copyright (c) 2014 Kevin Ku. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *filterTableView;

@property (nonatomic) BOOL distanceSectionExpanded;
@property (nonatomic) BOOL sortBySectionExpanded;

@end

const int PRICE_SECTION = 0;
const int MOST_POPULAR_SECTION = 1;
const int DISTANCE_SECTION = 2;
const int SORT_BY_SECTION = 3;
const int GENERAL_FEATURES_SECTION = 4;

@implementation FilterViewController

- (void)startSearch {
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterTableView.delegate = self;
    self.filterTableView.dataSource = self;
    
    self.distanceSectionExpanded = false;
    self.sortBySectionExpanded = false;
    
    // add search button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(startSearch)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// table view functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch(section) {
        case MOST_POPULAR_SECTION:
            // most popular
            return 4;
        case GENERAL_FEATURES_SECTION:
            //general features
            return 3;
        case DISTANCE_SECTION:
            return self.distanceSectionExpanded ? 4 : 1;
        case SORT_BY_SECTION:
            return self.sortBySectionExpanded ? 3 : 1;
        default:
            // price
            return 1;
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier;
    NSString *nibName;

    switch(indexPath.section) {
        case PRICE_SECTION:
            CellIdentifier = @"PriceCell";
            nibName = @"FilterPriceCell";
            break;
        case MOST_POPULAR_SECTION:
            CellIdentifier = @"MostPopularCell";
            nibName = @"FilterSwitchCell";
            break;
        case DISTANCE_SECTION:
            CellIdentifier = @"DistanceCell";
            nibName = @"FilterPlainCell";
            break;
        case SORT_BY_SECTION:
            CellIdentifier = @"SortByCell";
            nibName = @"FilterPlainCell";
            break;
        case GENERAL_FEATURES_SECTION:
            CellIdentifier = @"GeneralFeaturesCell";
            nibName = @"FilterSwitchCell";
            break;
        default:
            CellIdentifier = @"";
            break;
    }
    
    FilterCell *cell = [self.filterTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        cell = [nib objectAtIndex:0];
        [cell initViews:indexPath];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if(indexPath.section == DISTANCE_SECTION) {
        self.distanceSectionExpanded = !self.distanceSectionExpanded;
        [tableView reloadData];
    }
    if(indexPath.section == SORT_BY_SECTION) {
        self.sortBySectionExpanded = !self.sortBySectionExpanded;
        [tableView reloadData];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case PRICE_SECTION:
            return @"Price";
        case MOST_POPULAR_SECTION:
            return @"Most Popular";
        case DISTANCE_SECTION:
            return @"Distance";
        case SORT_BY_SECTION:
            return @"Sort By";
        case GENERAL_FEATURES_SECTION:
            return @"General Features";
        default:
            return @"Error";
    }
}


@end
