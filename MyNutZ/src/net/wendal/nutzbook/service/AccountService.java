package net.wendal.nutzbook.service;

import net.wendal.nutzbook.bean.Account;

public interface AccountService {
	
	/**
	 * 添加账户
	 * @param account
	 */
	public void addAccount(Account account);
	/**
	 * 删除账户
	 * @param account
	 */
	public void deleteAccount(Account account);
	/**
	 * 
	 * 更新账户
	 * @param account
	 */
	public void updateAccount(Account account);
}
