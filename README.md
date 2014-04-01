## Hair Etc App

This project is a ground-up rewrite of the first project completed at WDI.  The first project can be seen [here](https://github.com/fnc314/Project1).

## As an evolution of the first HairEtcApp

For this version of the appointment management application, I integrated [Devise](https://github.com/plataformatec/devise) for Client management and continued using [Twilio](www.twilio.com) for direct SMS messages sent to stylists.  I also gave the service a complete overhaul, with a mobile-first redesign, using [Bootstrap CSS](www.getbootstrap.com).  The redesign allowed me to vastly improve the user experience.

## Truly Mobile First Design

The best way for me to achieve a perfect mobile experience was to generate views that were specifically designed for mobile devices.  Therefore, I used D.R.Y. tactics and rendered partials that were designed for either mobile devices (mobile browsers or the dedicated Android app).  Using

```ruby
(request.user_agent =~ /Mobile/i).nil? ? 'desktopForm' : 'mobileForm'
```

my Rails server (running on Heroku in Ruby (2.1.1)) can determine if the connecting device is mobile or desktop.  Thus, the data transmission to the client is only the necessary HTML with all of the specific stylings in tact.  By using this method, I am able to send only necessary data to devices and I can ensure the user experience no matter how users access the platform.

## Live Deployment

The app can be seen here:
[HairEtcApp](https://hairetcapp.herokuapp.com/)

To explore the app, the following credentials are available:
- EMail: `abc@def.com` -OR- `example@example.com` -OR- `example@sample.com`
- Password: `1234567890` (for all accounts)

Notes:
- The first two emails are accounts with multiple appointments that allow users to test out deleting (examining the instant UI change) and to see what the application will look like populated with a decent amount of information
- The third account has no pre-made appointments and shows what a new user to the site would experience, once they are signed in
- All accounts can be used to delete and edit any appointment as well as create an appointment


The Android source code can be seen here:
[HairEtcAppAndroid](https://github.com/fnc314/hair_etc_app_android)

Notes:
- Without forking/cloning the repository, the Android app is unavailable for download
- The Android experience can be had using a mobile device's Chrome browser (testing was not done on Safari, Firefox, IE, or Opera on mobile devices)

## Future Upgrades

As it stands, users do not have a profile page and therefore cannot change informaiton after registration.  Nor can customers remove their account.  These features will be added on gradually and will be ready before any live roll-out of the application.

Over time I will be migrating the full functionality of this app to native Android.  I will recreate the views for Android application with the same consistent coloring but plan to handle all of the computation on the Android local device (thus reducing data usage even more).  The server I already built with Rails will handle the backend of the application and will receive the data from the Android app and handle the database.  This way, updates to the databases can be made without updates through the Play Store.

As the app stands, there is a strict requirement of Android 4.4 KitKat (it is in this version of Android that the `WebView` was moved to Chromium and therefore able to render the specific CSS stylings).  As I port the functionality to Android native, I will be able to lower the requirement to Android 2.3 Gingerbread (or Android 4.0 Ice Cream Sandwhich).

Due to the immense popularity of the iOS platform I will also work on a direct port.  However, that work will follow the Android port.

## The Experience

This project was a great way to really learn and master Rails (specifically `request.user_agent` and all of the different form builders; such as `collection_check_boxes` and `collection_radio_buttons`).  I realized when it is smart to use `.includes` to lighten the queary load on the database, inproving speed.  I am a lot more confident and comfortable with Rails after getting to apply all of my knowledge to this app.

I learned a vast amount about developing for Android and the power of Chrome DevTools.  I was able to route my Android 4.4 emulator to use my localhost Rails server, giving me not only real-time updates on the mobile interface but allow me to use Chrome's styling tools to determine exactly how to move the DOM elements for the `WebView`.  In doing this development work-around, I also faced first-hand exposure to how difficult developing for a fragmented operating system like Android can be.  During development, I had to upgrade my device (via CyanogenMod) to Android 4.4 KitKat so I was able to run the app.

Overall, I am excited to take this simple app farther and farther, using it to help me learn new languages and development environments.