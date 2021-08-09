@isTest
private class TestMondayBatch {

@TestSetup
static void testData() {
	
    Account acc =TestDataFactory.createAccountWithoutTaskCallOrOrder() ;

	
	Test.startTest();

	update acc;

	Test.stopTest();
	
	System.assert(true);

}

@isTest
static  void mondayBatchTest  () {



Test.startTest();
MondayBatch mb = new MondayBatch();
Database.executeBatch(mb);
Test.stopTest();

//after the testing stops, assert records updated properIy

List<Task> t = [SELECT Id FROM Task WHERE Subject = 'Call' ];

System.assert(t!=null) ;

}
}
