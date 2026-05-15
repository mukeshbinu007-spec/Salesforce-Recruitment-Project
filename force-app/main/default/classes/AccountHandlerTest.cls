@isTest
public class AccountHandlerTest {
    @isTest
    static void deleteAccountWithNotClosedWonOpportunityShowsError() {
        Account acc = new Account(Name = 'Testing Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Testing Opportunity',
            AccountId = acc.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(10)
        );
        insert opp;

        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();

        System.assertEquals(false, result.isSuccess(), 'Account delete should fail');
        System.assert(
            result.getErrors()[0].getMessage().contains('not Closed Won'),
            'Expected validation error for non Closed Won Opportunity'
        );
    }

    @isTest
    static void deleteAccountWithOnlyClosedWonOpportunitiesSucceeds() {
        Account acc = new Account(Name = 'Testing Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Testing Opportunity',
            AccountId = acc.Id,
            StageName = 'Closed Won',
            CloseDate = Date.today()
        );
        insert opp;

        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();

        System.assertEquals(true, result.isSuccess(), 'Account delete should succeed');
    }
}
