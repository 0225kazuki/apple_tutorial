//
//  apple_tutorialTests.swift
//  apple_tutorialTests
//
//  Created by 大友一樹 on 2017/10/02.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import XCTest
@testable import apple_tutorial

class apple_tutorialTests: XCTestCase {
    
    //MARK: Meal Class Test
    
    // Confirm that the meal initializer returns a meal object when passed valid parameters.
    func testMealInitializationSucceeds () {
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }
    
    func testMealInitializationFails() {
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
    
    
    
    
}
