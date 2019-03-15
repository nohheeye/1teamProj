package com.spring.wewind.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("jy4test@gmail.com", "ktds1234");
	}
}
