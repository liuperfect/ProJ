package net.wendal.nutzbook;

import net.sf.ehcache.CacheManager;
import net.wendal.nutzbook.bean.User;
import net.wendal.nutzbook.service.AuthorityService;
import net.wendal.nutzbook.service.UserService;

import org.apache.commons.mail.HtmlEmail;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.util.Daos;
import org.nutz.integration.quartz.NutQuartzCronJobFactory;
import org.nutz.ioc.Ioc;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

public class MainSetup implements Setup {
	private static final Log log = Logs.get();
	// 特别留意一下,是init方法,不是destroy方法!!!!!
	public void init(NutConfig conf) {
		
		Ioc ioc = conf.getIoc();
		Dao dao = ioc.get(Dao.class);
		/*dao.create(User.class, false);//建表
*/		
		Daos.createTablesInPackage(dao, "net.wendal.nutzbook", false);
		
		// 初始化默认根用户
/*		if (dao.count(User.class) == 0) {
			User user = new User();
			user.setName("admin");
			user.setPassword("123456");
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			dao.insert(user);
		}
*/		  // 初始化默认根用户
        if (dao.count(User.class) == 0) {
            UserService us = ioc.get(UserService.class);
            us.add("admin", "123456");
        }
        User admin = dao.fetch(User.class,Cnd.where("id","=","1")) ;
        // 获取NutQuartzCronJobFactory从而触发计划任务的初始化与启动
        ioc.get(NutQuartzCronJobFactory.class);
        // 测试发送邮件
        try {
            HtmlEmail email = new HtmlEmail();
            email=ioc.get(HtmlEmail.class);
/*            email.setSmtpPort(25);
            email.setHostName("smtp.163.com");
            email.setAuthentication("liuperfect", "jack317317");
            email.setFrom("liuperfect@163.com");
*/            
            email.setSubject("测试NutzBook");
            email.setMsg("This is a test mail ... :-)" + System.currentTimeMillis());
            email.addTo("358676178@qq.com");//请务必改成您自己的邮箱啊!!!
            email.buildMimeMessage();
            System.out.println(email.getHostName());
            System.out.println(email.getSmtpPort());
           // email.sendMimeMessage(); //发送
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        AuthorityService as = ioc.get(AuthorityService.class);
        as.initFormPackage("net.wendal.nutzbook");
        as.checkBasicRoles(admin);
        
        CacheManager cacheManager = ioc.get(CacheManager.class);
        log.debug("Ehcache CacheManager = " + cacheManager);
	}

	public void destroy(NutConfig conf) {

	}

}
