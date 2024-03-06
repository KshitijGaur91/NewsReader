//
//  NewsListViewController.h
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <UIKit/UIKit.h>
#import "NewsViewModel.h"

@interface NewsListViewController : UIViewController<NewsViewModelDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NewsViewModel *viewModel;

@end

