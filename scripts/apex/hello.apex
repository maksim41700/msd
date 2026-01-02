// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

/* Integer year = 2200;

do {
    System.debug('Processing year: ' + year);
    Boolean firstCondition = Math.mod(year, 4) == 0;
    Boolean secondCondition = Math.mod(year, 100) == 0;
    Boolean thirdCondition = Math.mod(year, 400) == 0;
    if (firstCondition && !secondCondition || thirdCondition) {
        System.debug(year + ' is a leap year');
    }
    year++;
} while (year <= 2000); */

/* final String FIZZ = 'fizz';
final String BUZZ = 'buzz';
Integer i = 1;
do {
    String output = '';
    if (Math.mod(i, 3) == 0) {
        output += FIZZ;
    }
    if (Math.mod(i, 5) == 0) {
        output += BUZZ;
    }
    if (String.isBlank(output)) {
        output = String.valueOf(i);
    }
    System.debug(output);
    output = '';
    i++;
} while (i <= 100); */

/* Integer firstNumber = 0;
Integer secondNumber = 1;
Integer i = 0;
while (i < 20) {
    if (i == 0) {
        System.debug(firstNumber);
    } else if (i == 1) {
        System.debug(secondNumber);
    } else {
        secondNumber = firstNumber + secondNumber;
        firstNumber = secondNumber - firstNumber;
        System.debug(secondNumber);
    }
    i++;
} */

/* final String STAR = '*';
Integer n = 5;

for (Integer i = 0; i < n; i++) {
    String output = '';
    for (Integer j = 0; j <= i; j++) {
        output += STAR;
    }
    System.debug(output);
} */

/* List<String> days = new List<String>{
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
};
for (String day : days) {
    switch on day {
        when 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday' {
            System.debug('It is a weekday');
        }
        when 'Saturday', 'Sunday' {
            System.debug('It is a weekend');
        }
    }
} */

/* Fitness fitness = new Fitness(90.5, 1.80, 5, 38);
System.debug('BMI is: ' + fitness.calculateBMI());
System.debug('Pase is: ' + fitness.calculatePace() + 'km/h'); */

/* List<Account> accounts = [
    SELECT Id, Name, (SELECT Id, Name FROM Contacts)
    FROM Account
];
for (Account account : accounts) {
    System.debug('Account is: ' + account.Name);
    for (Contact contact : account.Contacts) {
        System.debug('Contact is: ' + contact.Name);
    }
} */

/* SObject account = (Sobject) Type.forName('Account').newInstance();
account.put('Name', 'WingNut Films');
account.put('Rating', 'Warm');
Database.insert(account, true);

SObject opportunity = (Sobject) Type.forName('Opportunity').newInstance();
opportunity.put('AccountId', account.Id);
opportunity.put('Name', 'Lord Of The Rings');
opportunity.put('StageName', 'Qualification');
opportunity.put('CloseDate', Date.today());
Database.insert(opportunity, true); */

/* List<SObject> accounts = [
    SELECT Id, Name
    FROM Account
    WHERE Name = 'WingNut Films'
];
for (SObject account : accounts) {
    account.put('Name', 'New Line Cinema');
}
if (!accounts.isEmpty()) {
    Database.update(accounts);
} */

/* List<SObject> opportunities = [
    SELECT Id, Name
    FROM Opportunity
    WHERE Name = 'Lord Of The Rings'
];
for (SObject opp : opportunities) {
    opp.put('StageName', 'Closed Won');
}
if (!opportunities.isEmpty()) {
    Database.update(opportunities);
} */

/* List<Opportunity> opportunities = [
    SELECT Id, Name
    FROM Opportunity
    WHERE Name = 'Lord Of The Rings'
];
Database.delete(opportunities); */

/* List<Opportunity> opportunities = [
    SELECT Id, Name
    FROM Opportunity
    WHERE Name = 'Lord Of The Rings'
    ALL ROWS
];
Database.undelete(opportunities); */

/* List<Opportunity> opportunities = [SELECT Id, Amount FROM Opportunity];
Opportunities operator = new Opportunities();
operator.setOpportunities(opportunities);
operator.setProfile();
Database.update(opportunities); */

List<Id> accountIds = new List<Id>(
    new Map<Id, Account>([SELECT Id FROM Account]).keySet()
);
AccountController.updateAvgCaseResolution(accountIds);
