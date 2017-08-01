//
//  ViewController.m
//  collectionView
//
//  Created by wpzyc on 2017/7/31.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCGridLayout.h"
#import "ZYCPhotoCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController
static NSString *const ZYCPhotoCellId = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建布局
    ZYCGridLayout *layout = [[ZYCGridLayout alloc]init];
   
    
    //创建collectionView 必须在创建时传layout
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate =self;
    [self.view addSubview:collectionView];
    //注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ZYCPhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ZYCPhotoCellId];
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZYCPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZYCPhotoCellId forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor orangeColor];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item+1];
    return cell;
}
#pragma mark - <UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
