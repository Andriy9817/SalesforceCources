@isTest
public class TestContactTrigerHandler {
    private static final String STATUS = 'Active';
    
          static testMethod void testInsertContact() {
          //given
          Contact contact = new Contact();
          Program__c program = new Program__c();
          program.Status__c = STATUS;
          insert program;
          contact.Current_Program__c = program.Id;
          
          //when
          ContactTrigerHandler.onInsert(contact);
          
          //then
          System.assert(contact.Current_Program_Status__c == STATUS, 'contact has wrong status');
      }

       static testMethod void testUpdateContactWhenProgramUpdated() {
           //given
           Contact newContact = new Contact();
           Contact oldContact = new Contact();
           Program__c newProgram = new Program__c();
           Program__c oldProgram = new Program__c();
           newProgram.Status__c = STATUS;           
           insert oldProgram;
           insert newProgram;
           newContact.Current_Program__c = newProgram.Id;
           oldContact.Current_Program__c = oldProgram.Id;
           
           //when
           ContactTrigerHandler.onUpdate(newContact, oldContact);
           //then
            System.assert(newContact.Current_Program_Status__c == STATUS, 'contact has wrong status');
      }
    
           static testMethod void testUpdateContactWhenProgramNotUpdated() {
           //given
           Contact newContact = new Contact();
           Contact oldContact = new Contact();
           Program__c program = new Program__c();
           insert program;
           newContact.Current_Program__c = program.Id;
           oldContact.Current_Program__c = program.Id;
           
           //when
           ContactTrigerHandler.onUpdate(newContact, oldContact);
           //then
            System.assert(newContact.Current_Program_Status__c == STATUS, 'contact has wrong status');
      }
}