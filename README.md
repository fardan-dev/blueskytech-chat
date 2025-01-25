# blueskytech-chat
## Requirement
- XCode 15.4
- Swift 5+

## Library Dependencies
- RealmSwift

## Features
- Send and receive messages
- Local notifications for new messages
- Local data storage using Realm

## Project Structure

- `App/`: Contains main application files like `Blueskytech_ChatApp.swift`.
- `Core/`: Contains core application logic including data, domain, and utilities.
  - `Data/`: Contains local data source (`LocaleDataSource.swift`) and entities (`ChatEntity.swift`).
  - `DI/`: Contains dependency injection files (`Injection.swift`).
  - `Domain/`: Contains models (`ChatModel.swift`) and use cases (`ChatInteractor.swift`).
  - `Utils/`: Contains mappers (`ChatMapper.swift`) and extensions (`CustomError+Ext.swift`).
- `Module/`: Contains chat module including presenter (`ChatPresenter.swift`) and view (`ChatView.swift`).
- `FileSystem/`: Contains application assets like icons and colors.

## Usage
1. Open the application.
2. Select a user tab (left or right).
3. Type a message and press the "Send" button to send the message.
4. The message will appear on the screen and a local notification will be displayed.

## Architecture Pattern
This project use Clean Architecture for the pattern. The main idea of using Clean Architecture is to produce a system that:
- **Independent of Framework:** This does not depend on the implementation of the framework used and places the framework only as a tool.
- **Testable:** Code for business processes is testable without the need for UI, databases, or other external elements.
- **Independent of UI:** UI can be changed easily, without the need to change the whole system.
- **Independent of Database:** This does not depend on a particular database framework and can be replaced easily.
- **Independent of External:** The existing business process does not need to know what is outside it.

This is an overview to represent Clean Architecture:

![general-description-clean-architecture](https://github.com/user-attachments/assets/67255b18-80e4-49ad-8087-131d8f937edc)


## Dependency Rule Clean Architecture

![dependency-rule](https://github.com/user-attachments/assets/a2aa231d-4297-44e8-8617-3eea119fa1b5)


Ensure that the Domain Layer (inner) does not access classes in the Presentation Layer and Data Layer (outer). But it's the outer class that accesses the inner class. By maintaining this rule, any changes to the Presentation Layer and Data Layer will not affect the Domain Layer. In conclusion, if we apply these rules, the application becomes independent, maintainable, and scalable.

## Demos App
https://github.com/user-attachments/assets/99e98f08-2dbc-4887-90f7-a0a65618bf08


## Contact
If you have any questions or issues, please open an issue in this repository or contact me at fardan.wardhana@gmail.com.
