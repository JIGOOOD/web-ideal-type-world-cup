# SKKU Ideal Type World Cup

## Overview

This project is a web-based application that enables users, particularly Sungkyunkwan University students, to engage in an "Ideal Type World Cup" game. The game involves choosing between options in a tournament-style format, eventually selecting a single winner. The website includes user authentication, database management, and interactive gameplay features.

## Features

### Sign-Up Page
![image](https://github.com/user-attachments/assets/66b3ffbf-b97c-42fb-ad77-b4ec170f7e68)
- **Form Validation**: Ensures all fields are filled before submitting. Alerts users if any field is left blank.
- **Password Matching**: Validates that the password and confirm password fields match.
- **Account Creation**: Stores user information (username, password) in the `users` table of the database.
- **Redirection**: Automatically redirects to the login page after successful sign-up.

### Login Page
![image](https://github.com/user-attachments/assets/055b3ec8-17b3-4d26-95f0-102b22ca7c3b)
- **Form Validation**: Ensures all fields are filled before submitting. Alerts users if any field is left blank.
- **Authentication**: Verifies user credentials against the database. Alerts users if authentication fails.
- **Login Success**: Updates the navigation bar to reflect the logged-in state (e.g., "Log In" changes to "Log Out").
- **Redirection**: Automatically redirects to the main page after successful login.

### Main Page
![image](https://github.com/user-attachments/assets/5f8b0fc3-35c9-4fd9-b607-ffa1e6e00709)
- **Navigation**: Provides links to other pages (Sign Up, Log In, My Log, World Cup).
- **Access Control**: Restricts access to the My Log and World Cup pages for non-logged-in users.
- **Logout**: Logs out the current user and redirects to the main page.

### World Cup Page
![image](https://github.com/user-attachments/assets/95c33418-117a-4e60-8db1-be99f73a7b70)
- **Tournament Format**: Displays a series of rounds (quarterfinals, semifinals, final) with randomly assigned candidates.
- **Dynamic Content**: Shows images and names of competing candidates.
- **Progress Tracking**: Indicates the current round and progress.
- **Navigation Restriction**: Prevents navigation to other pages (except the main page) while the tournament is in progress.

### Winner Page
![image](https://github.com/user-attachments/assets/16e686fc-b50d-4137-aa91-1feb2043ec05)
- **Final Selection**: Displays the selected winner's image and name.
- **Save Log**: Stores the winner's information in the `winner_log` table of the database and redirects to the My Log page.
- **Navigation**: Allows redirection to the main page without saving the log.

### My Log Page
![image](https://github.com/user-attachments/assets/da2ca746-ca60-496b-87cd-c3ab053e82cf)
- **Winner History**: Displays a table of previously selected winners with their topics, sorted chronologically.
- **Logout**: Logs out the current user and redirects to the main page.

## Database Structure

The application uses a MySQL database named `websitedb` with two main tables:

### 1. `users`
- **Columns**:
  - `username` (Primary Key): User's username.
  - `password`: User's password.

### 2. `winner_log`
- **Columns**:
  - `id` (Primary Key): Auto-incremented log ID.
  - `user_name`: Foreign key linking to the `users` table.
  - `subject`: Topic of the World Cup.
  - `image_url`: Image url.
  - `text`: Winner's name.

## How to Run

1. **Set Up Database**:
   - Create the `websitedb` database.
   - Set up the `users` and `winner_log` tables as described above.
   - Ensure proper database connection in the project files.

2. **Run the Application**:
   - Clone the repository to your local machine.
     ```bash
     git clone https://github.com/JIGOOOD/web-ideal-type-world-cup.git
     ```
   - Navigate to the project directory.
     ```bash
     cd web-ideal-type-world-cup/FinalProject
     ```
   - Open the project in your preferred IDE (e.g., IntelliJ IDEA, Eclipse).
   - Set up a local server such as Apache Tomcat in the IDE.
   - Deploy the project to the server and start the application.
   - Access the application through `http://localhost:8000` (or the port specified in your server configuration).

3. **Interact with the Website**:
   - Sign up for a new account.
   - Log in with the created credentials.
   - Play the Ideal Type World Cup game.
   - Save and view your logs in the My Log page.

## Technology Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Hosting**: Local server (Apache Tomcat) or cloud platform

## Future Improvements

- Add more World Cup topics.
- Allow users to create their own World Cup topics.
- Enhance UI/UX for a better user experience.

---

Enjoy the SKKU Ideal Type World Cup!
