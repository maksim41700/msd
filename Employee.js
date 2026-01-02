const john = {
    name: "John",
    age: 30,
    role: "Developer",
    address: {
        street: "123 Main St",
        city: "Anytown",
        country: "USA"
    },
    workAddress: {
        street: "456 Corporate Blvd",
        city: "Metropolis",
        country: "USA"
    },
    salary: 80000,
    email: "john@example.com",
    phone: "555-1234"
};
/**
 * @typedef {Object} Address
 * @property {string} street
 * @property {string} city
 * @property {string} country
 */

/**
 * @typedef {Object} Employee
 * @property {string} name
 * @property {number} age
 * @property {string} role
 * @property {Address} address
 * @property {Address} workAddress
 * @property {number} salary
 * @property {string} email
 * @property {string} phone
 */
