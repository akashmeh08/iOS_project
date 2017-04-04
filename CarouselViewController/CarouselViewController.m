//
//  CarasoulViewController.m
//  Mobiloitte
//
//  Created by Anshu Aggarwal on 20/03/17.
//  Copyright © 2017 Mobiloitte. All rights reserved.
//

#import "CarouselViewController.h"
#import "iCarousel.h"
#import "SWRevealViewController.h"

@interface CarouselViewController ()
//{
//    int sliderCount;
//}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *CarouselMenuButton;

@property (retain, nonatomic) IBOutlet iCarousel *carousel;
@end

//@class iCarousel;

@implementation CarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [iCarousel load];
    _carousel.type=iCarouselTypeCustom;
    //    _carousel.autoscroll=0.4;
    SWRevealViewController *revealViewController =self.revealViewController;
    //[[SWRevealViewController alloc]init];

    if ( revealViewController )
    {
        NSLog(@"hkhdkjsf");
        [self.CarouselMenuButton setTarget:self.revealViewController];
        [self.CarouselMenuButton setAction: @selector( revealToggle: )];    }
}

-(void)viewDidAppear:(BOOL)animated
{
//    sliderCount=0;
    [super viewDidAppear:animated];
//    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(runMethod) userInfo:nil repeats:YES];
    NSInteger chosenIndex = 0;
    [self.carousel scrollToItemAtIndex:chosenIndex animated:NO];
        
}

//-(void)runMethod
//{
//    [self.carousel scrollToItemAtIndex:sliderCount animated:YES];
//    if(sliderCount== 9)
//    {
//        sliderCount=0;
//    }
//    else
//    {
//        sliderCount++;
//    }
//}

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
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    
    images=[[NSMutableArray alloc]initWithObjects:@"img1.jpg",@"img3.jpg",@"img4.jpg",@"img5.jpg",@"img6.jpg",@"img3.jpg",@"img4.jpg",@"img5.jpg",@"img6.jpg",@"images8-1.jpg",@"images7.jpg",@"img1.jpg",@"img3.jpg",nil];
    return [images count];
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    view =  [[UIView alloc] init];
    view.contentMode = UIViewContentModeScaleAspectFit;
    //    view.backgroundColor=[UIColor greenColor];
    CGRect rec = view.frame;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        rec.size.width = 150;
        rec.size.height = 150;
    }
    view.frame = rec;
    UIImageView *iv;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,150,150)];
    }
    NSString *temp=[images objectAtIndex:index];
    iv.image=[UIImage imageNamed:temp];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:iv];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Image is selected.");
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    const CGFloat offsetFactor = [self carousel:carousel valueForOption:iCarouselOptionSpacing withDefault:0.365f]*carousel.itemWidth;
    
    //The larger these values, as the items move away from the center ...
    
    //... the faster they move to the back
    const CGFloat zFactor = 150.0f;
    
    //... the faster they move to the bottom of the screen
    const CGFloat normalFactor = 50.0f;
    
    //... the faster they shrink
    const CGFloat shrinkFactor = 3.0f;
    
    //hyperbola
    CGFloat f = sqrtf(offset*offset+1)-1;
    
    transform = CATransform3DTranslate(transform, offset*offsetFactor, f*normalFactor, f*(-zFactor));
    transform = CATransform3DScale(transform, 1.3/(f/shrinkFactor+1.0f), 1.3/(f/shrinkFactor+1.0f), 1.0);
    return transform;
}
@end

