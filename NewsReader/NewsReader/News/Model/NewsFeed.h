//
//  NewsFeed.h
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <Foundation/Foundation.h>

@interface NewsFeed : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *contentURL;
@property (nonatomic, strong) NSDate *publishedDate;

- (instancetype) initWithTitle:(NSString *)title
                      imageURL:(NSString *)imageURL
                    contentURL:(NSString *)contentURL
                 publishedDate:(NSDate *)publishedDate;

@end

