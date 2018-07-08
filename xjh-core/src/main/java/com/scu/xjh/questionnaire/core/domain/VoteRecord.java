package com.scu.xjh.questionnaire.core.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import com.scu.xjh.common.domain.BaseAbstractEntity;

/**
 * Auto Generated Entity
 * 
 * @author Koala 
 * 
 */
@Entity
@Table(name="vote_record")
public class VoteRecord extends BaseAbstractEntity {



  @Column(name="QUESTION_ID")
    private Long questionId;
  

  @Column(name="PROBLEM_CHOICE")
    private String problemChoice;
  

  @Column(name="VOTE_TIME")
    private Date voteTime;
  

  @Column(name="BUILDING_ID")
    private Long buildingId;
  
  @Column(name="QUESTIONNAIRE_ID")
     	private Long questionnaireId;

  
    
  public Long getQuestionnaireId() {
	return questionnaireId;
}

public void setQuestionnaireId(Long questionnaireId) {
	this.questionnaireId = questionnaireId;
}

public Long getQuestionId() {
		return questionId;
  }
  
  public void setQuestionId(Long questionId) {
		this.questionId = questionId;
  }
  
  
    
  public String getProblemChoice() {
		return problemChoice;
  }
  
  public void setProblemChoice(String problemChoice) {
		this.problemChoice = problemChoice;
  }
  
  
    
  public Date getVoteTime() {
		return voteTime;
  }
  
  public void setVoteTime(Date voteTime) {
		this.voteTime = voteTime;
  }
  
  
    
  public Long getBuildingId() {
		return buildingId;
  }
  
  public void setBuildingId(Long buildingId) {
		this.buildingId = buildingId;
  }
  
 

   @Override
   public String[] businessKeys() {
     // TODO Auto-generated method stub
    return null;
   }

}