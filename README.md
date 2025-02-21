**Running XCUI Tests for Apple News**

**Prerequisites**

Before running the UI tests, ensure you have the following setup:

-> Xcode installed 

-> macOS compatible with the Xcode version

-> Simulator configured (e.g., iPhone 15 Pro)

Enable UI testing permissions under System Preferences

**Steps to Run the Tests**

1️⃣ Open the Project in Xcode

Open Xcode and load the project AppleNewsUITests.xcodeproj containing the AppleNewsUITests.

Select a valid simulator (e.g., iPhone 15 Pro) from the Xcode toolbar.

2️⃣ **Enable UI Testing Scheme**

Make sure the test scheme is enabled:

Go to Xcode Menu → Product → Scheme → Edit Scheme.

Select Test from the left panel.

Under the Info tab, ensure AppleNewsUITests is selected.

3️⃣ **Grant Required Permissions**

Since the Apple News app may require location or notifications permissions, pre-grant them before running tests.

✅ Enable Permissions via Terminal

Run the following command:

xcrun simctl privacy booted grant all com.apple.news
This will allow the Apple News app to use location, notifications, and other required permissions.

4️⃣ **Run the UI Tests**

✅ Using Xcode

Open the AppleNewsUITestsUITests.swift file.

Press Cmd + U to run all tests.

Alternatively, run a test by clicking the diamond play button next to the test function.

Also you can click on the Product -> Test

Debugging & Logs

Viewing Test Reports in Xcode

Open Xcode → Cmd + 9 to open the Reports Navigator.

Select the test session and review logs or screenshots for failed tests.

Accessing Screenshots for Failures

Navigate to: ~/Library/Developer/Xcode/DerivedData/AppleNewsUITests/Logs/Test

Open the .xcresult file in Xcode to view the screenshots.

Test Cases Implemented

📌 Test 1: Navigate to Tennis Sports News

✅ Steps:

Launch the Apple News app.

Tap Continue if prompted.

Verify Today tab exists.

Tap Sports tab.

Open the Sections menu and select Tennis.

Verify Tennis title appears.

📌 Test 2: Discover More Channels

✅ Steps:

Launch the Apple News app.

Tap Continue if prompted.

Navigate to the Following tab.

Scroll and tap Discover Channels.

Search for Ottawa Citizen.

Verify Ottawa Citizen appears in search results.

Troubleshooting

❌ Issue: App is running in headless mode

💡 Solution: Ensure that the simulator is open and running:

open -a Simulator
❌ Issue: Tests fail due to UI elements not found

💡 Solution: Add explicit waits before interacting with elements:

let element = app.buttons["Continue"]
XCTAssertTrue(element.waitForExistence(timeout: 5), "Element not found!")
❌ Issue: Build input file cannot be found

💡 Solution: Clean and rebuild the project:

Cmd + Shift + K  # Clean build folder
Cmd + B  # Rebuild project
**Conclusion**

Following the steps in this guide, you can efficiently run XCUI tests for the Apple News app on a simulator. For debugging failed tests, use Xcode’s test report logs and screenshots.
