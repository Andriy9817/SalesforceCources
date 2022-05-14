public class ContactTrigerHandler {
    public static void onInsert(Contact contact) {
   	   contact.Current_Program_Status__c = getProgramStatusByProgramId(contact.Current_Program__c);
    }

    public static void onUpdate(Contact newContact, Contact oldContact) {
         if(newContact.Current_Program__c != oldContact.Current_Program__c) {
             newContact.Current_Program_Status__c = getProgramStatusByProgramId(newContact.Current_Program__c);
         }
    }

    private static String getProgramStatusByProgramId(Id programId) {
        return [SELECT Status__c FROM Program__c WHERE Id=:programId].get(0).Status__c;
    }
    
}