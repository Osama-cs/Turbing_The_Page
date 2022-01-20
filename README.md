# Turning The Page (individualproject)

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
    - If the entry already exists, append the flutter path to flutter\bin using ;.
    - If the entry doesn't exist, create a new variable caled 'Path', with the full path to flutter\bin as it's value. 

Now that flutter is intsalled on our computer we have to run flutter doctor, to actually run the downaload the SDK. From the console window that has the flutter directory in the path we run this command:

_flutter doctor_


**Andriod Setup**

Now that flutter has been installed onto the computer we now need an IDE to actually run the project on. An the IDE I have chosen to show you how to install is Andriod Studio. However, you can use Visual Studio Code as well to run the application as well.

Install Andriod Studio

1. Download and install Andriod Studio, from this link: https://developer.android.com/studio

2. Open up andriod studio and go through the setup and this will install a number of SDK's that will allow flutter to run.

3. Then run flutter doctor again to make sure that the right SDKs have installed so you can move onto the application.

**Set Up Andriod Emulator**

Now we need an emulator so we can run Turning The Page, so if we follow these sets we can make that happen.

1. Once you have clonned the repository, and have opened up the project in andriod studio click the AVD Manager Icon and then select Create Virtual Device.

2. Chose a device that you would to run the application on and click next.

3. Select one of the system images (You might have to install one if none have already been installed, and you do this by clicking the install button next to the chosen system image), then click next.

4. Verify the AVD configuration is correct and select Finish.

5. Now you get taken back to the Andriod Virtual Device Manager, click the green arrow to run the emulator.

6. Finally once the emulator has loaded, you can now make sure that Main.Dart is selected, next to the device icon that shows the emualtor name and click the green arrow next to Main.Dart to run the application. 

## Assumptions on design and development

The assumptions I will make on the user will be:

- That the user has Windows.
- The user has installed flutter.
- The user has an IDE that can run an andriod emulator.
- The user knows how to use an andriod phone for using the andriod emualtor.

## Requirements

| Requirement | MVP | Implemented? |
| ------ | ------ | ------ |
| DB to store all the journals. | Yes | Yes |
| DB to store all the to-do lists. | Yes | Yes |
| Be able to write journals and attach a date to them.  | Yes | Yes |
| Be able to write journals and attach a date to them.  | Yes | Yes |
| Have a page that shows you your finished to-do list. | Yes | Yes |
| Have a page that shows you your finished dairy entries. | Yes | Yes |
| Be able to view your mood for the day on a calendar.  | Yes | Yes |
| Delete journal entries button. | No | No |
| Have a page that tells you about mental health helplines. | No | Yes |
| Have a button that shows you the nearest counselling service near you. | No | Yes |
| Have a consistent colour scheme. | Yes | Yes |
| Have clear and readable buttons. | Yes | Yes |
| Make sure that the user isn’t confused on where they are in the app. | Yes | Yes |
| Have a bottom navigation bar so they can access any page on the application. | No | Yes |
| Have a button that will take you to a page that will allow you to access the miscellaneous pages on the application. | No | Yes |
| Can change the text size of the app. | No | No |
| Can zoom in on the app. | No | No |
| Journal entries that the user has put in. | Yes | Yes |
| To-do lists that the users have made. | Yes | Yes |
| Displaying the To-do lists on its own page and simple to read. | Yes | Yes |
| Data being stored on Firebase. | No | Yes |
| Using Firebase services to store the data online. | No | Yes |

## Frameworks, languages and libraries that have been used

- Flutter - is an open source framework that is made by google that I used to make my application. I used this framwork becasue I wanted to make a mobile application but try something new in the process, so using something like flutter that can be used for mobile development, it being open source so you have access to a lot of user made dependencies, how user friendly the documenation was, and having the ability to make the application work on ios devices with no extra code needed.
  Link: https://flutter.dev/#:~:text=Flutter%20is%20an%20open%20source,applications%20from%20a%20single%20codebase. 
- Dart - Is the coding language that is used for flutter and is made by google. So I didn't really have a choice to use anything other than dart here, but I'm glad that I did becasue the programming language was very user friendly and becasue of how widgets worked it made sorting all of your code a lot easier, thus making it easier to code. Also as it's a C-style syntax it was relavitly easy to pick up with my background with C#.
  Link: https://dart.dev/
- Google Maps API - This is the most popular maps api. Also it is made by google so implemting it with Flutter becomes a lot easier as Google makes it a very easy process. So with this in mind I decided to use Google maps for my application. Also with Google maps being a lot more accurate than other maps API made me choose it as well, so I can more accuratly but the pins down for the GP/Counsellors in your area.
  Link: https://developers.google.com/maps/documentation
- Google Firebase - The final libary that I used for my application was Googles Firebase. Firebase is a cloud database that allows an app developer to store user data on Googles cloud. With the use of Firebase Firestore, can store any data that get's sent from the application to get stored here for safe keeping. Using Firebase Autheentication, allows for the app developer to store user's log in information so they can login in and out of the application with ease, and not having it on the application itself makes it better because if the application get's hacked they won't get the user's login information, they'll have to get in from Google Firebase. The reason why I chose to use this was becasue it was realtivly easy to implement because, again it is made by google so it has good crossover with flutter and it allows for the user's data to be a lot more safer and not relent on storing the information on the application itself.
  Link: https://firebase.google.com/
