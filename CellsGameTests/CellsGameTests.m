//
//  CellsGameTests.m
//  CellsGameTests
//
//  Created by Mars on 2017/10/20.
//  Copyright © 2017年 Mingjun Ma. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface CellsGameTests : XCTestCase
@property (nonatomic,strong) ViewController *cg;
@end

@implementation CellsGameTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //初始化的代码，在测试方法调用之前调用
    self.cg = [[ViewController alloc] init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    [super tearDown];
    self.cg = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 测试用例的例子，注意测试用例一定要test开头
    int *old = [self.cg getOldCells];
    int *new = [self.cg getNewCells];
    int countOld,countNew = 0;
    for (int i = 0; i < 9; i++) {
        for(int j = 0; j < 9; j++){
            if(*(old + i*9 + j) == 0) countOld++;
//            if(*(new + i*9 + j) == 0) countNew++;
        }
    }
    [self.cg startGame];
    for (int i = 0; i < 9; i++) {
        for(int j = 0; j < 9; j++){
//            if(*(old + i*9 + j) == 0) countOld++;
            if(*(new + i*9 + j) == 0) countNew++;
        }
    }
    XCTAssertGreaterThan(countNew,countOld,@"测试不通过");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    // 测试性能例子
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        // 需要测试性能的代码
    }];
}

@end
