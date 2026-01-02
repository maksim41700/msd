import { checkPassword } from "./PasswordChecker.js";
import { describe, test } from "node:test";
import * as assert from "node:assert/strict";

describe("checkPassword", () => {
    test("throws when password is not a string", () => {
        assert.throws(
            () => {
                checkPassword(12345678);
            },
            { message: "Password must be a string" }
        );
    });
    test("throws when password is shorter than 8 characters", () => {
        assert.throws(
            () => {
                checkPassword("Ab1!");
            },
            { message: "Password must be at least 8 characters long" }
        );
    });
    test("throws when password is longer than 20 characters", () => {
        assert.throws(
            () => {
                checkPassword("Abcdefghijklmnopqrstu1!");
            },
            { message: "Password must be no more than 20 characters long" }
        );
    });
    test("throws when password lacks an uppercase letter", () => {
        assert.throws(
            () => {
                checkPassword("abcdefg1!");
            },
            { message: "Password must contain at least one uppercase letter" }
        );
    });
    test("throws when password lacks a lowercase letter", () => {
        assert.throws(
            () => {
                checkPassword("ABCDEFG1!");
            },
            { message: "Password must contain at least one lowercase letter" }
        );
    });
    test("throws when password lacks a digit", () => {
        assert.throws(
            () => {
                checkPassword("Abcdefgh!");
            },
            { message: "Password must contain at least one digit" }
        );
    });
    test("throws when password lacks a special character", () => {
        assert.throws(
            () => {
                checkPassword("Abcdefgh1");
            },
            { message: "Password must contain at least one special character" }
        );
    });
    test("does not throw for a valid password", () => {
        assert.doesNotThrow(() => {
            checkPassword("Valid1!sd");
        });
    });
});
