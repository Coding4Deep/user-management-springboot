# User Management Application

A complete Java Spring Boot web application for user management with DevOps CI/CD practices.

## Features

- **User Registration & Authentication**: Secure user registration and login system
- **Password Security**: BCrypt password hashing for secure storage
- **Web Interface**: Clean, responsive Thymeleaf templates
- **Database**: H2 in-memory database with JPA/Hibernate
- **Security**: Spring Security with form-based authentication
- **Testing**: Comprehensive unit, integration, and controller tests
- **Containerization**: Docker and Docker Compose support
- **DevOps Ready**: Maven build, proper project structure, and CI/CD friendly

## Technology Stack

- **Backend**: Spring Boot 3.2.0, Spring Security, Spring Data JPA
- **Frontend**: Thymeleaf, HTML5, CSS3
- **Database**: H2 (in-memory)
- **Build Tool**: Maven 3.9+
- **Java Version**: 17
- **Testing**: JUnit 5, Mockito, Spring Boot Test
- **Containerization**: Docker, Docker Compose

## Quick Start

### Prerequisites
- Docker and Docker Compose
- Java 17+ (for local development)
- Maven 3.9+ (for local development)

### Running with Docker Compose (Recommended)

```bash
# Clone and navigate to the project
cd user-management-app

# Build and run the application
docker compose up --build -d

# The application will be available at http://localhost:8080
```

### Running Locally

```bash
# Build the application
./mvnw clean package

# Run the application
java -jar target/user-management-app-1.0.0.jar

# Or run directly with Maven
./mvnw spring-boot:run
```

## Application Endpoints

| Endpoint | Method | Description | Authentication Required |
|----------|--------|-------------|------------------------|
| `/` | GET | Home page (redirects to login) | No |
| `/login` | GET/POST | User login page | No |
| `/register` | GET/POST | User registration page | No |
| `/dashboard` | GET | User dashboard | Yes |
| `/h2-console` | GET | H2 database console | No |

## Testing the Application

### Automated API Tests
```bash
# Run the comprehensive API test suite
./test-apis.sh
```

### Manual Testing with curl

```bash
# Test registration
curl -X POST http://localhost:8080/register \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=testuser&email=test@example.com&password=password123"

# Test login page
curl http://localhost:8080/login

# Test dashboard (requires authentication)
curl http://localhost:8080/dashboard
```

### Running Unit Tests
```bash
# Run all tests
./mvnw test

# Run tests with coverage
./mvnw test jacoco:report
```

## Database Access

The application uses H2 in-memory database. You can access the H2 console at:
- URL: http://localhost:8080/h2-console
- JDBC URL: `jdbc:h2:mem:testdb`
- Username: `sa`
- Password: (leave empty)

## Project Structure

```
user-management-app/
├── src/
│   ├── main/
│   │   ├── java/com/example/usermanagement/
│   │   │   ├── UserManagementApplication.java
│   │   │   ├── config/SecurityConfig.java
│   │   │   ├── controller/UserController.java
│   │   │   ├── entity/User.java
│   │   │   ├── repository/UserRepository.java
│   │   │   └── service/
│   │   │       ├── UserService.java
│   │   │       └── CustomUserDetailsService.java
│   │   └── resources/
│   │       ├── application.properties
│   │       └── templates/
│   │           ├── login.html
│   │           ├── register.html
│   │           └── dashboard.html
│   └── test/
│       └── java/com/example/usermanagement/
│           ├── UserServiceTest.java
│           ├── UserControllerTest.java
│           └── UserManagementIntegrationTest.java
├── docker-compose.yml
├── Dockerfile
├── pom.xml
├── test-apis.sh
└── README.md
```

## Security Features

- **Password Hashing**: BCrypt with strength 12
- **CSRF Protection**: Enabled for all forms
- **Session Management**: Secure session handling
- **SQL Injection Prevention**: JPA/Hibernate parameterized queries
- **XSS Protection**: Thymeleaf template escaping

## Development

### Building the Application
```bash
# Clean and compile
./mvnw clean compile

# Package the application
./mvnw clean package

# Skip tests during build
./mvnw clean package -DskipTests
```

### Docker Commands
```bash
# Build Docker image
docker compose build

# View logs
docker compose logs -f

# Stop the application
docker compose down

# Remove containers and images
docker compose down --rmi all
```

## Configuration

Key configuration properties in `application.properties`:

```properties
# Server configuration
server.port=8080

# H2 Database
spring.datasource.url=jdbc:h2:mem:testdb
spring.h2.console.enabled=true

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=create-drop
spring.jpa.show-sql=true

# Security
spring.security.user.name=admin
spring.security.user.password=admin
```

## API Test Results

All endpoints tested successfully:
- ✅ Home page: 302 (redirect to login)
- ✅ Login page: 200 (success)
- ✅ Registration page: 200 (success)
- ✅ User registration: 302 (redirect after successful registration)
- ✅ Dashboard: 302 (redirect to login - authentication required)
- ✅ H2 Console: 302 (redirect to H2 console login)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## License

This project is licensed under the MIT License.
