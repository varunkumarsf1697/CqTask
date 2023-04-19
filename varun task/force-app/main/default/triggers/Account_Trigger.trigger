trigger Account_Trigger on Account (before insert,after insert,before update) {
	if(Trigger.isbefore && Trigger.isinsert){
		Account_Handler.inactivemethod(trigger.new);
	}
	if(Trigger.isafter && Trigger.isinsert){
		Account_Handler.TeamMembermethod(trigger.new);
	}
	if(Trigger.isbefore && Trigger.isUpdate){
		Account_Handler.Errormessagemethod(trigger.new);
	}
}