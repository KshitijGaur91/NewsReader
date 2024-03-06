//
//  NewsFeed.m
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"

@implementation NewsFeed

- (instancetype)initWithTitle:(NSString *)title imageURL:(NSString *)imageURL contentURL:(NSString *)contentURL publishedDate:(NSDate *)publishedDate {
    self = [super init];
    if (self) {
        self.title = title;
        self.imageURL = imageURL;
        self.contentURL = contentURL;
        self.publishedDate = publishedDate;
    }
    return self;
}

@end
