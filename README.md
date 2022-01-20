# Turing The Page (individualproject)

Turning the page is the a diary entries app that will allow the user to make diary entires and be able to make to-do listsi to track their days.

## How to build and run your project

Here is where you can install flutter for yourself. This is also a very useful website if you want to look deeper at the documenation and look at code tutorials as well. 

Link: https://docs.flutter.dev/get-started/install

**System Requirements**

So the first things first is to install flutter, and you'll need to check your system to see if you meet the requirements.
The requirements for flutter are:

- A windoes 7SP1 or later (64-bit) operatiing system.
- You need 1.64BGs of space on your computer
- Windoes Powershell 5.0 or newer (Which comes with windows 10)
- Git for windows (https://git-scm.com/download/win)

**Downlading the Flutter SDK**

1. Using the link I gave you at the start you can click on the windows icon and scroll down to downaload the file called, flutter_windows_(VERSTION_ NUMBER, e.g. 2.8.1)-stable.zip

2. Next extract the zip file and place flutter wherever you can access it on your computer.

If you want the ability to run Flutter commands in your windows console then follow these steps to make it a relaity, however if you don't want that then move onto to Run Flutter Doctor section.

1. From the start search bar type in 'env' and select Edit the system variables. 

2. Under user variables, cehck if there is an entry called Path:
    - If the entry already exists, append the fluu path to flutter\bin using ;.
    - If the entry doesn't exist, create a new variable caled 'Path', with the full path to flutter\bin as it's value. 

Now that flutter is intsalled on our computer we have to run flutter doctor, to actually run the downaload the SDK. From the console windows that has the flutter directory in the oath we run this command:

_flutter doctor_


**Andriod Setup**

Now that flutter has been intsaled onto the computer we know need an IDE to actually run the project on. An the IDE I have chosen to show ou how to install is Andriod Studio. However, you can use Visual Studio Code as well to run the application as well.

Install Andriod Studio

1. Download and install Andriod Studio, from this link: https://developer.android.com/studio

2. Open up andriod studio and go through the setup and this will install an number of SDK's that will allow flutter to run.

3. Then run flutter doctor again to make sure that the right SDKs have installed so you can move onto the application.

**Set Up Andriod Emulator**

Now we need an emulator so we can run Turing The Page, so if we follow these sets we can make that happen.

1. Once you have clonned the repository, and have opened up the project in andriod studio click the AVD Manager Icon and then select Create Virtual Device.

2. Chose a device that you would to run the application on and click next.

3. Select one of the system images (You might have to install one if none have already been installed, and you do this by clicking the install button next to the chosen system image), then click next.

4. Verify the AVD configuration is correct and select Finish.

5. Now you get taken back to the Andriod Virtual Device Manager, click the green arrow to run the emulator.

6. Finally once the emulator has loaded you can now make sure that Main.Dart is selected next to the device icon that shows the emualtor name and click the green arrow nect to Main.Dart to run the application. 

## Assumptions on design and development

The assumptions I will make on the user will be:

- That the user has Windows.
- The user has installed flutter.
- The user has an IDE that can run an andriod emulator.
- The user knows how to use an andriod phone for using the andriod emualtor.

## Requirements

| Requirement | MVP | Implemented? |
| ------ | ------ | ------ |
| DB to store all the journals. | Yes | cell |
| DB to store all the to-do lists. | Yes | cell |
| Be able to write journals and attach a date to them.  | Yes | cell |
| Be able to write journals and attach a date to them.  | Yes | cell |
| Have a page that shows you your finished to-do list. | Yes | cell |
| Have a page that shows you your finished dairy entries. | Yes | cell |
| Be able to view your mood for the day on a calendar.  | Yes | cell |
| Delete journal entries button. | No | cell |
| Have a page that tells you about mental health helplines. | No | cell |
| Have a button that shows you the nearest counselling service near you. | No | cell |
| Have a consistent colour scheme. | Yes | cell |
| Have clear and readable buttons. | Yes | cell |
| Make sure that the user isn’t confused on where they are in the app. | Yes | cell |
| Have a bottom navigation bar so they can access any page on the application. | No | cell |
| Have a button that will take you to a page that will allow you to access the miscellaneous pages on the application. | No | cell |
| Can change the text size of the app. | No | cell |
| Can zoom in on the app. | No | cell |
| Journal entries that the user has put in. | Yes | cell |
| To-do lists that the users have made. | Yes | cell |
| Displaying the To-do lists on its own page and simple to read. | Yes | cell |
| DB to store all the to-do lists. | cell | cell |
| DB to store all the to-do lists. | cell | cell |

## Frameworks, languages and libraries that have been used
