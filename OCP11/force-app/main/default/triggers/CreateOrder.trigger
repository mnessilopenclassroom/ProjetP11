trigger CreateOrder on Order (after insert) {

    ChangeActiveAccount change = new ChangeActiveAccount();

    change.ExecuteChangeToActive();

}