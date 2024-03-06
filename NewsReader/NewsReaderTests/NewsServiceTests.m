//
//  NewsServiceTests.m
//  NewsReaderTests
//
//  Created by Kshitij Gaur on 06/03/24.
//

#import <XCTest/XCTest.h>
#import "NewsService.h"
#import "NewsFeed.h"

@interface NewsServiceTests : XCTestCase

@property (nonatomic, strong) NewsService *newsService;
@property (nonatomic, strong) NewsService *newsServiceWithInvalidJSON;

@end

@implementation NewsServiceTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.newsService = [[NewsService alloc] initWithFileName:@"mockNews"];
    self.newsServiceWithInvalidJSON = [[NewsService alloc] initWithFileName:@"invalidMockNews"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.newsService = nil;
    self.newsServiceWithInvalidJSON = nil;
}

- (void)testLoadNewsFromJSONFile {
    @try {
        NSArray<NewsFeed *> *newsFeeds = [self.newsService loadNewsFromJSONFile];
        XCTAssertNotNil(newsFeeds, @"News items should not be nil");
        XCTAssertGreaterThan(newsFeeds.count, 0, @"News items count should be greater than 0");
        
        // Check if news items are correctly loaded
        NewsFeed *firstItem = [newsFeeds firstObject];
        XCTAssertNotNil(firstItem.title, @"News item title should not be nil");
        XCTAssertNotNil(firstItem.publishedDate, @"News item published date should not be nil");
        XCTAssertNotNil(firstItem.imageURL, @"News item image URL should not be nil");
    } @catch (NSException *exception) {
        XCTFail(@"Exception occurred: %@", exception);
    }
}

- (void)testLoadNewsFromInvalidJSONFile {
    @try {
        NSArray<NewsFeed *> *newsFeeds = [self.newsServiceWithInvalidJSON loadNewsFromJSONFile];
        XCTAssertNotNil(newsFeeds, @"News items should not be nil");
        XCTAssertEqual(newsFeeds.count, 0, @"News items count should be zero");
    } @catch (NSException *exception) {
        XCTFail(@"Exception occurred: %@", exception);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
