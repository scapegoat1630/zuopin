/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.byau.bean;

/**
 *
 * @author Administrator
 */
public class Question {
    private int questionId;
   

    private String subject;    //题目描述
    private String choiceA;    //选项A
    private String choiceB;    //选项B
    private String choiceC;    //选项C
    private String choiceD;    //选项D
    private String answer ;    //正确答案
    private String typeId;
    private String categoryId;
    public Question(){
        
    }
    
    public Question(int questionId, 
            String subject, 
            String choiceA, String choiceB, 
            String choiceC, String choiceD,
            String answer, String typeId, 
            String categoryId) {
        this.questionId = questionId;
        this.subject = subject;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.answer = answer;
        this.typeId = typeId;
        this.categoryId = categoryId;
    }
    
    public Question( 
            String subject, 
            String choiceA, String choiceB, 
            String choiceC, String choiceD,
            String answer, String typeId, 
            String categoryId) {
       
        this.subject = subject;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.answer = answer;
        this.typeId = typeId;
        this.categoryId = categoryId;
    }
  

    /**
     * @return the questionId
     */
    public int getQuestionId() {
        return questionId;
    }

    /**
     * @param questionId the questionId to set
     */
    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the choiceA
     */
    public String getChoiceA() {
        return choiceA;
    }

    /**
     * @param choiceA the choiceA to set
     */
    public void setChoiceA(String choiceA) {
        this.choiceA = choiceA;
    }

    /**
     * @return the choiceB
     */
    public String getChoiceB() {
        return choiceB;
    }

    /**
     * @param choiceB the choiceB to set
     */
    public void setChoiceB(String choiceB) {
        this.choiceB = choiceB;
    }

    /**
     * @return the choiceC
     */
    public String getChoiceC() {
        return choiceC;
    }

    /**
     * @param choiceC the choiceC to set
     */
    public void setChoiceC(String choiceC) {
        this.choiceC = choiceC;
    }

    /**
     * @return the choiceD
     */
    public String getChoiceD() {
        return choiceD;
    }

    /**
     * @param choiceD the choiceD to set
     */
    public void setChoiceD(String choiceD) {
        this.choiceD = choiceD;
    }

    /**
     * @return the answer
     */
    public String getAnswer() {
        return answer;
    }

    /**
     * @param answer the answer to set
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * @return the typeId
     */
    public String getTypeId() {
        return typeId;
    }

    /**
     * @param typeId the typeId to set
     */
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    /**
     * @return the categoryId
     */
    public String getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId the categoryId to set
     */
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Question{" + "questionId=" + questionId + ", subject=" + subject + ", choiceA=" + choiceA + ", choiceB=" + choiceB + ", choiceC=" + choiceC + ", choiceD=" + choiceD + ", answer=" + answer + ", typeId=" + typeId + ", categoryId=" + categoryId + '}';
    }
   
    
}
