//
//  RCSDemoTests.m
//  RCSDemoTests
//
//  Created by shuai shao on 2022/12/26.
//

#import <XCTest/XCTest.h>

#import "Dog.h"

@interface RCSDemoTests : XCTestCase

@end

@implementation RCSDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
//    Dog *dog_mock = OCMClassMock([Dog class]);
//    OCMStub([dog_mock callSomething:@"汪汪汪"]).andReturn(@"dog call 汪汪汪");
//    
//    Dog *dog_real = [[Dog alloc] init];
//    NSString *result = [dog_real callSomething:@"汪汪汪"];
//    
//    XCTAssertEqualObjects(result, [dog_mock callSomething:@"汪汪汪"], @"返回值不相等");
    
    // create a mock for the user defaults and make sure it's used
    id userDefaultsMock = OCMClassMock([NSUserDefaults class]);
    OCMStub([userDefaultsMock standardUserDefaults]).andReturn(userDefaultsMock);

    // call the code under test
    [[NSUserDefaults standardUserDefaults] setObject:@"http://someurl" forKey:@"MyAppURLKey"];

    // verify it has called the expected method
    OCMVerify([userDefaultsMock setObject:@"http://someurl" forKey:@"MyAppURLKey"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
