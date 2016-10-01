package net.wendal.nutzbook.module;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.wendal.nutzbook.bean.Account;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.util.NutMap;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
@IocBean // 声明为Ioc容器中的一个Bean
@At("/user") // 整个模块的路径前缀
@Ok("json:{locked:'password|salt',ignoreNull:true}") // 忽略password和salt属性,忽略空属性的json输出
@Fail("http:500") // 抛出异常的话,就走500页面
public class AccountModule extends BaseModule{
	@At("/addaccount")
	@RequiresUser
	public Object addAccount(@Param("..")Account account,@Attr(scope=Scope.SESSION, value="me")int userId){
		NutMap nm = new NutMap();
		if(account!=null){
			List<Account> al = dao.query(Account.class, Cnd.where("bankaccount", "=", account.getBankaccount()));
			if(al.size()<1){
				account.setU_id(userId);
				account.setCreateTime(new Date());
				account.setInuse("y");
				dao.insert(account);
				nm.setv("ok", true);
			}else{
				nm.setv("ok", false);
				nm.setv("msg", "存在相同的银行账号");
			}
		}else{
			nm.setv("ok", false);
			nm.setv("msg", "添加失败");
		}
		return nm;
	}
	@At("/accountquery")
	@RequiresUser
	public Object queryaccountlist(@Param("..")Account account,@Attr(scope=Scope.SESSION, value="me")int userId){
		List<Account> al = new ArrayList<>();
		Cnd cnd = Cnd.where("u_id", "=", userId).and("inuse", "=", "y").and("accountname","like","%"+account.getAccountname()+"%").and("bankaccount","like","%"+account.getBankaccount()+"%");
		al= dao.query(Account.class,cnd);
		QueryResult qr= new QueryResult();
		qr.setList(al);
		return qr;
	}
	@At("/updateaccount")
	@RequiresUser
	public Object updateAccount(@Param("..")Account account,@Attr(scope=Scope.SESSION,value="me")int userId){
		NutMap nm = new NutMap(); 
		List<Account> al=dao.query(Account.class, Cnd.where("account_id","=",account.getAccount_id())) ;
		if (al.size()>0){
			if(al.get(0).getU_id()==userId){
				al.get(0).setAccountname(account.getAccountname());
				al.get(0).setBankaccount(account.getBankaccount());
				dao.update(al.get(0));
				nm.setv("ok", true);
			}else{
				nm.setv("ok", false);
				nm.setv("msg", "当前无法操作");
			}
		}else{
			nm.setv("ok", false);
			nm.setv("msg", "该账户不存在");
		}
		return nm;
	}
	@At("/deleteaccount")
	@RequiresUser
	public Object deleteAccount(@Param("bankaccount")String bankaccount,@Attr(scope=Scope.SESSION,value="me")int userId){
		Account account = new Account();
		NutMap nm = new NutMap();
		List<Account> al = dao.query(Account.class, Cnd.where("bankaccount", "=",bankaccount));
		if(al.size()>0){
			if(al.size()==1){
				account=al.get(0);
				account.setInuse("d");
				try{
					dao.update(account);
					nm.setv("ok", true);
				}catch(Exception e){
					nm.setv("ok", false);
					nm.setv("msg","网络错误，请重试");
				}
			}else{
				nm.setv("ok", false);
				nm.setv("msg","查询有误，请重试");
			}
		}else{
			nm.setv("ok", false);
			nm.setv("msg","记录不存在，请重试");
		}
		return nm;
	}
	/**
	 * 查询页面跳转
	 */
	@At("/accountlist")
	@RequiresUser
	@Ok("jsp:jsp.user.account")
    public void queryaccount() {
    }
	
}
