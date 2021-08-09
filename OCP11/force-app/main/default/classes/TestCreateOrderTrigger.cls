
@isTest
public class TestCreateOrderTrigger {
    @TestSetup
    Static void testData(){
        Account acc = TestDataFactory.createOrdersForOneAccount(1);

        Test.startTest();

        update acc;

        Test.stopTest();
        
        System.assert(true);

    }
	
    @isTest
    static void TestUpdateAccountWith1OrderActivated() {

        
        
        Account acc = [SELECT Id, Active__c FROM Account LIMIT 1];
      
        
        // verify that the related Account has been updated
        
        
        System.assert(acc.Active__c==true);
        
    }
}