//
//  Repo.m
//  GitHubRepo
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithRepo:(NSString *)repoName
{
    self = [super init];
    if (self) {
        _repoName = repoName;
    }
    return self;
}

+ (instancetype)parseJSONDictionary:(NSDictionary *)json{
    return [[Repo alloc]initWithRepo: json[@"name"]];
}

@end
