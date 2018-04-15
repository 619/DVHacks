# DVHacks
Wellness B2B experiences organizer app built at DVHacks 2018. Utilizes off-peak transportation to improve the economics of the business as well as the scheduling. Please pm Mr. Panino on slack for access to the Firebase Database. This app was designed for and works best on the iPhone X. Setting the proper restraints for iPhone 8, iPhone 8 Plus, iPhone SE, and iPad is out of the scope of this hackathon.

## Description
The app allows for end users to register on the platform (using Firebase Authentication) and browse and enroll into upcoming experiences. Upon registration, the user's preferences (indoor vs. outdoor, alone vs. team, etc) are recorded, to be used to customize the home feed to suggest the most suitable experiences.

Users are then greeted with the home feed, comprised of a UITableView which pulls live data directly from a Firebase server using Firebase logic and the Alamofire package (for images stored in Firebase Storage) to populate its cells. The logic for the feed resides in HomeVC.swift.

Selecting an experience from the home feed brings the user to the page for the selected experience. The profile page for the experience (TripVC.swift) includes information about the experience again taken live from the Firebase database. The user can enroll into the experience, which should add the experience into the user's upcoming trips, which the user can come back to at any time. 

## Instructions
Create a new account to begin the experience. Choose trip preferences and proceed, then pick an option in the home feed. Click through the trip profile page (Join button at the bottom) and then proceed the rest of the way.
## Stack
- Front End - Swift
- Back End - Firebase Realtime Database, Firebase Storage (for images), Firebase Authentication

## Next Steps
Utilize the Google Maps API to provide the user more information on the location of the experience as well as live updates for the location of transportation. Implement push notifications to remind the user when the bus is nearly at the pickup point. Implement a joint HR-employee payroll payment solution.
