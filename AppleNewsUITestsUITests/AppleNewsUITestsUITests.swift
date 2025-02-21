import XCTest

final class AppleNewsUITests: XCTestCase {
    
    let app = XCUIApplication(bundleIdentifier: "com.apple.news")
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        // Handle "Continue" button if it appears
        let continueButton = app.buttons["Continue"]
        if continueButton.waitForExistence(timeout: 5) {
            if continueButton.isHittable {
                continueButton.tap()
            }
        } else {
            print("Continue button not found after 5 seconds.")
        }
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testNavigationToTennisSportsNews() throws {
        // Step 1: Verify ‘Today’ tab exists
        let todayTab = app.tabBars.buttons["Today"]
        XCTAssertTrue(todayTab.waitForExistence(timeout: 10), "Today tab not found!")
            
        // Step 2: Navigate to the ‘Sports’ tab
        let sportsTab = app.tabBars.buttons["Sports"]
        XCTAssertTrue(sportsTab.waitForExistence(timeout: 10), "Sports tab not found!")
        sportsTab.tap()
            
        // Step 3: Verify ‘Sports Selection Menu’ button is visible
        let sportsMenuButton = app.buttons["Sections"]
        XCTAssertTrue(sportsMenuButton.waitForExistence(timeout: 10), "Sports menu button not found!")
            
        // Step 4: Select Tennis from Sports Selection menu
        sportsMenuButton.tap()
        let tennisMenuOption = app.buttons["Tennis"]
        tennisMenuOption.tap()
        let tennisTitle = app.staticTexts["Tennis"]
        XCTAssertTrue(tennisTitle.waitForExistence(timeout: 5), "Tennis title doesn't exist")
    }

    func testDiscoverMoreChannels() throws {
        // Step 1: Verify ‘Following’ tab exists
        let followingTab = app.tabBars.buttons["Following"]
        XCTAssertTrue(followingTab.waitForExistence(timeout: 5), "Following tab not found!")
        followingTab.tap()
            
        // Step 2: Scroll to the ‘Discover’ Button
        let discoverChannelsButton = app.buttons["Discover Channels"]
        while (!discoverChannelsButton.isHittable) {
            app.swipeUp()
        }
            
        XCTAssertTrue(discoverChannelsButton.waitForExistence(timeout: 10), "Discover button not found!")
        discoverChannelsButton.tap()
            
        // Step 3: Verify user can search Ottawa Citizen channel
        let searchField = app.searchFields["Search"]
        searchField.tap()
        searchField.typeText("Ottawa Citizen")
        searchField.typeText("\n")
        let channel = app.otherElements.containing(NSPredicate(format: "label CONTAINS %@", "Ottawa Citizen")).element
        XCTAssertTrue(channel.waitForExistence(timeout: 10), "Channel containing 'Ottawa Citizen' was not found!")
    }
}

