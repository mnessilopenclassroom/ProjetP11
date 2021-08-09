trigger DeleteOrder on Order (after delete) {

   
        
        ChangeActiveAccount change = new ChangeActiveAccount();

        change.ExecuteChangeToInactive();

        
    }

