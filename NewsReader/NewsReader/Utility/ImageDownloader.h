//
//  ImageDownloader.h
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import <UIKit/UIKit.h>

@interface ImageDownloader : NSObject

+ (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))completion;
+ (void)clearCache;
+ (UIImage *)cachedImageForURL:(NSURL *)url;

@end

