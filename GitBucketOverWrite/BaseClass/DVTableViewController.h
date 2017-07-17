//
//  DVTableViewController.h
//  GitBucketOverWrite
//
//  Created by David on 17/7/17.
//  Copyright © 2017年 David. All rights reserved.
//

#import "DVViewController.h"
#import "MRCTableView.h"

@interface DVTableViewController : DVViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic,readonly) IBOutlet MRCTableView *tableView;
@property(nonatomic, strong) NSArray  *identifierArr;

-(UITableViewCell *)configureTableViewCellViewModel:(DVViewModel *)viewModel;

@end


