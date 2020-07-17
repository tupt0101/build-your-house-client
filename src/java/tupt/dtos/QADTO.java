/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.dtos;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author sherl
 */
public class QADTO implements Serializable {
    private Question question;
    private List<Answer> listAnswer;

    public QADTO() {
    }

    public QADTO(Question question, List<Answer> listAnswer) {
        this.question = question;
        this.listAnswer = listAnswer;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public List<Answer> getListAnswer() {
        return listAnswer;
    }

    public void setListAnswer(List<Answer> listAnswer) {
        this.listAnswer = listAnswer;
    }
    
    
}
