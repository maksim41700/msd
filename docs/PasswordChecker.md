# PasswordChecker

Short documentation for `checkPassword` and `checkPasswordWithoutRegEx` exported from `PasswordChecker.js`.

## Purpose

Validate a password and throw an Error when it fails any rule. Both functions enforce the same rules; `checkPasswordWithoutRegEx` performs checks without using regular expressions.

## Rules

- Password must be a string.
- Length must be between 8 and 20 characters (inclusive).
- Must contain at least one uppercase letter (A-Z).
- Must contain at least one lowercase letter (a-z).
- Must contain at least one digit (0-9).
- Must contain at least one special character from: ! @ # $ % ^ & \* ( ) , . ? " : { } | < >

## Exports

- `checkPassword(password: string): void` — Uses regular expressions to validate and throws Error with a clear message for the first failing rule.
- `checkPasswordWithoutRegEx(password: string): void` — Same behavior but implemented with character-by-character checks (no RegExp).

## Usage

```javascript
import { checkPassword, checkPasswordWithoutRegEx } from "./PasswordChecker";

try {
    checkPassword("S3cure!Pass");
    // or
    checkPasswordWithoutRegEx("S3cure!Pass");
    // password valid
} catch (err) {
    console.error("Invalid password:", err.message);
}
```

## Notes & testing

- The functions throw the first encountered rule violation as an Error with a human-readable message (suitable for UI display).
- When adding tests, include cases for each rule and combined edge cases (min/max length, missing categories, non-string input).
