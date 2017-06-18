//
//  ViewController.m
//  NSCollectionViewSample
//
//  Created by John Martyniak on 6/18/17.
//  Copyright © 2017 ABC. All rights reserved.
//

#import "ViewController.h"

#import "ItemOne.h"
#import "ItemTwo.h"

@interface ViewController ()
@property NSMutableArray *cellArray;
@property (weak) IBOutlet NSCollectionView *collectionView;

@end

@implementation ViewController

@synthesize cellArray;
@synthesize collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [collectionView registerClass:ItemOne.class forItemWithIdentifier:@"Item1"];
    [collectionView registerClass:ItemTwo.class forItemWithIdentifier:@"Item2"];
    
    cellArray = [@[@"Item1", @"Item2", @"Item1", @"Item2", @"Item1"] mutableCopy];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

#pragma mark - NSCollectionViewDatasource -
- (NSInteger)collectionView:(NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    // We are going to fake it a little.  Since there is only one section
    NSLog(@"Section: %ld, count: %ld", (long)section, [cellArray count]);
    
    return [cellArray count];
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView
     itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"IndexPath: %@, Requested one: %ld", indexPath, [indexPath item]);
    NSLog(@"Identifier: %@", [cellArray objectAtIndex:[indexPath item]]);
    
    NSCollectionViewItem *theItem = [collectionView makeItemWithIdentifier:[cellArray objectAtIndex:[indexPath item]] forIndexPath:indexPath];
    
    return theItem;
}

#pragma mark - NSCollectionViewDelegate -


@end
