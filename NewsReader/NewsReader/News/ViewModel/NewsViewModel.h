//
//  NewsViewModel.h
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"
#import "NewsService.h"

@class NewsViewModel;
@class NewFeed;

@protocol NewsViewModelDelegate <NSObject>

- (void)didFetchNewsWithSuccess;
- (void)didFailWithError:(NSError *)error;

@end

@interface NewsViewModel : NSObject

@property (nonatomic, strong) NSString *searchPredicate;
@property (nonatomic, weak) id<NewsViewModelDelegate> delegate;

// Dependency Injection
- (instancetype) initWithService:(NewsService *)service
                      delegate:(id<NewsViewModelDelegate>)delegate;

- (NSArray <NewsFeed *> *)getNews;
- (NewsFeed *)getNewsAtIndex:(NSInteger)index;
- (NSInteger)getNewsCount;
- (void)fetchNews;


@end
