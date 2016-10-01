package net.wendal.nutzbook.service;

import java.util.Date;

import net.wendal.nutzbook.bean.Account;

import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.log.Log;
import org.nutz.log.Logs;

public class AccountServiceImpl implements AccountService{
	private static final Log log = Logs.get();
	@Inject Dao dao;
	@Override
	public void addAccount(Account account) {
		account.setCreateTime(new Date());
		dao.insert(account);
		log.debug("add one account");
		
	}

	/**
	 * 
	 * 删除用户的账号，使状态修改为已删除
	 */
	@Override
	public void deleteAccount(Account account) {
		account.setInuse("d");
		account.setUpdateTime(new Date());
		dao.update(account);
	}
	
	@Override
	public void updateAccount(Account account) {
		account.setUpdateTime(new Date());
		dao.update(account);
	}

}
