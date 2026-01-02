public with sharing class AccountController {
    public static void updateAvgCaseResolution(List<Id> accountIds) {
        List<Account> accsToUpdate = new List<Account>();
        List<Account> accounts = [
            SELECT
                Id,
                (
                    SELECT Id, CreatedDate, ClosedDate
                    FROM Cases
                    WHERE IsClosed = TRUE
                )
            FROM Account
            WHERE
                Id IN (
                    SELECT AccountId
                    FROM Case
                    WHERE IsClosed = TRUE AND AccountId IN :accountIds
                )
        ];
        for (Account acc : accounts) {
            Integer totalDays = 0;
            Integer totalCases = 0;
            for (Case caseObj : acc.Cases) {
                totalCases++;
                totalDays += caseObj.CreatedDate.date()
                    .daysBetween(caseObj.ClosedDate.date());
            }
            Decimal resolutionDays = totalDays / totalCases;
            accsToUpdate.add(
                new Account(
                    Id = acc.Id,
                    Avg_Case_Resolution_Days__c = resolutionDays
                )
            );
        }
        Database.update(accsToUpdate);
    }
}
