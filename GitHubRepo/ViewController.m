//
//  ViewController.m
//  GitHubRepo
//
//  Created by Frances ZiyiFan on 5/16/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ViewController.h"
#import "RepoTableViewCell.h"
#import "Repo.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *repos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.repos = @[];
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/adamck6302438/repos"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"json error: %@", jsonError);
            return;
        }
        
        NSMutableArray *repos = [NSMutableArray array];
        
        for(NSDictionary *repoJSON in json){
            Repo *repo = [Repo parseJSONDictionary:repoJSON];
            [repos addObject:repo];
        }
        
        self.repos = repos;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
        
    }];
    
    [dataTask resume];
}


#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RepoTableViewCell *repoCell = [tableView dequeueReusableCellWithIdentifier:@"repo" forIndexPath:indexPath];
    
    Repo *repo = self.repos[indexPath.row];
    repoCell.repo = repo;
    NSLog(@"%@",repo);
    return repoCell;
}


@end
