/**
 * Validate a password and throw an Error if it fails any rule.
 *
 * Rules:
 *  - password must be a string
 *  - length must be between 8 and 20 characters (inclusive)
 *  - must contain at least one uppercase letter
 *  - must contain at least one lowercase letter
 *  - must contain at least one digit
 *  - must contain at least one special character from !@#$%^&*(),.?":{}|<>
 *
 * @param {string} password - The password to validate.
 * @throws {Error} If password is not a string: "Password must be a string"
 * @throws {Error} If password is shorter than 8 characters: "Password must be at least 8 characters long"
 * @throws {Error} If password is longer than 20 characters: "Password must be no more than 20 characters long"
 * @throws {Error} If password lacks an uppercase letter: "Password must contain at least one uppercase letter"
 * @throws {Error} If password lacks a lowercase letter: "Password must contain at least one lowercase letter"
 * @throws {Error} If password lacks a digit: "Password must contain at least one digit"
 * @throws {Error} If password lacks a special character: "Password must contain at least one special character"
 * @returns {void}
 */
export function checkPassword(password) {
    if (typeof password !== "string") {
        throw new Error("Password must be a string");
    }
    if (password.length < 8) {
        throw new Error("Password must be at least 8 characters long");
    }
    if (password.length > 20) {
        throw new Error("Password must be no more than 20 characters long");
    }
    if (!/[A-Z]/.test(password)) {
        throw new Error("Password must contain at least one uppercase letter");
    }
    if (!/[a-z]/.test(password)) {
        throw new Error("Password must contain at least one lowercase letter");
    }
    if (!/[0-9]/.test(password)) {
        throw new Error("Password must contain at least one digit");
    }
    if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
        throw new Error("Password must contain at least one special character");
    }
}

/**
 * Validate a password string against a fixed policy without using regular expressions.
 *
 * Policy:
 * - Must be a string.
 * - Length must be between 8 and 20 characters (inclusive).
 * - Must contain at least one uppercase letter (A-Z).
 * - Must contain at least one lowercase letter (a-z).
 * - Must contain at least one digit (0-9).
 * - Must contain at least one special character from the set:
 *   ! @ # $ % ^ & * ( ) , . ? " : { } | < >
 *
 * Throws an Error describing the first failed rule encountered; does not return a value.
 *
 * @param {string} password - The password to validate.
 * @throws {Error} If password is not a string ("Password must be a string").
 * @throws {Error} If password is shorter than 8 characters ("Password must be at least 8 characters long").
 * @throws {Error} If password is longer than 20 characters ("Password must be no more than 20 characters long").
 * @throws {Error} If password does not contain an uppercase letter ("Password must contain at least one uppercase letter").
 * @throws {Error} If password does not contain a lowercase letter ("Password must contain at least one lowercase letter").
 * @throws {Error} If password does not contain a digit ("Password must contain at least one digit").
 * @throws {Error} If password does not contain a permitted special character ("Password must contain at least one special character").
 * @returns {void}
 */
export function checkPasswordWithoutRegEx(password) {
    if (typeof password !== "string") {
        throw new Error("Password must be a string");
    }
    if (password.length < 8) {
        throw new Error("Password must be at least 8 characters long");
    }
    if (password.length > 20) {
        throw new Error("Password must be no more than 20 characters long");
    }
    // Check characters without regular expressions
    let hasUpper = false;
    let hasLower = false;
    let hasDigit = false;
    let hasSpecial = false;
    const specialChars = new Set([
        "!",
        "@",
        "#",
        "$",
        "%",
        "^",
        "&",
        "*",
        "(",
        ")",
        ",",
        ".",
        "?",
        '"',
        ":",
        "{",
        "}",
        "|",
        "<",
        ">"
    ]);

    for (let i = 0; i < password.length; i++) {
        const ch = password[i];
        const code = ch.charCodeAt(0);

        if (!hasUpper && code >= 65 && code <= 90) {
            // A-Z
            hasUpper = true;
            continue;
        }
        if (!hasLower && code >= 97 && code <= 122) {
            // a-z
            hasLower = true;
            continue;
        }
        if (!hasDigit && code >= 48 && code <= 57) {
            // 0-9
            hasDigit = true;
            continue;
        }
        if (!hasSpecial && specialChars.has(ch)) {
            hasSpecial = true;
            continue;
        }

        // early exit if all categories found
        if (hasUpper && hasLower && hasDigit && hasSpecial) break;
    }

    if (!hasUpper) {
        throw new Error("Password must contain at least one uppercase letter");
    }
    if (!hasLower) {
        throw new Error("Password must contain at least one lowercase letter");
    }
    if (!hasDigit) {
        throw new Error("Password must contain at least one digit");
    }
    if (!hasSpecial) {
        throw new Error("Password must contain at least one special character");
    }
}
