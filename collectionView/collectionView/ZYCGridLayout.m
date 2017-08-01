//
//  ZYCGridLayout.m
//  collectionView
//
//  Created by wpzyc on 2017/8/1.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCGridLayout.h"
@interface ZYCGridLayout()
/** 所有的布局属性 */
@property(strong,nonatomic)NSMutableArray *attrsArray;
@end
@implementation ZYCGridLayout
- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
//该方法中拿到的 collectionView宽高比较准确
- (void)prepareLayout
{
    [super prepareLayout];
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //创建UICollectionViewLayoutAttributes
    for (int i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        //设置布局属性
        CGFloat width = self.collectionView.frame.size.width*0.5;
        if (i==0) {
            CGFloat height = width;
            CGFloat x = 0;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
        }else if (i==1){
            CGFloat height = width*0.5;
            CGFloat x = width;
            CGFloat y = 0;
            attrs.frame = CGRectMake(x, y, width, height);
            
        }else if (i==2){
            CGFloat height = width*0.5;
            CGFloat x = width;
            CGFloat y = width*0.5;
            attrs.frame = CGRectMake(x, y, width, height);
            
        }else if (i==3){
            CGFloat height = width*0.5;
            CGFloat x = 0;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
            
        }else if (i==4){
            CGFloat height = width*0.5;
            CGFloat x = 0;
            CGFloat y = width+width*0.5;
            attrs.frame = CGRectMake(x, y, width, height);
            
        }else if (i==5){
            CGFloat height = width;
            CGFloat x = width;
            CGFloat y = width;
            attrs.frame = CGRectMake(x, y, width, height);
            
        }else{
            UICollectionViewLayoutAttributes *lastAttrs = self.attrsArray[i-6];
            CGRect lastFrame = lastAttrs.frame;
            lastFrame.origin.y += 2*width;
            
            attrs.frame = lastFrame;
        }
        
        //添加UICollectionViewLayoutAttributes
        [self.attrsArray addObject:attrs];
    }

    
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    return self.attrsArray;
    
}
/**
 返回collectionView的内容大小
 */
- (CGSize)collectionViewContentSize
{
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    
    int rows = (count +3-1)/3;
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat rowH = width*0.5;
    CGFloat height = rows*rowH;
    CGSize size = CGSizeMake(width, height);
    return size;
}
@end
