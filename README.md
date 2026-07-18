# Chat App

A messaging application built with Flutter using Clean Architecture and BLoC state management.

This project is a demo messenger application that connects to a Django REST API backend with JWT authentication.

The goal of this project is to demonstrate scalable Flutter development practices, including feature-based architecture, dependency injection, repository pattern, and BLoC state management.

## Current Features

### Authentication
- User login flow implemented
- BLoC-based state management
- Repository pattern for separating business logic and data access
- Dependency injection for AuthRepository
- Fake authentication data source for development/testing
- Authentication states:
  - Initial
  - Loading
  - Authenticated
  - Failure

## Architecture

The project follows a feature-based clean architecture approach:
