package com.incon.common.ExceptionTask.quartz;

import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.DateBuilder;
import org.quartz.DateBuilder.IntervalUnit;
import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import java.text.ParseException;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.matchers.GroupMatcher;

import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;

public class QuartzManager {
	private static SchedulerFactory gSchedulerFactory = new StdSchedulerFactory();

	private static String HM_JOB = "HM_JOB";
	private static String HM_TRIGGER = "HM_TRIGGER";

	/**
	 * 增加任务
	 * 
	 * @param jobClass
	 *            任务实现类
	 * @param jobName
	 *            任务名称
	 * @param interval
	 *            间隔时间
	 * @param data
	 *            数据
	 */

	public static void addJob(Class<? extends Job> jobClass, String jobName,
			String cron, Map<String, Object> data) throws Exception {
		Scheduler sched = gSchedulerFactory.getScheduler();

		// 创建Job
		JobDetail jobDetail = JobBuilder.newJob(jobClass)
				.withIdentity(jobName, HM_JOB)// 任务名称和组构成任务key
				.build();

		// 传递参数
		jobDetail.getJobDataMap().putAll(data);

		// 触发器

		CronTrigger cronTrigger = TriggerBuilder.newTrigger()
				.withIdentity(jobName, HM_TRIGGER).// 触发器key
				withSchedule(CronScheduleBuilder.cronSchedule(cron)).build();
		// 任务和触发器关联
		sched.scheduleJob(jobDetail, cronTrigger);

		// 启动
		if (!sched.isShutdown()) {
			sched.start();
		}
	}

	/**
	 * 删除任务
	 * 
	 * @param jobName
	 *            任务名称
	 */
	public static void removeJob(String jobName) {
		try {
			Scheduler sched = gSchedulerFactory.getScheduler();
			sched.deleteJob(new JobKey(jobName, HM_JOB));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// public List getJob(){
	// Scheduler sched = gSchedulerFactory.getScheduler();
	// sched.getJobGroupNames()
	// return
	// }

	public static List<ExceptionTaskEntity> listJob() throws SchedulerException {
		Scheduler sched = gSchedulerFactory.getScheduler();
		List<ExceptionTaskEntity> tasks = new ArrayList<ExceptionTaskEntity>();
		for (String groupName : sched.getJobGroupNames()) {

			for (JobKey jobKey : sched.getJobKeys(GroupMatcher
					.jobGroupEquals(groupName))) {

				String jobName = jobKey.getName();
				String jobGroup = jobKey.getGroup();
				
				ExceptionTaskEntity task = new ExceptionTaskEntity();
				
				task.setId(jobName);
				
				tasks.add(task);
				// get job's trigger
				List<Trigger> triggers = (List<Trigger>) sched.getTriggersOfJob(jobKey);
				
				Date nextFireTime = triggers.get(0).getNextFireTime();

//				System.out.println("[jobName] : " + jobName + " [groupName] : "
//						+ jobGroup + " - " + nextFireTime + "[==]" + triggers.get(0).getCalendarName());

			}

		}
		return tasks;
	}

	public static void main(String[] args) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "1");
		addJob(TestJob.class, "aaa", "30 * * * * ?", map);

		map.clear();
		map.put("id", "2");
		addJob(TestJob.class, "bbb", "15 * * * * ?", map);

		map.clear();
		map.put("id", "3");
		addJob(TestJob.class, "ccc", "45 * * * * ?", map);

		map.clear();
		map.put("id", "4");
		addJob(TestJob.class, "ddd", "59 * * * * ?", map);
		// removeJob("aaa");
		System.out.println("main end----------");

		Scheduler sched = gSchedulerFactory.getScheduler();

		for (String s : sched.getJobGroupNames()) {
			System.out.println("s----------" + s);
		}

	}

}
