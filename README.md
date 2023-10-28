# Business Card Scanner

A mobile application that allows you to scan business cards, extract text information using Google ML Kit Text Recognition, and manage the scanned data. You can add the extracted contact details to your phone's contacts and perform various actions on the scanned business cards.

## Features

- **Business Card Scanning**: Use your device's camera to scan business cards and extract text information.

- **Text Recognition**: Utilizes the Google ML Kit Text Recognition package to extract text from scanned images.

- **Database**: Stores the scanned business card data in a SQLite database for easy retrieval and management.

- **Architecture**: Follows the Model-View-Controller (MVC) architecture for organized code structure.

- **State Management**: Implements GetX for efficient state management in the application.

- **Contact Integration**: Allows you to add scanned contact details directly to your phone's contacts.

- **Edit and Delete**: Edit or delete the scanned business card entries.

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/siyadkp/Business_Card_Scanner.git
cd business-card-scanner
