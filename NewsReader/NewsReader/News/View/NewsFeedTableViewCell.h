//
//  NewsFeedTableViewCell.h
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <UIKit/UIKit.h>
#import "NewsFeed.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsFeedTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *newsTitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *newsImageView;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

- (void)configureCellWithNewsFeed:(NewsFeed *)newsFeed;

@end

NS_ASSUME_NONNULL_END
