//
//  NewsService.m
//  NewsReader
//
//  Created by Kshitij Gaur on 06/03/24.
//

#import "NewsService.h"

@interface NewsService ()

@property (nonatomic, strong) NSString *fileName;

@end


@implementation NewsService

- (instancetype) initWithFileName:(NSString *)jsonFileName {
    self = [super init];
    if (self) {
        self.fileName = jsonFileName;
    }
    return self;
}

- (NSArray<NewsFeed *> *)loadNewsFromJSONFile {
    NSMutableArray<NewsFeed *> *newsFeeds = [NSMutableArray array];
    @try {
        // Load news from the JSON file
        NSString *filePath = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        if (data) {
            NSError *error;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (error) {
                NSLog(@"Error parsing JSON: %@", error.localizedDescription);
                return newsFeeds; // Return empty array on error
            }
            
            NSArray *articles = jsonDict[@"articles"];
            
            for (NSDictionary *articleDict in articles) {
                NSString *title = articleDict[@"title"];
                NSString *publishedDateString = articleDict[@"publishedAt"];
                NSString *imageURLString = articleDict[@"urlToImage"];
                NSString *contentURLString = articleDict[@"url"];
                
                // Convert published date string to NSDate
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
                NSDate *publishedDate = [dateFormatter dateFromString:publishedDateString];
                
                // Create NewsFeed object
                NewsFeed *newsFeed = [[NewsFeed alloc] initWithTitle:title imageURL:imageURLString contentURL:contentURLString publishedDate:publishedDate];
                
                [newsFeeds addObject:newsFeed];
            }
        } else {
            NSLog(@"Failed to load data from news.json");
        }
    } @catch (NSException *exception) {
        NSLog(@"Exception while loading news: %@", exception.reason);
    } @finally {
        // Sort news items by published date
        [newsFeeds sortUsingComparator:^NSComparisonResult(NewsFeed *obj1, NewsFeed *obj2) {
            return [obj2.publishedDate compare:obj1.publishedDate];
        }];
        
        return newsFeeds;
    }
}

@end
