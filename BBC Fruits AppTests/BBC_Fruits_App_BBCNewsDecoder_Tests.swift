//
//  BBC_Fruits_App_BBCNewsDecoder_Tests.swift
//  BBC Fruits AppTests
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import XCTest
@testable import BBC_Fruits_App

class BBC_Fruits_App_BBCNewsDecoder_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    var jsonHeadlines : String {
        return """
            {
                "headlines":[
                    {"headline":"Rare angel sharks found living off Wales", "updated":1448401928, "introduction":"Scientists have found evidence that one of the world's rarest sharks is alive and well, living off the Welsh coast."},
                    {"headline":"Neanderthals 'could kill at a distance'", "updated":1448601928, "introduction":"Neanderthals may once have been considered to be our inferior, brutish cousins, but a new study is the latest to suggest they were smarter than we thought - especially when it came to hunting."},
                    {"headline":"The vegan leather brewed in a lab", "updated":1448600928, "introduction":"As soon as I meet Andras Forgacs we head outside into the freezing cold of Davos. Naturally he reaches for his coat, but I am slightly surprised at what he pulls out - it's just a normal, black puffer jacket."},
                    {"headline":"Mysterious radio signals from deep space detected", "updated":1448600926, "introduction":"Astronomers have revealed details of mysterious signals emanating from a distant galaxy, picked up by a telescope in Canada."},
                    {"headline":"Dippy the dinosaur goes on public display in Glasgow", "updated":1459709926, "introduction":"Dippy the dinosaur has gone on public display in Scotland for the first time as part of a UK tour."},
                    {"headline":"Dinosaur find resolves T. rex mystery", "updated":1459709026, "introduction":"Meet the newly discovered dinosaur that could hold the evolutionary key to how T. rex became such a giant."},
                    {"headline":"What makes people deeply dippy for dinosaurs?", "updated":1459609026, "introduction":"The Natural History Museum's most famous resident is on tour - and the crowds gathering to see Dippy suggest a dinosaur love affair that's far from extinct. But what explains this gut-level fascination for doomed reptiles from which we are separated by millions of years?"},
                    {"headline":"How to say: Diplodocus", "updated":1546300800, "introduction":"The Natural History Museum in London is removing the model diplodocus skeleton which has stood in its entrance hall for 44 years. But how should the creature's name be pronounced, asks Justin Parkinson."},
                    {"headline":"What dinosaur footprints tell us", "updated":1546300000, "introduction":"While skeletons show us what dinosaurs looked like, their footprints can reveal how they moved and behaved. Dr Peter Falkingham, a biologist at Liverpool John Moores University in the UK, analyses dinosaur tracks from around the world."}
                ]
            }
        """
    }
    
    func testDecodeHeadlines() {
        let data: Data? = jsonHeadlines.data(using: .utf8)
        
        do {
            let headlines = try BBCNewsDecoder.decodeJSON(data: data!, type: Headlines.self)
            let expected = 9
            let result = headlines?.headlines.count ?? 0
            print(result)
            XCTAssert(expected == result, "Test failed: tell me what you want")
        } catch let e {
            XCTFail("Test failed: \(e.localizedDescription)")
        }
    }
    
}
