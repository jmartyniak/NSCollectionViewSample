//
//  ViewController.m
//  NSCollectionViewSample
//
//  Created by John Martyniak on 6/18/17.
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
    
    // I believe that this way can be used if you want to register the class
//    [collectionView registerClass:ItemOne.class forItemWithIdentifier:@"Item1"];
//    [collectionView registerClass:ItemTwo.class forItemWithIdentifier:@"Item2"];
    
    
    // If you would like to load it with a NIB then use these lines and comment out the register class stuff above.
    NSNib *itemOneNib = [[NSNib alloc] initWithNibNamed:@"ItemOne" bundle:nil];
    NSNib *itemTwoNib = [[NSNib alloc] initWithNibNamed:@"ItemTwo" bundle:nil];
    
    [collectionView registerNib:itemOneNib forItemWithIdentifier:@"Item1"];
    [collectionView registerNib:itemTwoNib forItemWithIdentifier:@"Item2"];
    
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
    
    // TODO: This needs to be based on the actual value of the view instead of hardcoding a number in.
    if ([label isEqualToString:@"Item1"]) {
        height = 114;
    } else if ([label isEqualToString:@"Item2"]) {
        height = 84;
    }
    
    size = NSMakeSize(width, height);
    
    return size;
    
    
}


@end
