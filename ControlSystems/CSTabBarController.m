//
//  CSTabBarController.m
//  ControlSystems
//
//  Created by Andrey on 19.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "CSTabBarController.h"
#import "CSPersonsLibrary.h"

@interface CSTabBarController ()

@end

@implementation CSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // при первом запуске приложения создаем и инициализируем данные
    [CSPersonsLibrary sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
