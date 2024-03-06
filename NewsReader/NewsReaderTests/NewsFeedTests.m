//
//  NewsFeedTests.m
//  NewsReaderTests
//
//  Created by Aparna Vashishtha on 07/03/24.
//

#import <XCTest/XCTest.h>
#import "NewsFeed.h"

@interface NewsFeedTests : XCTestCase

@end

@implementation NewsFeedTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testNewFeedInitWithValidData {
    
    // Sample correct data
    NSString *title = @"SEC approves bitcoin ETFs (for real this time)";
    NSString *imageURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *contentURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *publishedDateString = @"2024-01-10T22:41:25Z";
    
    // Convert published date string to NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *publishedDate = [dateFormatter dateFromString:publishedDateString];
    
    // Create NewsFeed object
    NewsFeed *newsFeed = [[NewsFeed alloc] initWithTitle:title imageURL:imageURLString contentURL:contentURLString publishedDate:publishedDate];
    
    XCTAssertNotNil(newsFeed,
                    @"NewsFeed should not be nil");
    
    XCTAssertEqualObjects(newsFeed.title,
                          title,
                          @"Title should match");
    
    XCTAssertEqualObjects(newsFeed.publishedDate,
                          publishedDate,
                          @"Published date should match");
    
    XCTAssertEqualObjects(newsFeed.imageURL,
                          imageURLString,
                          @"URL should match");
    
    XCTAssertEqualObjects(newsFeed.contentURL,
                          contentURLString,
                          @"Content URL should match");
}

- (void)testNewFeedInitWithEmptyTitle {
    // Sample correct data
    NSString *title = @"";
    NSString *imageURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *contentURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *publishedDateString = @"2024-01-10T22:41:25Z";
    
    // Convert published date string to NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *publishedDate = [dateFormatter dateFromString:publishedDateString];
    
    // Create NewsFeed object
    NewsFeed *newsFeed = [[NewsFeed alloc] initWithTitle:title imageURL:imageURLString contentURL:contentURLString publishedDate:publishedDate];
    
    XCTAssertNil(newsFeed,
                    @"NewsFeed should be nil");
}

- (void)testNewFeedInitWithEmptyPublishedDate {
    // Sample correct data
    NSString *title = @"SEC approves bitcoin ETFs (for real this time)";
    NSString *imageURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *contentURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *publishedDateString = @"";
    
    // Convert published date string to NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *publishedDate = [dateFormatter dateFromString:publishedDateString];
    
    // Create NewsFeed object
    NewsFeed *newsFeed = [[NewsFeed alloc] initWithTitle:title imageURL:imageURLString contentURL:contentURLString publishedDate:publishedDate];
    
    XCTAssertNil(newsFeed,
                    @"NewsFeed should be nil");
}

- (void)testNewFeedInitWithInvalidPublishedDate {
    // Sample correct data
    NSString *title = @"SEC approves bitcoin ETFs (for real this time)";
    NSString *imageURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *contentURLString = @"https://www.engadget.com/sec-approves-bitcoin-etfs-for-real-this-time-224125584.html";
    NSString *publishedDateString = @"2024-01-10-Invalid-22:41:25Z";
    
    // Convert published date string to NSDate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *publishedDate = [dateFormatter dateFromString:publishedDateString];
    
    // Create NewsFeed object
    NewsFeed *newsFeed = [[NewsFeed alloc] initWithTitle:title imageURL:imageURLString contentURL:contentURLString publishedDate:publishedDate];
    
    XCTAssertNil(newsFeed,
                    @"NewsFeed should be nil");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
