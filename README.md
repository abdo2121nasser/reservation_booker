# 📖 Reservation Booker

A Friendly Application that makes booking appointments with specialists as easy as a few taps.
Filter specialists by these categories: Therapy & Counseling, Physical Therapy, Nutrition Counseling,Career Coaching, Yoga & Meditation,Fitness Training.
see real availability of the specialist, book, cancel or reschedule, and manage everything right from your phone.

## 📦 Setup Instructions

1. **Clone & Install**  
 
   git clone https://github.com/abdo2121nasser/reservation_booker.git  
   cd reservation_booker  
   flutter pub get
   flutter run
   
2. **🏗️ App Architecture**

     I used Cubit for all business logic—authentication toggles, fetching specialists, booking, canceling, and rescheduling.
     I Used the provider to controll the state managment of selecting date and time in booking and rescheduling process.

    **Authentication Flow**

      Toggle between Sign In and Sign Up on the Auth screen.<br>
      Using Firebase to Sign In and Sign Up.<br>
      On success, navigate to Main Screen.<br>
      on logout, clear state and return to Auth.<br>
      Persist login state so returning users skip auth.<br>

   **Main Screen (Bottom Navigation)**

     - Log out Button -> log out form Firebase -> return to Authentication screen

     1. Find Specialists Body<br>
     Fetch from Firebase → cache to Hive → always read from Hive.<br>
     Show some information about the specialist: its name , category , its rate.<br>
     Search by name or filter by category from Hive.<br>
     Pull‑to‑refresh updates Firestore + Hive.<br>

    2. My Appointments<br>

       List your booked appointments -> Fetch from Firebase -> stroe in Hive -> always read from Hive.<br>
       Show some information about the specialist: its name , category , its rate.<br>
       Cancel Appointment with a tap.<br>
       Reschedule Appointment with a tap -> navigate to specialist screen.<br>
   
   3. Specialist Details Screen

      Profile header + About section.<br>
      Horizontal date picker show not passed available dates and dates contain available times  → reveals not passed and not booked available times in selected date.<br>
      “Confirm” button books or reschedules -> hides booked time slotes -> auto‑refreshes appointments and specialists.<br>

3. **Folder Structure**

   lib/<br>
├── main.dart # App entry point<br>
├── app_root.dart # root widget<br>
├── configuration/ # App routing (GoRouter)<br>
│ └── routes.dart<br>
├── core/ # Shared utilities and services<br>
│ ├── utils/ # Colors, component, strings, values, images<br>
│ ├── services/ # Firebase Failure Service, Bloc observer, Strings validator service.<br>
│<br>
├── features/<br>
│ ├── authentication_feature/ <br>
│ │ ├── cubits/ #Sign In Cubit / Sign Up Cubit, Auth Switch Cubit<br>
│ │ ├── screens/ Authentication screen<br>
│ │ ├── widgets/<br>
│ │ ├── entities/ #Sign In / Sign Up entity<br>
│ │ ├── models/ # Sign In / Sign Up Models<br>
│ │ └── repositories/ # Sign In / Sign Up Repository<br>
│ │<br>
│ ├── find_specialist_feature/<br>
│ │ ├── cubits/ # FindSpecialstCubit, BookAppointmentCubit, etc.<br>
│ │ ├── entities/ # AppointmentEntity,CategoryEntity,ExtraDataEntity,SpecialistEntity,DataEntity, AvailableDateEntity, AvailableTimeEntity.<br>
│ │ ├── models/ # AppointmentModel, SpecialistModel,DataModel, AvailableDateModel, AvailableTimeModel.<br>
│ │ ├── repositories/ BookAppointmentRepository, GetSpecialistsRepository, StoreSpecialistsRepository.<br>
│ │ ├── screens/ # FindSpecialistScreen, SpecialistDetailsScreen<br>
│ │ └── widgets/ # search bar, etc.<br>
│ │<br>
│ └── my_appointments_feature/<br>
│ ├── cubits/ # GetMyAppointmentsCubit, CancelAppointmentCubit.<br>
│ ├── repositories/ # CancelAppointmentRepository,GetAppointmentRepository,RescheduleAppointmentsRepository,StoreMyAppointmentsRepository.<br>
│ ├── screens/ # My appointments list<br>
│ └── widgets/ # Appointment card, cancel/reschedule buttons<br>

4. **Business Understanding**<br>

   The App Facilitates finding and booking professionals. Instead of searching on phone numbers or sending endless emails, users can simply tap to browse specialists like "therapists or trainers" view his 
   profile section and his rate, see exactly when they’re free, and book an appointment instantly.<br>

5. **Known Limitations**<br>

   Authentication: No email verification or password reset.<br>
   Error Handling: toast message alerts but with no actions.<br>
   No Feedback or Rating: Users cannot leave feedback or rate specialists, nor view other users’ reviews.<br>


6. **Video Link**<br>

   Link:https://drive.google.com/drive/folders/1tzw11NW4pmGoKPRW47zxSpoXPO1Samyb?usp=sharing<br>





   



