package com.Music.util;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailUtil {

	 @Autowired
	    private  JavaMailSender mailSender;

	    @Value("${spring.mail.username}")
	    private  String from;

	    public  void sendMail(String to, String subject, String content) throws MailException {
	    	JavaMailSenderImpl mailSender = new JavaMailSenderImpl();   	
	        mailSender.setProtocol("smtp"); 
	        mailSender.setHost("smtp.qq.com");
	        mailSender.setUsername("1375047916@qq.com");
	 		//网易邮箱授权码
	        mailSender.setPassword("yafghpvdozpbibfb");
	        Properties properties = new Properties();
	        properties.setProperty("mail.smtp.ssl.enable","true");
	        mailSender.setJavaMailProperties(properties);
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setFrom("1375047916@qq.com"); // 邮件发送者
	        message.setTo(to); // 邮件接受者
	        message.setSubject(subject); // 主题
	        message.setText(content); // 内容
	        mailSender.send(message);
	    }
	    public  void sendMimeMessageMail(String to, String subject, String content) throws MailException, MessagingException {
	    	JavaMailSenderImpl mailSender = new JavaMailSenderImpl();   	
	        mailSender.setProtocol("smtp"); 
	        mailSender.setHost("smtp.qq.com");
	        mailSender.setUsername("1375047916@qq.com");
	 		//网易邮箱授权码
	        mailSender.setPassword("yafghpvdozpbibfb");
	        Properties properties = new Properties();
	        properties.setProperty("mail.smtp.ssl.enable","true");
	        mailSender.setJavaMailProperties(properties);	     
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        helper.setFrom("1375047916@qq.com");
	        helper.setTo(to);
	        helper.setSubject(subject);
	        helper.setText(content, true);
	        mailSender.send(message);
	    }
	    
}
