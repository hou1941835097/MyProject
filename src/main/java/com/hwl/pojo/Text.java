package com.hwl.pojo;

public class Text {
	private String textid;
	private String question;
	private String option1;
	private String option2;
	private String option3;
	private String rightAnswer;
	private String mine;
	public Text() {
	}
	public Text(String question, String option1, String option2,String option3,String rightAnswer) {
		this.question = question;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.rightAnswer = rightAnswer;
	}
	public String getMine() {
		return mine;
	}
	public void setMine(String mine) {
		this.mine = mine;
	}
	public String getTextid() {
		return textid;
	}
	public void setTextid(String textid) {
		this.textid = textid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getRightAnswer() {
		return rightAnswer;
	}
	public void setRightAnswer(String rightAnswer) {
		this.rightAnswer = rightAnswer;
	}
	@Override
	public String toString() {
		return "Text [textid=" + textid + ", question=" + question + ", option1=" + option1 + ", option2=" + option2
				+ ", option3=" + option3 + ", rightAnswer=" + rightAnswer + ", mine=" + mine + "]";
	}
}
