//
//  FIrstTableView.m
//  CIDome
//
//  Created by yanxuezhou on 2017/5/15.
//  Copyright © 2017年 yanxuezhou. All rights reserved.
//

#import "FIrstTableView.h"
#import "ShowInfoVC.h"
#import <JJMediator+BusinessA.h>
@interface FIrstTableView ()
@property(nonatomic,strong)NSArray *list;
@end

@implementation FIrstTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _list=@[@"通过url调用A中的controller",@"通过Category调用A中的controller",@"本地界面调用A模块并由信息回调"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *str =_list[indexPath.row];
    
    cell.textLabel.text=str;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        NSURL *url = [NSURL URLWithString:@"http://jumpTo?actionName=GetModuleController&targetName=A"];
      UIViewController *vc=  [[JJMediator sharedInstance]performURL:url withCallBlock:nil];
        if (vc) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.row==1) {
        UIViewController *vc=  [[JJMediator sharedInstance]getBussinsA:nil];
        if (vc) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.row==2) {
        ShowInfoVC *vc=[[ShowInfoVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
