//
//  NewsViwModel.m
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import "NewsViewModel.h"

@interface NewsViewModel ()
@property (nonatomic, strong) NewsService *newsService;
@property (nonatomic, strong) NSArray<NewsFeed *> *newsFeeds;
@end

@implementation NewsViewModel

- (instancetype) initWithService:(NewsService *)service
                      delegate:(id<NewsViewModelDelegate>)delegate {
    self = [super init];
    if (self) {
        self.newsService = service;
        self.delegate = delegate;
    }
    return self;
}

- (NSArray <NewsFeed *> *)getNews {
    if (self.searchPredicate.length == 0) {
            return self.newsFeeds;
        } else {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[c] %@", self.searchPredicate];
            return [self.newsFeeds filteredArrayUsingPredicate:predicate];
        }
}

- (NewsFeed *)getNewsAtIndex:(NSInteger)index {
    return [self getNews][index];
}

- (NSInteger)getNewsCount {
    return [self getNews].count;
}

- (void)fetchNews {
    self.newsFeeds = [self.newsService loadNewsFromJSONFile];
    
    if (self.newsFeeds.count > 0) {
        [self.delegate didFetchNewsWithSuccess];
    } else {
        NSError *error = [NSError errorWithDomain:@"com.newsreader" code:1001 userInfo:@{NSLocalizedDescriptionKey: @"No news items found."}];
        [self.delegate didFailWithError:error];
    }
}




@end
