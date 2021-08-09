 global class MondayBatchScheduler implements Schedulable {
    
        global void execute (SchedulableContext sc) {
            
            MondayBatch mb = new MondayBatch();
            Database.executeBatch(mb);
            
        }
    
    }

