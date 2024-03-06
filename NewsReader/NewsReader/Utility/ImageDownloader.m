//
//  ImageDownloader.m
//  NewsReader
//
//  Created by Kshitij Gaur on 05/03/24.
//

#import "ImageDownloader.h"

@interface ImageDownloader ()

@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation ImageDownloader

+ (instancetype)sharedInstance {
    static ImageDownloader *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.imageCache = [[NSCache alloc] init];
    });
    return sharedInstance;
}

+ (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))completion {
    UIImage *cachedImage = [[self sharedInstance].imageCache objectForKey:url.absoluteString];
    if (cachedImage) {
        completion(cachedImage);
        return;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error downloading image: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                [[self sharedInstance].imageCache setObject:image forKey:url.absoluteString];
                completion(image);
            } else {
                completion(nil);
            }
        }
    }];
    
    [task resume];
}

+ (void)clearCache {
    [[self sharedInstance].imageCache removeAllObjects];
}

+ (UIImage *)cachedImageForURL:(NSURL *)url {
    return [[self sharedInstance].imageCache objectForKey:url.absoluteString];
}

@end

