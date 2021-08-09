global class MondayBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator([SELECT Id, OwnerId FROM Account WHERE Id NOT IN (SELECT AccountId FROM Order WHERE (Status = 'Activated'OR Status ='Draft'))]);
    }
    
    global void execute (Database.BatchableContext batch, List<Account> listAcc) {
        
        List <Account> accountsList = new List<Account>();
        List<Task> taskList = new List<Task>();
        List<Task> tasksToAdd = new List<Task>();


        accountsList = [SELECT Id, OwnerId FROM Account WHERE Id NOT IN (SELECT AccountId FROM Order WHERE (Status = 'Activated'OR Status ='Draft'))];

        taskList = [SELECT OwnerId FROM Task WHERE (Subject ='Email' OR Subject ='Other' )];

    
         
        for (Account acc : accountsList) {

            Task newTask = new Task(Subject ='Call', Status = 'Not Started', Priority = 'Medium', OwnerId = acc.OwnerId , ActivityDate = System.today()+5); 
            tasksToAdd.add(newTask);

            

             }

        for(Task task : taskList){
                

            Task newTask = new Task(Subject ='Call', Status = 'Not Started', Priority = 'Medium', OwnerId = task.OwnerId , ActivityDate = System.today()+5); 
            tasksToAdd.add(newTask);   

        }

    update accountsList;
    insert tasksToAdd;
     
        
        
    }
    
    global void finish 	(Database.BatchableContext batch) {
        
    }

}