//
//  NewsListViewController.m
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import "NewsListViewController.h"
#import "NewsViewModel.h"
#import "NewsFeedTableViewCell.h"
#import <SafariServices/SafariServices.h>

@interface NewsListViewController ()<SFSafariViewControllerDelegate, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // News service is being injected here making it unit test friendly
    NewsService *newsService = [[NewsService alloc] initWithFileName:@"news"];
    self.viewModel = [[NewsViewModel alloc] initWithService:newsService delegate:self];
    [self setupNewsTable];
    [self fetchNews];
}

- (void)fetchNews {
    // Show Activity Indicator here
    [self.viewModel fetchNews];
}

- (void)setupNewsTable {
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsFeedTableViewCell" bundle:nil]
       forCellReuseIdentifier:@"NewsFeedTableViewCell"];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel getNewsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsFeedTableViewCell" forIndexPath:indexPath];
    [cell configureCellWithNewsFeed:[self.viewModel getNewsAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSURL *contentUrl = [[NSURL alloc] initWithString: [self.viewModel getNewsAtIndex:indexPath.row].contentURL];
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:contentUrl];
    svc.delegate = self;
    [self presentViewController:svc animated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - Safari View Delegate Delegate
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Search Bar Delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.viewModel.searchPredicate = searchText;
    [self.tableView reloadData];
}

#pragma mark - NewsViewModelDelegate
- (void)didFailWithError:(NSError *)error {
    // hide activity indicator here
    NSLog(@"Error fetching news: %@", error.localizedDescription);
}

- (void)didFetchNewsWithSuccess { 
    // hide activity indicator here
    [self.tableView reloadData];
}

@end
