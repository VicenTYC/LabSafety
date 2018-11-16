package com.ssm.msg;

import java.util.Set;

public class ServerMsg {
	private String alert;
	private String date;
	private String to;
	private String msg;
	private String from;
	private Set<String> users;
	public Set<String> getUsers() {
		return users;
	}
	public void setUsers(Set<String> users) {
		this.users = users;
	}
	public String getAlert() {
		return alert;
	}
	public void setAlert(String alert) {
		this.alert = alert;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	@Override
	public String toString() {
		return "ServerMsg [alert=" + alert + ", date=" + date + ", to=" + to + ", msg=" + msg + ", from=" + from + "]";
	}
	
}
