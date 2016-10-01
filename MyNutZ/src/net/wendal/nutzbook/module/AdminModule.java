package net.wendal.nutzbook.module;

import java.util.List;

import net.wendal.nutzbook.bean.User;

import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.mvc.Scope;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Attr;
import org.nutz.mvc.annotation.GET;
import org.nutz.mvc.annotation.Ok;

@IocBean
@At("/admin/home")

public class AdminModule extends BaseModule{
	@At("/")
	@GET
	@Ok("jsp:jsp.admin.home")
	public Object admin(){
		List<User> ul = dao.query(User.class,null);
		String json = Json.toJson(ul);
		System.out.println(json);
		return json;
	}
	@At("/querymenu")
	@GET
	public Object querymenu(@Attr(scope=Scope.SESSION, value="me")int userId){
		
		String json ="";
		return json;
	}
}
