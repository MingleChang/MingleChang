//
//  MingleChangTests.m
//  MingleChangTests
//
//  Created by gongtao on 2018/12/28.
//  Copyright © 2018 mingle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MingleChang.h"

@interface MingleChangTests : XCTestCase

@end

@implementation MingleChangTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"开始测试");
    XCTAssertTrue([@"371202198203071592" mc_isRealIDCard],@"371202198203071592是一个身份证");
    XCTAssertFalse([@"371202198203073242" mc_isRealIDCard],@"371202198203073242不是一个身份证");
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
