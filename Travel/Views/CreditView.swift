//
//  CreditView.swift
//  Travel
//
//  Created by Milad Golchinpour on 7/15/21.
//

import SwiftUI

/// CREDITS
struct CreditView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: - SOURCES
                Group {
                    Text("SOURCES").font(.headline)
                    Text("""
                        [TRAVEL.USNEWS.COM](https://travel.usnews.com/rankings/worlds-best-vacations/)
                        [TRAVELANDLEISURE](https://www.travelandleisure.com/trip-ideas/best-places-to-travel-in-2021)
                        [PINTREST](https://www.pinterest.com)
                        """)
                }
                
                // MARK: - IMAGES
                Group {
                    Text("IMAGES").font(.headline)
                    Text("""
                         CREDIT: GETTY IMAGES
                         Eva LeWitt (b. Spoleto, 1985; lives and works in New York), Resin Towers A, B, and C, 2020. Resin, PVC, 128 x 10 x 10 in. (325.1 x 25.4 x 25.4 cm; each column).
                         CREDIT: THOMAS CLARK
                         CREDIT: COURTESY OF THE ARTIST AND VI, VII, OSLO.
                         CREDIT: ALEXANDRA D. URBAN
                         CREDIT: COURTESY OF BURLINGTON SURF CLUB
                         CREDIT: COURTESY OF CHAPIN ESTATE
                         CREDIT: CAVAN IMAGES RF
                         CREDIT: JIM MCKINLEY
                         CREDIT: CHRIS SATTLBERGER
                         CREDIT: NICK CLARK
                         """)
                }
                
                // MARK: - DEVELOPER
                Group {
                    Text("DEVELOPER").font(.headline)
                    Text("""
                        CREATE APP, DEPLOY: [Milad Golchinpour](https://github.com/imiladsoftware)
                        CANTACT: miladsoftware@icloud.com
                        PREMISSIONS: PHOTOS CAMERA ROLL, CELLULAR DATA
                        RUN ON: iPhone, iPad, iPod Touch, MacBook ARM
                        CLOUD: [FIREBASE](https://firebase.google.com)
                        DATABASE: [FIREBASE FIRESTORE](https://firebase.google.com)
                        STORAGE: [FIREBASE STORAGE](https://firebase.google.com)
                        USING GOOGLE UTILITIS
                        """)
                    Text("Copyright © 2021 Milad Golchinpour.\nAll rights reserved.\n").font(.headline)
                }
                
                // MARK: - PLACES IMAGE GALLERY CREDITS
                Group {
                    Text("PLACES IMAGE GALLERY CREDITS").font(.title3).bold()
                    Text("Recommended Places").font(.headline)
                    recommendedCR
                }
            }
            .font(.caption)
            .accentColor(.blue)
        }
        .navigationTitle("Credits")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}

// Write credits in swift string type 'cause few reasons
// MARK: - Places Image Gallery Credits
let recommendedCR = Text(
    """
    Place: Alaska coast
    CREDIT: [akwildernesscharters](https://www.akwildernesscharters.com/gallery/alaska-coast.htm)
    CREDIT: [alaska](https://www.alaska.org/detail/alaska-coast-to-denali-adventure)
    CREDIT: [amazon](https://www.amazon.com/Coast-Guard-Alaska-Season-1/dp/B00CQLRBIA)
    CREDIT: [alaskatours](https://alaskatours.com/alaska-stories/kayaking-in-alaska/)
    Place: Astoria, Oregon
    CREDIT: [wweek](https://www.wweek.com/news/2020/03/21/mayor-of-astoria-appalled-by-irresponsible-vacationers-hitting-the-oregon-coast-during-a-pandemic/)
    CREDIT: [hollandamerica](https://www.hollandamerica.com/en_US/ports/astoria-oregon-us.html)
    CREDIT: [psmag](https://psmag.com/economics/commercial-fishermen-get-together-recite-poetry-74049)
    CREDIT: [nydailynews](https://www.nydailynews.com/new-york/queens/astoria-queens-astoria-oregon-share-article-1.118531)
    CREDIT: [wanderlustforone](http://www.wanderlustforone.com/destinations/one-day-astoria-oregon/)
    CREDIT: [oregonisforadventure](https://oregonisforadventure.com/astoria-oregon/)
    Place: Big Sky
    CREDIT: [skibutlers](https://www.skibutlers.com/blog/big-sky-local-guide)
    CREDIT: [cntraveler](https://www.cntraveler.com/story/big-skys-sweeping-revamp-moves-the-montana-resort-beyond-ski)
    CREDIT: [visitbigsky](https://www.visitbigsky.com/get-inspired/big-sky-stories/where-to-stay-in-big-sky-montana)
    CREDIT: [postregister](https://www.postregister.com/business/m-ultra-luxury-resort-under-construction-at-big-sky-mont/article_6c92da12-86b4-519c-995c-f05ea8b864a1.html)
    CREDIT: [centresky](https://centresky.com/project/madisons-view-moonlight-basin-big-sky-montana/)
    CREDIT: [matadornetwork](https://matadornetwork.com/read/big-sky-ski-montana/)
    Place: The Berkshires
    CREDIT: [housatonicheritage](https://housatonicheritage.org/Places/berkshire-visitors-bureau-the-berkshires-in-western-massachusetts/)
    CREDIT: [ft](https://www.ft.com/content/f0cb4972-6838-11e5-a57f-21b88f7d973f)
    CREDIT: [wikipedia](https://en.wikipedia.org/wiki/Berkshires)
    CREDIT: [jetsetter](https://www.jetsetter.com/magazine/best-romantic-getaways-berkshires/)
    CREDIT: [macsadventure](https://www.macsadventure.com/us/tour-2436/appalachian-trail-hiking-the-berkshires/)
    CREDIT: [berkshireeagle](https://www.berkshireeagle.com/archives/berkshire-destinations-new-guidebook-provides-hike-ideas-with-wow-factor/article_ed3c7f2d-886e-5aef-a57a-f9352f5a839e.html)
    Place: The Catskills
    CREDIT: [visitthecatskills](https://www.visitthecatskills.com/hiking)
    CREDIT: [wikipedia](https://en.wikipedia.org/wiki/Catskill_Mountains)
    CREDIT: [untappedcities](https://untappedcities.com/2019/11/13/10-must-visit-places-in-the-catskills-ny-an-untapped-new-york-guide/9/)
    CREDIT: [ft](https://www.ft.com/content/5f0f72ac-1cc9-11ea-81f0-0c253907d3e0)
    CREDIT: [winetraveler](https://www.winetraveler.com/new-york/hudson-valley-road-trip-itinerary-travel-guide/)
    CREDIT: [openspaceinstitute](https://www.openspaceinstitute.org/places/catskills)
    Place: The Gulf Coast
    CREDIT: [galactic-stone](http://galactic-stone.com/gulf-coast-florida-beach-sand-pearly-white-sugar-sand/)
    CREDIT: [traveler.marriott](https://traveler.marriott.com/beach-travel/florida-gulf-coast-beaches/)
    CREDIT: [oceanreefresorts](https://www.oceanreefresorts.com/blogs/why-sand-destin-so-white)
    CREDIT: [30a](https://30a.com/why-is-30a-sand-white/)
    CREDIT: [idesigngallery](https://idesigngallery.com/products/sugar-sand-carribbean-beach-pier?variant=20282152131)
    CREDIT: [cntraveler](https://www.cntraveler.com/galleries/2016-03-28/the-10-best-beaches-in-florida)
    Place: Las Vegas
    CREDIT: [hotels](https://www.hotels.com/go/usa/things-to-do-las-vegas)
    CREDIT: [travelandleisure](https://www.travelandleisure.com/travel-tips/best-time-to-visit-las-vegas)
    CREDIT: [fodors](https://www.fodors.com/world/north-america/usa/nevada/las-vegas/experiences/news/10-things-to-know-before-you-go-to-las-vegas)
    CREDIT: [cntraveler](https://www.cntraveler.com/story/how-las-vegas-a-city-built-on-tourism-is-dealing-with-the-coronavirus-outbreak)
    CREDIT: [igbnorthamerica](https://www.igbnorthamerica.com/operators-begin-to-reopen-las-vegas-casinos/)
    CREDIT: [hotelmanagement](https://www.hotelmanagement.net/development/hilton-grows-las-vegas-portfolio)
    Place: Oahu
    CREDIT: [vagamundeando](http://vagamundeando.co/30-things-to-do-in-oahu-hawaii/)
    CREDIT: [escape](https://www.escape.com.au/destinations/north-america/usa/hawaii/stay-a-while-top-things-to-do-in-oahu-hawaii/news-story/f37bf466a50d2f047a37a51ecf591a7d)
    CREDIT: [wedreamoftravel](https://www.wedreamoftravel.com/oahu-instagram-spots/)
    CREDIT: [media.gohawaii](https://media.gohawaii.com/oahu)
    CREDIT: [journeyera](https://www.journeyera.com/oahu-hawaii-gallery/)
    CREDIT: [journeyera](https://www.journeyera.com/best-things-to-do-on-oahu/)
    """
)
