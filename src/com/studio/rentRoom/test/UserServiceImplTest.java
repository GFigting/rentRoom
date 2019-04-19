package com.studio.rentRoom.test;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.studio.rentRoom.beans.UserLogin;
import com.studio.rentRoom.service.UserService;
import com.studio.rentRoom.service.Impl.UserServiceImpl;

class UserServiceImplTest extends UserServiceImpl {

	private ApplicationContext ctx = null;
	private UserService userService = null;

	{
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		userService = ctx.getBean(UserService.class);
	}

	@Test
	void test() {
		
	}

}
