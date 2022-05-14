trigger ContactTriger on Contact (before insert, before update) {
    if(Trigger.IsInsert){
        ContactTrigerHandler.onInsert(Trigger.new[0]);
    } else if (Trigger.IsUpdate) {
        ContactTrigerHandler.onUpdate(Trigger.new[0], Trigger.old[0]);    
    }
}