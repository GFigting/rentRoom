package com.studio.rentRoom.utils;

import java.util.Map;

import com.studio.rentRoom.beans.UserLogin;

public class LoginSession {

//	public static ShoppingCart getShoppingCart(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		
//		ShoppingCart sCart = (ShoppingCart) session.getAttribute("ShoppingCart");
//		if (sCart == null) {
//			sCart = new ShoppingCart();
//			session.setAttribute("ShoppingCart", sCart);
//		}
//		
//		return sCart;
//	}
	
	public static boolean isLogin(Map<String, Object> session) {
		UserLogin userLogin = (UserLogin) session.get("userLogin");
		
		if(userLogin != null) {
			return true;
		}
		return false;
	}
	
	public static void invalidate(Map<String, Object> session) {
		session.clear();
	}
	
}
