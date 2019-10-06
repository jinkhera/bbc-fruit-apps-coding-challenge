# bbc-news-apps-coding-challenge

Universal iOS app for reading BBC News. Writen for iOS 11 using Swift 4. (Due to the age of my laptop I couldn't use the latest Xcode and Swift). 

Software architecture: **MVC**

## Getting Started

Clone the project to your local machine and open with Xcode 9.0. 

### Prerequisites

Xcode 9.0

### Running the app

iOS Device running iOS >= 11.0

## Running the tests

Unit tests: BBC News AppTests

## If I could do it again I would....

* Use Xcode 11 and Swift 5
* Implement persistance such as CoreData and use a NSFetchResultController with a TableView. 
* If implmenting CoreData would use background syncing to store data and a custom mapper. This would allow the TableView update automatically
* Check for internet connectivity using NWPathMonitor(Swift 5) or Reachability Class
* Would have loved to use SwiftUI
* UI/UX could be better but the app serves the purpose to read the article
* Implement some kind of exponential-back-off for retrying failed analytics requests

## Built With

* [Xcode](https://developer.apple.com/xcode/) - IDE
* [Swift](https://swift.org/) - Language

## Authors

* **Jin Khera** - *Initial work* - [Jin Khera](https://github.com/jinkhera)

See also the list of [contributors](https://github.com/jinkhera/) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* BBC News
