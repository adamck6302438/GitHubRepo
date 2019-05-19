//
//  RepoTableViewCell.h
//  GitHubRepo
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepoTableViewCell : UITableViewCell

@property (weak, nonatomic)IBOutlet UILabel *repoLabel;
@property (strong, nonatomic) Repo *repo;

- (void)setRepo:(Repo *)repo;

@end

NS_ASSUME_NONNULL_END
