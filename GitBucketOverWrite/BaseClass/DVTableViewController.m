//
//  DVTableViewController.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/17.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVTableViewController.h"
#import "DVTableViewModel.h"
@interface DVTableViewController ()
@property (weak, nonatomic) IBOutlet MRCTableView *tableView;
@property(nonatomic, strong) DVTableViewModel *viewModel;

@end

@implementation DVTableViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)customInit {
    for (NSString *identifier in self.identifierArr) {
        [self.tableView registerNib:[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil].firstObject  forCellReuseIdentifier:identifier];
     }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

-(void)bindViewModel {
     [[RACObserve(self.viewModel, dataSource)  deliverOn:[RACScheduler mainThreadScheduler]]
      subscribeNext:^(id x) {
          [self.tableView reloadData];
     }];
 
    
}



#pragma mark - datasource 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  self.viewModel.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id  sectionData = self.viewModel.dataSource[section];
    
    return ((NSArray *)sectionData).count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      id info = self.viewModel.dataSource[indexPath.section] [indexPath.row];
    UITableViewCell *cell = [self configureTableViewCellWithTableView:(UITableView *)tableView viewModel:info];
    return  cell;
}

-(UITableViewCell *)configureTableViewCellWithTableView:(UITableView *)tableView viewModel:(DVViewModel *)viewModel{
    DVAssertTip_overwrite
    return  nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DVAssertTip_overwrite
    return 0;
}






@end
