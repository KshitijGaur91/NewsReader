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
        if ([self validateNewsWithTitle:title imageURL:imageURL contentURL:contentURL publishedDate:publishedDate]) {
            self.title = title;
            self.imageURL = imageURL;
            self.contentURL = contentURL;
            self.publishedDate = publishedDate;
        } else {
            return nil;
        }
    }
    return self;
}

- (Boolean)validateNewsWithTitle:(NSString *)title imageURL:(NSString *)imageURL contentURL:(NSString *)contentURL publishedDate:(NSDate *)publishedDate {
    if (![self isValidNewsTitle:title]) {
        NSLog(@"Error: Invalid Title");
        return false;
    }
    if (![self isValidImageUrl:imageURL]) {
        NSLog(@"Error: Invalid Image Url");
        return false;
    }
    if (![self isValidContentUrl:contentURL]) {
        NSLog(@"Error: Invalid Content Url");
        return false;
    }
    if (![self isValidPublishedDate:publishedDate]) {
        NSLog(@"Error: Invalid Published Date");
        return false;
    }
    return true;
}

- (Boolean)isValidNewsTitle:(NSString *)title {
    return !(title == nil || [title isEqualToString:@""]);
}

- (Boolean)isValidImageUrl:(NSString *)imageURL {
    return !(imageURL == nil || [imageURL isEqualToString:@""]);
}

- (Boolean)isValidContentUrl:(NSString *)contentURL {
    return !(contentURL == nil || [contentURL isEqualToString:@""]);
}

- (Boolean)isValidPublishedDate:(NSDate *)publishedDate {
    return (publishedDate != nil);
}

@end
