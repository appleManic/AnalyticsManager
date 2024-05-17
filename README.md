This project provides a unified AnalyticsManager class to simplify the initialization, user management, and event tracking for various analytics services like internal analytics, Firebase Analytics, etc. It offers a consistent API for all services, improving code maintainability and reducing boilerplate code.

 Features:
**Centralized Service Initialization:**
-Easily initialize different analytics services through the AnalyticsManager.
-Supports configuration options for each service.
**Simplified User Management:**
-Set and unset user properties consistently across services using setUser and unsetUser.
**Unified Event Tracking:**
-Track events with default parameters and optional extra parameters using trackEvent.
-Enforces consistent event names and parameters across services.
**Improved Code Maintainability:**
-Reduces code duplication by providing a single point of entry for analytics interactions.
-Makes code easier to understand and modify.
