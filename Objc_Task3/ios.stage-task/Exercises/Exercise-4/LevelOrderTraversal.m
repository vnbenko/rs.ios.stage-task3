#import "LevelOrderTraversal.h"

typedef enum {
    left,
    right
} Node;

NSInteger createLevelOrderTravelsal(NSArray *tree, NSUInteger index, NSMutableArray *resultTree, NSUInteger level) {
    
    for (Node node = left; (level < [tree count]) && (node <= right); node++) {
        NSObject *node = [tree objectAtIndex:level];
        level++;
        if ([node isKindOfClass:NSNumber.class]) {
            if ([resultTree count] <= index) {
                [resultTree addObject:[NSMutableArray new]];
            }
            [resultTree[index] addObject:node];
            level = createLevelOrderTravelsal(tree, index + 1, resultTree, level);
        }
    }
    return level;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *resultTree = [NSMutableArray new];
        createLevelOrderTravelsal(tree, 0, resultTree, 0);
        return [resultTree copy];
}
