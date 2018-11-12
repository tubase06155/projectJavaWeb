/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Anh Tu
 */
public class Lesson {
     int lessonID;
    String title;
    String imagePath;
    int category;
    String content;
    int difficulty;
    String audioPath;

    public Lesson() {
    }

    public Lesson(int lessonID, String title, String imagePath, int category, String content, int difficulty, String audioPath) {
        this.lessonID = lessonID;
        this.title = title;
        this.imagePath = imagePath;
        this.category = category;
        this.content = content;
        this.difficulty = difficulty;
        this.audioPath = audioPath;
    }

    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public String getAudioPath() {
        return audioPath;
    }

    public void setAudioPath(String audioPath) {
        this.audioPath = audioPath;
    }
    
}
