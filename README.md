# Virtual Classroom

A web-based classroom management system designed to manage students, staff, learning materials, attendance, communication, and administrative operations.

## Features

### Student Module
- Student registration and login
- Profile management
- Profile image upload and update
- Course-wise attendance tracking
- Attendance percentage calculation
- Downloadable learning materials
- Communication with staff
- Message and notification management
- Password change and forgot-password functionality

### Staff Module
- Staff authentication and account management
- Upload and manage learning materials
- Activate, deactivate, and delete uploaded resources
- Student and staff communication
- Message and notification management
- Password management

### Admin Module
- Admin authentication
- Course and category management
- Staff management
- Learning material management
- Staff and user reports
- Feedback management
- Administrative data management

## Technology Stack

- **Frontend:** ASP.NET Web Forms
- **Backend:** C#
- **Database:** Microsoft SQL Server
- **Database Access:** ADO.NET
- **Version Control:** Git, GitHub

## Database

The application uses **Microsoft SQL Server** for storing application data.

ADO.NET components such as `SqlConnection`, `SqlCommand`, `SqlDataAdapter`, and typed DataSets/TableAdapters are used for database operations.

## How It Works

The system is divided into three main modules:

```text
                    Virtual Classroom
                           |
          +----------------+----------------+
          |                |                |
       Student           Staff            Admin
          |                |                |
     Attendance      Study Materials    User Management
     Materials       Communication      Course Management
     Messaging        Notifications     Reports
     Profile          Account           Feedback
