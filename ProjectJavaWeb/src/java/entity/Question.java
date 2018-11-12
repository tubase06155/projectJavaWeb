/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import dal.LessonDAO;

/**
 *
 * @author Anh Tu
 */
public class Question {
       
    int questionID;
    int lessonID;
    String content;
    String opt1;
    String opt2;
    String opt3;
    String opt4;
    int rightOpt;
   Lesson lesson = new Lesson();
    public Question(int questionID, int lessonID, String content, String opt1, String opt2, String opt3, String opt4, int rightOpt) {
        this.questionID = questionID;
        this.lessonID = lessonID;
        this.content = content;
        this.opt1 = opt1;
        this.opt2 = opt2;
        this.opt3 = opt3;
        this.opt4 = opt4;
        this.rightOpt = rightOpt;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOpt1() {
        return opt1;
    }

    public void setOpt1(String opt1) {
        this.opt1 = opt1;
    }

    public String getOpt2() {
        return opt2;
    }

    public void setOpt2(String opt2) {
        this.opt2 = opt2;
    }

    public String getOpt3() {
        return opt3;
    }

    public void setOpt3(String opt3) {
        this.opt3 = opt3;
    }

    public String getOpt4() {
        return opt4;
    }

    public void setOpt4(String opt4) {
        this.opt4 = opt4;
    }

    public int getRightOpt() {
        return rightOpt;
    }

    public void setRightOpt(int rightOpt) {
        this.rightOpt = rightOpt;
    }
    public Lesson getLesson() throws Exception{
        return new LessonDAO().getLessonByID(lessonID+"");
    }
   
    
}
