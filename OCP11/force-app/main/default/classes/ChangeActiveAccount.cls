public with sharing class ChangeActiveAccount {
    public void ExecuteChangeToInactive() {


        List<Account> inactive = [SELECT Active__c FROM Account WHERE Id NOT IN (SELECT AccountId FROM Order WHERE (Status = 'Activated' OR Status = 'Draft'))];

        List<Account> accToUpdate =new List<Account>();

        for(Account acc : inactive){

            if (acc.Active__c){
                acc.Active__c = false;
            }

            accToUpdate.add(acc);

        }

        update accToUpdate;

    }

    public void ExecuteChangeToActive() {


        List<Account> active = [SELECT Active__c FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE (Status = 'Activated' OR Status = 'Draft'))];

        List<Account> accToUpdate =new List<Account>();

        for(Account acc : active){

            if (acc.Active__c == false || acc.Active__c == null){
                acc.Active__c = true;
            }

            accToUpdate.add(acc);

        }

        update accToUpdate;


    }

}

