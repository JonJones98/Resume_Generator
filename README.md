# Resume Generator

A Spring Boot web application that allows users to create professional resumes without worrying about formatting. Users can input their information through an intuitive web interface and generate well-formatted resumes.

## Features

- **User Management**: User registration and authentication system
- **Resume Sections**: Support for multiple resume sections including:
  - Header Information (Personal details)
  - Education
  - Work Experience
  - Skills
  - Projects
  - Honors and Awards
- **Web Interface**: User-friendly JSP-based web interface
- **Database Persistence**: MySQL database integration for storing user data and resumes
- **Resume Templates**: Multiple resume templates for different formats
- **Print-Ready Output**: Generate print-ready resume formats

## Technology Stack

- **Backend**: Spring Boot 2.7.3
- **Java Version**: Java 8
- **Database**: MySQL
- **ORM**: Spring Data JPA with Hibernate
- **Frontend**: JSP, CSS, HTML
- **Build Tool**: Maven
- **Web Server**: Embedded Tomcat with AJP connector support

## Prerequisites

- Java 8 or higher
- MySQL 5.7 or higher
- Maven 3.6 or higher

## Setup and Installation

### 1. Database Setup

1. Install and start MySQL server
2. Create a database named `resumegenerator`:
   ```sql
   CREATE DATABASE resumegenerator;
   ```
3. Update database credentials in `src/main/resources/application.properties` if needed:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/resumegenerator
   spring.datasource.username=root
   spring.datasource.password=ROOTROOT
   ```

### 2. Application Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Resume_Generator
   ```

2. Navigate to the ResumeGenerator directory:
   ```bash
   cd ResumeGenerator
   ```

3. Build the application:
   ```bash
   ./mvnw clean install
   ```

4. Run the application:
   ```bash
   ./mvnw spring-boot:run
   ```

The application will start on `http://localhost:8080`

## Usage

1. **Registration**: Create a new user account
2. **Login**: Sign in with your credentials
3. **Resume Creation**: Fill out the different sections of your resume:
   - Personal information
   - Education details
   - Work experience
   - Skills
   - Projects
   - Honors and awards
4. **Template Selection**: Choose from available resume templates
5. **Preview and Print**: Review your resume and generate a print-ready version

## Project Structure

```
ResumeGenerator/
├── src/main/java/com/core/ResumeGenerator/
│   ├── controllers/          # REST controllers
│   ├── models/              # JPA entity classes
│   ├── repositories/        # Data access layer
│   ├── services/           # Business logic layer
│   └── ResumeGeneratorApplication.java
├── src/main/resources/
│   ├── application.properties
│   └── static/css/         # Stylesheets
├── src/main/webapp/WEB-INF/ # JSP view templates
└── src/test/               # Unit tests
```

## API Endpoints

The application provides web endpoints for:
- User authentication and registration
- Resume section management (CRUD operations)
- Resume template rendering
- Resume generation and export

## Configuration

### Application Properties

Key configuration options in `application.properties`:

- **Database Configuration**: MySQL connection settings
- **View Configuration**: JSP view resolver settings
- **JPA Configuration**: Hibernate DDL auto-update settings

### Server Configuration

- **HTTP Port**: 8080 (default)
- **AJP Port**: 9090 (configured for integration with reverse proxies)

## Development

### Running Tests

```bash
./mvnw test
```

### Building for Production

```bash
./mvnw clean package
```

This creates a WAR file in the `target/` directory that can be deployed to any servlet container.

