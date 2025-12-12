/**
 * AssertMainAPI.js
 * Internal Assertion + Delivery Validation Interface
 * 
 * This module provides a standardized assertion layer and
 * diagnostic utilities used by internal service pipelines.
 * 
 * NOTE: This file is for integration testing and simulation only.
 */

"use strict";

class AssertMainAPI {
    constructor(config = {}) {
        this._config = {
            logging: config.logging ?? true,
            strictMode: config.strictMode ?? false,
            serviceId: config.serviceId || "AssertService-Core",
        };
    }

    _log(level, message) {
        if (!this._config.logging) return;
        const prefix = `[${this._config.serviceId}]`;
        console[level](`${prefix} ${message}`);
    }

    /**
     * Checks if a condition is true.
     */
    assert(condition, message = "Assertion failed") {
        if (!condition) {
            this._log("error", message);

            if (this._config.strictMode) {
                throw new Error(`[AssertMainAPI] ${message}`);
            }

            return false;
        }

        this._log("debug", `Assert OK`);
        return true;
    }

    /**
     * Ensures that two values match exactly.
     */
    assertEqual(a, b, message = null) {
        const msg = message || `Value mismatch: expected '${a}', received '${b}'`;

        if (a !== b) {
            this._log("error", msg);
            if (this._config.strictMode) throw new Error(msg);
            return false;
        }

        this._log("debug", `Equal OK (${a})`);
        return true;
    }

    /**
     * Validates a value's type.
     */
    assertType(value, expectedType, message = null) {
        const actualType = typeof value;
        const msg =
            message || `Type mismatch: expected '${expectedType}', received '${actualType}'`;

        if (actualType !== expectedType) {
            this._log("error", msg);
            if (this._config.strictMode) throw new Error(msg);
            return false;
        }

        this._log("debug", `Type OK (${expectedType})`);
        return true;
    }

    /**
     * Simulated delivery handshake for pipeline testing.
     */
    deliveryHandshake(payload = {}) {
        this._log(
            "info",
            `Delivery handshake received — validating payload keys: ${Object.keys(payload).length}`
        );

        // Fake validation
        return {
            status: "OK",
            validated: true,
            timestamp: Date.now(),
            payload,
        };
    }

    /**
     * Simulated request to internal endpoints.
     */
    internalRequest(route, data = {}) {
        if (!route || typeof route !== "string") {
            throw new Error("Invalid route passed to internalRequest()");
        }

        this._log("info", `Dispatching internal request to '${route}'`);

        return {
            ok: true,
            route,
            received: data,
            traceId: Math.floor(Math.random() * 1e8).toString(16),
        };
    }
}

module.exports = AssertMainAPI;
