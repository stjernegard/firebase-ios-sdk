// Copyright 2017 Google
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "FirebaseCore/Sources/FIRConfigurationInternal.h"

#import "FirebaseCore/Tests/Unit/FIRTestCase.h"

@interface FIRConfigurationTest : FIRTestCase

@end

@implementation FIRConfigurationTest

- (void)testSharedInstance {
  FIRConfiguration *config = [FIRConfiguration sharedInstance];
  XCTAssertNotNil(config);
  XCTAssertNotNil(config.analyticsConfiguration);
}

- (void)testGetDefaultLevel {
  FIRConfiguration *config = [FIRConfiguration sharedInstance];
  FIRLoggerLevel defaultLevel = [config loggerLevel];
  XCTAssertEqual(defaultLevel, FIRLoggerLevelNotice);
}

- (void)testSetAndGet {
  FIRConfiguration *config = [FIRConfiguration sharedInstance];
  for (FIRLoggerLevel level = FIRLoggerLevelMin; level <= FIRLoggerLevelMax; level++) {
    [config setLoggerLevel:level];
    XCTAssertEqual([config loggerLevel], level);
  }
}

@end
