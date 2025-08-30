# Quick Send - Sequence Diagrams

This document shows the sequence of interactions between users, UI components, BLoCs, repositories, and services for the main user flows in the Quick Send application.

## 1. Authentication Flow

### Login Sequence

```mermaid
sequenceDiagram
    participant User
    participant AuthScreen
    participant AuthBloc
    participant AuthRepository
    participant CachedService
    participant API

    User->>AuthScreen: Enter email & password
    User->>AuthScreen: Tap Login button
    AuthScreen->>AuthBloc: login(email, password)

    AuthBloc->>AuthBloc: emit(isLoading: true)
    AuthBloc->>AuthRepository: login(email, password)
    AuthRepository->>API: POST /login

    alt Login Success
        API-->>AuthRepository: 200 OK + AuthModelDto
        AuthRepository-->>AuthBloc: Right(userData)
        AuthBloc->>CachedService: cacheUserData(userData)
        AuthBloc->>CachedService: cacheToken(accessToken)
        AuthBloc->>AuthBloc: emit(successText: "Login Successful", hasSession: true)
        AuthBloc->>AuthBloc: emit(isLoading: false, hasSession: false)
        AuthScreen->>User: Navigate to Home
    else Login Failure
        API-->>AuthRepository: 401 Unauthorized
        AuthRepository-->>AuthBloc: Left(Failure)
        AuthBloc->>AuthBloc: emit(errorText: "Invalid email and password")
        AuthBloc->>AuthBloc: emit(isLoading: false)
        AuthScreen->>User: Show error message
    end
```

### Signup Sequence

```mermaid
sequenceDiagram
    participant User
    participant AuthScreen
    participant AuthBloc
    participant AuthRepository
    participant CachedService
    participant API

    User->>AuthScreen: Toggle to signup mode
    AuthScreen->>AuthBloc: onShowSignup(true)
    AuthBloc->>AuthBloc: emit(showSignup: true)

    User->>AuthScreen: Enter email, password, confirm password
    User->>AuthScreen: Tap Signup button
    AuthScreen->>AuthBloc: signup(email, password)

    AuthBloc->>AuthBloc: emit(isLoading: true)
    AuthBloc->>AuthRepository: signup(email, password)
    AuthRepository->>API: POST /signup

    alt Signup Success
        API-->>AuthRepository: 201 Created + AuthModelDto
        AuthRepository-->>AuthBloc: Right(userData)
        AuthBloc->>CachedService: cacheUserData(userData)
        AuthBloc->>CachedService: cacheToken(accessToken)
        AuthBloc->>AuthBloc: emit(successText: "Signup Successful", hasSession: true)
        AuthBloc->>AuthBloc: emit(isLoading: false, hasSession: false)
        AuthScreen->>User: Navigate to Home
    else Signup Failure
        API-->>AuthRepository: 400 Bad Request
        AuthRepository-->>AuthBloc: Left(Failure)
        AuthBloc->>AuthBloc: emit(errorText: "Account creation failed")
        AuthBloc->>AuthBloc: emit(isLoading: false)
        AuthScreen->>User: Show error message
    end
```

### Session Check Sequence

```mermaid
sequenceDiagram
    participant App
    participant AuthBloc
    participant AuthRepository
    participant CachedService

    App->>AuthBloc: initialized()
    AuthBloc->>AuthRepository: hasSession()
    AuthRepository->>CachedService: getToken()

    alt Has Valid Session
        CachedService-->>AuthRepository: Valid token
        AuthRepository-->>AuthBloc: true
        AuthBloc->>AuthBloc: emit(hasSession: true)
        App->>User: Navigate to Home
    else No Valid Session
        CachedService-->>AuthRepository: null/invalid token
        AuthRepository-->>AuthBloc: false
        AuthBloc->>AuthBloc: emit(hasSession: false)
        App->>User: Show Auth Screen
    end
```

## 2. Home Screen Flow

### Home Screen Initialization

```mermaid
sequenceDiagram
    participant User
    participant HomeScreen
    participant HomeBloc
    participant CachedService

    User->>HomeScreen: Navigate to Home
    HomeScreen->>HomeBloc: initialized()
    HomeBloc->>HomeBloc: emit(initial state)
    HomeScreen->>User: Display home interface
```

### Logout Sequence

```mermaid
sequenceDiagram
    participant User
    participant HomeScreen
    participant HomeBloc
    participant CachedService

    User->>HomeScreen: Tap logout button
    HomeScreen->>HomeBloc: logout()
    HomeBloc->>CachedService: clearCacheToken()
    CachedService->>CachedService: Delete all cached data
    HomeScreen->>User: Navigate to Auth Screen
```

### Toggle Amount Visibility

```mermaid
sequenceDiagram
    participant User
    participant HomeScreen
    participant HomeBloc

    User->>HomeScreen: Tap hide/show amount
    HomeScreen->>HomeBloc: toggleHideAmount()
    HomeBloc->>HomeBloc: emit(hideAmount: !current_state)
    HomeScreen->>User: Update amount visibility
```

## 3. Send Money Flow

### Send Money Transaction

```mermaid
sequenceDiagram
    participant User
    participant SendMoneyScreen
    participant SendMoneyBloc
    participant CachedService
    participant TransactionRepository
    participant API

    User->>SendMoneyScreen: Navigate to Send Money
    SendMoneyScreen->>SendMoneyBloc: initialized()

    User->>SendMoneyScreen: Enter amount (e.g., "P1000")
    User->>SendMoneyScreen: Tap Send button
    SendMoneyScreen->>SendMoneyBloc: sendMoney("P1000")

    SendMoneyBloc->>CachedService: getCacheUserData()

    alt User Found
        CachedService-->>SendMoneyBloc: UserModelDto
        SendMoneyBloc->>SendMoneyBloc: cleanAmount = "1000"
        SendMoneyBloc->>SendMoneyBloc: emit(isLoading: true)
        SendMoneyBloc->>TransactionRepository: sendPayment(senderId, 1000.0)
        TransactionRepository->>API: POST /transactions

        alt Payment Success
            API-->>TransactionRepository: 200 OK
            TransactionRepository-->>SendMoneyBloc: Right(success)
            SendMoneyBloc->>SendMoneyBloc: emit(isLoading: false, successText: "Successfully sent P1000")
            SendMoneyScreen->>User: Show success message
        else Payment Failure
            API-->>TransactionRepository: 400 Bad Request
            TransactionRepository-->>SendMoneyBloc: Left(Failure)
            SendMoneyBloc->>SendMoneyBloc: emit(isLoading: false, errorText: failure.message)
            SendMoneyScreen->>User: Show error message
        end

        SendMoneyBloc->>SendMoneyBloc: emit(errorText: null, successText: null)
    else User Not Found
        CachedService-->>SendMoneyBloc: null
        SendMoneyBloc->>SendMoneyBloc: emit(errorText: "User not found")
        SendMoneyBloc->>SendMoneyBloc: emit(errorText: null)
        SendMoneyScreen->>User: Show error message
    end
```

## 4. Transaction History Flow

### Load Transaction History

```mermaid
sequenceDiagram
    participant User
    participant TransactionScreen
    participant TransactionBloc
    participant CachedService
    participant TransactionRepository
    participant API

    User->>TransactionScreen: Navigate to Transactions
    TransactionScreen->>TransactionBloc: initialized()
    TransactionBloc->>TransactionBloc: getTransactions()

    TransactionBloc->>CachedService: getCacheUserData()

    alt User Found
        CachedService-->>TransactionBloc: UserModelDto
        TransactionBloc->>TransactionBloc: emit(isLoading: true)
        TransactionBloc->>TransactionRepository: getAllTransactions(userId)
        TransactionRepository->>API: GET /transactions?senderId=userId

        alt Success
            API-->>TransactionRepository: 200 OK + List<TransactionModelDto>
            TransactionRepository-->>TransactionBloc: Right(transactions)
            TransactionBloc->>TransactionBloc: emit(isLoading: false, transactions: transactions)
            TransactionScreen->>User: Display transaction list
        else Failure
            API-->>TransactionRepository: 500 Server Error
            TransactionRepository-->>TransactionBloc: Left(Failure)
            TransactionBloc->>TransactionBloc: emit(isLoading: false, errorText: failure.message)
            TransactionScreen->>User: Show error message
        end
    else User Not Found
        CachedService-->>TransactionBloc: null
        TransactionBloc->>TransactionBloc: emit(errorText: "User not found")
        TransactionScreen->>User: Show error message
    end
```

## 5. Complete User Journey

### End-to-End Flow: Login → Send Money → View Transactions

```mermaid
sequenceDiagram
    participant User
    participant AuthScreen
    participant HomeScreen
    participant SendMoneyScreen
    participant TransactionScreen
    participant AuthBloc
    participant HomeBloc
    participant SendMoneyBloc
    participant TransactionBloc
    participant CachedService
    participant API

    Note over User, API: 1. Authentication Phase
    User->>AuthScreen: Login with credentials
    AuthScreen->>AuthBloc: login(email, password)
    AuthBloc->>API: Authenticate user
    API-->>AuthBloc: Return auth data
    AuthBloc->>CachedService: Cache user data & token

    Note over User, API: 2. Home Screen Phase
    AuthScreen->>HomeScreen: Navigate after login
    HomeScreen->>HomeBloc: initialized()

    Note over User, API: 3. Send Money Phase
    User->>HomeScreen: Navigate to Send Money
    HomeScreen->>SendMoneyScreen: Navigate
    SendMoneyScreen->>SendMoneyBloc: initialized()
    User->>SendMoneyScreen: Send money
    SendMoneyScreen->>SendMoneyBloc: sendMoney(amount)
    SendMoneyBloc->>CachedService: Get user data
    SendMoneyBloc->>API: Process payment
    API-->>SendMoneyBloc: Payment confirmation

    Note over User, API: 4. Transaction History Phase
    User->>SendMoneyScreen: Navigate to Transactions
    SendMoneyScreen->>TransactionScreen: Navigate
    TransactionScreen->>TransactionBloc: initialized()
    TransactionBloc->>CachedService: Get user data
    TransactionBloc->>API: Fetch transaction history
    API-->>TransactionBloc: Return transactions
    TransactionScreen->>User: Display transaction history
```

## Error Handling Patterns

### Common Error Scenarios

```mermaid
sequenceDiagram
    participant Component
    participant Bloc
    participant Repository
    participant Service

    Note over Component, Service: Network Error
    Component->>Bloc: Action request
    Bloc->>Repository: Data operation
    Repository->>Service: API call
    Service-->>Repository: Network timeout
    Repository-->>Bloc: Left(NetworkFailure)
    Bloc->>Bloc: emit(errorText: "Network error")
    Component->>User: Show retry option

    Note over Component, Service: Authentication Error
    Component->>Bloc: Protected action
    Bloc->>Repository: Authenticated request
    Repository->>Service: API call with token
    Service-->>Repository: 401 Unauthorized
    Repository-->>Bloc: Left(AuthFailure)
    Bloc->>Bloc: emit(errorText: "Session expired")
    Component->>User: Redirect to login
```

## State Management Pattern

### BLoC State Emission Pattern

```mermaid
sequenceDiagram
    participant UI
    participant Bloc
    participant Repository

    UI->>Bloc: User action
    Bloc->>Bloc: emit(isLoading: true)
    Bloc->>Repository: Async operation

    alt Success
        Repository-->>Bloc: Success result
        Bloc->>Bloc: emit(data: result, isLoading: false)
    else Failure
        Repository-->>Bloc: Error result
        Bloc->>Bloc: emit(errorText: error, isLoading: false)
    end

    Bloc->>Bloc: emit(clean state)
    UI->>User: Update interface
```
