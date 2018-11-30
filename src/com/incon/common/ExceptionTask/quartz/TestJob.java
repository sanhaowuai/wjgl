package com.incon.common.ExceptionTask.quartz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;


import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;
public class TestJob implements Job {  
  
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		try {
			for(ExceptionTaskEntity s : QuartzManager.listJob()){
				System.out.println(s.getId());
			}
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		QuartzManager.removeJob("aaa");
		 System.out.println();
		
        String id = context.getJobDetail().getJobDataMap().getString("id");
        System.out.println("threadId: " + Thread.currentThread().getId() + ", id: " + id+",key:"+context.getJobDetail().getKey());
        
        throw new JobExecutionException();
    }
	

}  