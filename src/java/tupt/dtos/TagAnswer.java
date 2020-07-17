/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.dtos;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sherl
 */
@XmlRootElement
public class TagAnswer {
    private int id;
    private Answer answerID;
    private Tag tagID;

    public TagAnswer() {
    }

    @XmlElement
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @XmlElement
    public Answer getAnswerID() {
        return answerID;
    }

    public void setAnswerID(Answer answerID) {
        this.answerID = answerID;
    }

    @XmlElement
    public Tag getTagID() {
        return tagID;
    }

    public void setTagID(Tag tagID) {
        this.tagID = tagID;
    }
    
    
}
