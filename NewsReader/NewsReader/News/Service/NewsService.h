//
//  NewsService.h
//  NewsReader
//
//  Created by Kshitij Gaur on 06/03/24.
//

#import <Foundation/Foundation.h>
#import "NewsFeed.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsService : NSObject

- (instancetype) initWithFileName:(NSString *)jsonFileName;

- (NSArray<NewsFeed *> *)loadNewsFromJSONFile;

@end

NS_ASSUME_NONNULL_END
