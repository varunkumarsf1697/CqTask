public class Account_Handler {
    Public static void inactivemethod(List<Account> acclist){
    List<SQX_Team_Members__c> teammemberslist = new List<SQX_Team_Members__c>();
    for(Account acc:acclist){
   acc.Active__c = false;
    }
}
Public static void TeamMembermethod(List<Account> acclist){
    List<SQX_Team_Members__c> teammemberslist = new List<SQX_Team_Members__c>();
    for(Account acc:acclist){
          SQX_Team_Members__c team1 = new SQX_Team_Members__c();
            team1.Name = 'Team Member 1';
            team1.Account__c = acc.Id;
            teammemberslist.add(team1);
            SQX_Team_Members__c team2 = new SQX_Team_Members__c();
            team2.Name = 'Team Member 1';
            team2.Account__c = acc.Id;
            teammemberslist.add(team2);
    }
    insert teammemberslist;
}
Public static void Errormessagemethod(List<Account> acclist){
    Set<Id> accountIds = new Set<Id>();
    for(Account acc:acclist){
      accountIds.add(acc.Id);
    }
    List<SQX_Team_Members__c> team1 = [select id from SQX_Team_Members__c where Account__c In: accountIds AND Member_Type__c = 'Admin'];
    List<SQX_Team_Members__c> team2 = [select id from SQX_Team_Members__c where Account__c In: accountIds AND Member_Type__c = 'HR'];
    for(Account acc1: acclist){
        if((team1.size()==0 || team2.size()== 0) && acc1.Active__c==true){
            acc1.Active__C.adderror('Cannot activate account without HR And Admin team member record');
        }
    }
}
}