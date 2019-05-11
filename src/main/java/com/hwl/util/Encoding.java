package com.hwl.util;

import org.apache.commons.codec.digest.DigestUtils;

public class Encoding {
	public String md5Encoding(String pwd) {
		return DigestUtils.md5Hex(pwd.getBytes());
	}
}
