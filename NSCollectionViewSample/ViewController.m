//
//  ViewController.m
//  NSCollectionViewSample
//
//  Created by John Martyniak on 6/18/17.
//
// https://gist.github.com/benstockdesign/a23d817e03f2ece89476f45ef133b74c

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

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return 1;
}

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
    
    theItem.representedObject = [cellArray objectAtIndex:[indexPath item]];
    
    return theItem;
}

#pragma mark - NSCollectionViewDelegate -
- (NSSize)collectionView:(NSCollectionView *)collectionView
                  layout:(NSCollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    NSSize size = NSMakeSize(438, 150);
    NSInteger width = 0;
    NSInteger height = 0;
    NSString *label = [cellArray objectAtIndex:[indexPath item]];
    
    NSRect collectionFrame = [collectionView frame];
    
    width = collectionFrame.size.width;
    if ([label isEqualToString:@"Item1"]) {
        height = 114;
    } else if ([label isEqualToString:@"Item2"]) {
        height = 84;
    }
    
    size = NSMakeSize(width, height);
    
    return size;
    
    
}


@end
