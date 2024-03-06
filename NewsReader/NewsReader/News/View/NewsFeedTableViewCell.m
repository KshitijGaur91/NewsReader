//
//  NewsFeedTableViewCell.m
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import "NewsFeedTableViewCell.h"
#import "ImageDownloader.h"

@implementation NewsFeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCellWithNewsFeed:(nonnull NewsFeed *)newsFeed {
    // Configure cell with news feeed data
    self.newsTitleLabel.text = newsFeed.title;
    self.dateLabel.text = [self formattedDateStringFromDate:newsFeed.publishedDate];
    
    self.newsImageView.image = nil;
    NSURL *url = [NSURL URLWithString:newsFeed.imageURL];
    UIImage *cachedImage = [ImageDownloader cachedImageForURL:url];
    if (cachedImage) {
        self.newsImageView.image = cachedImage;
    } else {
        [ImageDownloader downloadImageWithURL:url completion:^(UIImage *image) {
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.newsImageView.image = image;
                });
            }
        }];
    }
}

- (NSString *)formattedDateStringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MMM yyyy HH:mm"];
    return [formatter stringFromDate:date];
}

@end
