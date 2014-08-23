//
//  ViewController.m
//  Vibrant Titlebar Demo
//
//  Created by Guilherme Rambo on 23/08/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "ViewController.h"

#import "NSColor+Random.h"

#import "GRVibrantTitlebarWindow.h"

@interface ViewController ()

@property (weak) IBOutlet NSTableView *tableView;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidAppear
{
    [super viewDidAppear];
    
    // you can change the title's appearance to make It dark instead of light
//    [((GRVibrantTitlebarWindow *)self.view.window) setTitlebarAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantDark]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // adjust the scrollview so It scrolls past the titlebar
    self.tableView.enclosingScrollView.automaticallyAdjustsContentInsets = NO;
    self.tableView.enclosingScrollView.contentInsets = NSEdgeInsetsMake(NSHeight(self.view.window.frame)+60.0, 0, 0, 0);
    NSRect bounds = self.tableView.enclosingScrollView.contentView.bounds;
    bounds.origin.y -= 60.0;
    self.tableView.enclosingScrollView.contentView.bounds = bounds;
    
    
    for (int i = 0; i < 100; i++) {
        NSDictionary *item = @{@"title": [NSString stringWithFormat:@"Item %d", i+1],
                               @"color": [NSColor gr_randomColor]};
        [self.items addObject:item];
    }
    
    [self.tableView reloadData];
}

- (NSMutableArray *)items
{
    if (!_items) _items = [[NSMutableArray alloc] init];
    
    return _items;
}

#pragma mark Table View

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.items.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"cell" owner:tableView];
    
    NSDictionary *item = self.items[row];
    cellView.textField.stringValue = item[@"title"];
    
    return cellView;
}

- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row
{
    NSDictionary *item = self.items[row];
    rowView.backgroundColor = item[@"color"];
}

@end
