const employees = [
    {
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
    },
    {
        name: "Alice",
        age: 28,
        role: "Software Engineer",
        address: {
            street: "78 Oak Ave",
            city: "Springfield",
            country: "USA"
        },
        workAddress: {
            street: "100 Tech Park",
            city: "Silicon City",
            country: "USA"
        },
        salary: 90000,
        email: "alice@example.com",
        phone: "555-2345"
    },
    {
        name: "Bob",
        age: 35,
        role: "Sales Manager",
        address: {
            street: "9 Pine Rd",
            city: "Rivertown",
            country: "USA"
        },
        workAddress: {
            street: "20 Commerce St",
            city: "Marketville",
            country: "USA"
        },
        salary: 75000,
        email: "bob@example.com",
        phone: "555-3456"
    },
    {
        name: "Charlie",
        age: 32,
        role: "Marketing Specialist",
        address: {
            street: "45 Elm St",
            city: "Greendale",
            country: "USA"
        },
        workAddress: {
            street: "12 Agency Ln",
            city: "Adtown",
            country: "USA"
        },
        salary: 70000,
        email: "charlie@example.com",
        phone: "555-4567"
    },
    {
        name: "Dana",
        age: 40,
        role: "Product Manager",
        address: {
            street: "210 Birch Blvd",
            city: "Lakeview",
            country: "USA"
        },
        workAddress: {
            street: "300 Innovation Dr",
            city: "Techburg",
            country: "USA"
        },
        salary: 105000,
        email: "dana@example.com",
        phone: "555-5678"
    }
];

function getByName(name) {
    return employees.find((emp) => emp.name === name);
}

function getAllEmployees() {
    return employees;
}

function filterEmployeesBySalary(minSalary) {
    return employees.filter((emp) => emp.salary >= minSalary);
}

function filterEmpoyeesByAgeAndSalary(minAge, minSalary) {
    return employees.filter(
        (emp) => emp.age >= minAge && emp.salary >= minSalary
    );
}

function getMaxSalaryEmployee() {
    return employees.reduce(
        (maxEmp, emp) => (emp.salary > maxEmp.salary ? emp : maxEmp),
        employees[0]
    );
}

function getAverageSalary() {
    const totalSalary = employees.reduce((sum, emp) => sum + emp.salary, 0);
    return totalSalary / employees.length;
}
