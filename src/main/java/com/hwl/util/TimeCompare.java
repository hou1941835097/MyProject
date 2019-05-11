package com.hwl.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeCompare {
	
	public static boolean compareDate(String date1,String date2) throws Exception {
		Date d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date1);
		Date d2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(date2);
		boolean result = d1.before(d2);
		return result;
	}
	
	public static String getCurTime() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()).toString();
	}
	
	public static void main(String[] args) throws Exception {
		String date1="2014-12-11 12:50";
		String date2="2014-12-11 12:51";
		boolean result = compareDate(date1, date2);
		System.out.println(result);
		System.out.println(getCurTime());
	}
}
