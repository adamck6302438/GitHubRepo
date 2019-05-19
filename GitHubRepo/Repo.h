//
//  Repo.h
//  GitHubRepo
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Repo : NSObject

@property NSString *repoName;

+ (instancetype) parseJSONDictionary: (NSDictionary *)json;
- (instancetype) initWithRepo: (NSString *) repoName;

@end

NS_ASSUME_NONNULL_END
