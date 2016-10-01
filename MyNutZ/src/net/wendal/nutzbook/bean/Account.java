package net.wendal.nutzbook.bean;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("t_account")
public class Account extends BasePojo {
@Id 
protected long account_id;
@Column
/**账号*/
protected long u_id;
@Column
/**银行账号*/
private String bankaccount;
/**账户名称*/
@Column
private String accountname;

/**
 * 是否使用 删除为d 使用为y
 */
@Column
protected String inuse;

public long getAccount_id() {
	return account_id;
}
public void setAccount_id(long account_id) {
	this.account_id = account_id;
}
public long getU_id() {
	return u_id;
}
public void setU_id(long u_id) {
	this.u_id = u_id;
}
public String getBankaccount() {
	return bankaccount;
}
public void setBankaccount(String bankaccount) {
	this.bankaccount = bankaccount;
}

public String getAccountname() {
	return accountname;
}
public void setAccountname(String accountname) {
	this.accountname = accountname;
}
public String getInuse() {
	return inuse;
}
public void setInuse(String inuse) {
	this.inuse = inuse;
} 

}
