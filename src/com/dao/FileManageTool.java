package com.dao;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.po.Users;

public class FileManageTool {

	public String listShow(Users user) throws UnsupportedEncodingException {
		String PATH = "BOX" + File.separator + user.getUsername();
		File userFile = new File(PATH);
		if (!userFile.exists()) {
			userFile.mkdirs();
		}
		String[] list = userFile.list();
		if (list.length == 0) {
			return "空";
		} else {
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < list.length; i++) {
				sb.append(list[i] + "&emsp;" + "<a href=\"dodownload.jsp?name=" + URLEncoder.encode(list[i], "utf-8")
						+ "\">下载</a>" + "&emsp;" + "<a href=\"dodelete.jsp?name=" + URLEncoder.encode(list[i], "utf-8")
						+ "\">删除</a>" + "<br>\n");
			}
			return sb.toString();
		}

	}

}