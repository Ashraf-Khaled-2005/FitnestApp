# FitnestApp

## Overview

FitnestApp is a comprehensive fitness application offering a variety of features to enhance your workout experience. It integrates Firebase for authentication and storage, supports interactive 3D offers, and provides detailed exercise information categorized by body parts.

## Key Features

- **User Authentication**:
  - Secure sign-up and login using Firebase Authentication with email, password, and Google.

- **Image Picking & Storage**:
  - Users can pick and upload images to Firebase Storage.
  - Manage and display user images stored in Firebase.

- **Latest Offers**:
  - View latest offers with a 3D viewer for items.

- **Payment Integration**:
  - Secure payment processing through PayPal.

- **Exercise Management**:
  - Fetch, categorize, and display exercises by body parts.
  - Detailed instructions and GIF images for each exercise.

- **Notifications & Scheduling**:
  - Receive notifications and scheduled alerts for specific exercises.

- **Latest Exercises View**:
  - Access and view the latest exercises with detailed information.

- **Annotations**:
  - Add annotations to images or exercises for clarity.

- **Splash & Onboarding Screens**:
  - Engaging splash screen and onboarding process.

- **Clean Architecture**:
  - Uses MVVM (Model-View-ViewModel) for maintainable code.

## Technical Details

- **Flutter**: Developed using Flutter for a responsive, cross-platform experience.

- **Firebase Authentication**:
  - Manages user authentication with email/password and Google.

- **Firebase Storage**:
  - Stores user images and other media files.

- **Firebase Firestore**:
  - Handles real-time data synchronization for user information and exercises.

- **PayPal Integration**:
  - Facilitates payment processing.

- **3D Viewer**:
  - Interactive 3D viewer for offers.

- **API Integration**:
  - Fetches exercise data categorized by body parts, including detailed instructions and GIF images.

- **Notifications**:
  - Implements notifications and scheduling for exercise reminders.

- **MVVM Architecture**:
  - Adopts MVVM for clean code separation and management.

## API Integration

### Endpoints and Data Retrieval

1. **Fetch Exercise Categories**
   - **Endpoint**: `/api/exercise-categories`
   - **Method**: `GET`
   - **Description**: Retrieves a list of exercise categories, each representing a different body part (e.g., upper body, lower body).

2. **Fetch Exercises by Body Part**
   - **Endpoint**: `/api/exercises/{categoryId}`
   - **Method**: `GET`
   - **Description**: Retrieves a list of exercises for a specific body part.
   - **Parameters**:
     - `categoryId`: ID of the exercise category (e.g., upper body, lower body).

3. **Fetch Exercise Details**
   - **Endpoint**: `/api/exercises/{exerciseId}`
   - **Method**: `GET`
   - **Description**: Retrieves detailed information about a specific exercise.
   - **Parameters**:
     - `exerciseId`: ID of the exercise.

## Installation

1. **Clone the Repository**:
   ```bash
   git clone <https://github.com/Ashraf-Khaled-2005/FitnestApp.git>
