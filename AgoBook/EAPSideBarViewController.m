//
//  EASideBarViewController.m
//  ElenaAgo
//
//  Created by Simone Bierti on 31/10/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPSideBarViewController.h"

@interface EAPSideBarViewController ()

@end

@implementation EAPSideBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"sect:%i,index:%i",indexPath.section,indexPath.row);
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSLog(@"%@",cell.textLabel.text);
    [self.delegate2 willLoadRespectiveViewController:self indexPath:indexPath];
    //if(indexPath.row == 0){
    //    [self openAnagraficaView];
    //}
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
