package com.scu.xjh.questionnaire.facade.dto;

import java.util.Date;

import java.io.Serializable;

public class VoteRecordDTO implements Serializable {

	private Long id;

	private int version;

			
		private String problemChoice;
		
		private Long quesitonnaireId;
				
		public Long getQuesitonnaireId() {
			return quesitonnaireId;
		}

		public void setQuesitonnaireId(Long quesitonnaireId) {
			this.quesitonnaireId = quesitonnaireId;
		}

		private String createTime;
				
		private Long questionId;
		
				
		private String updateTime;
				
		private String voteTime;
				
		private Long buildingId;
		
			
	
	public void setProblemChoice(String problemChoice) { 
		this.problemChoice = problemChoice;
	}

	public String getProblemChoice() {
		return this.problemChoice;
	}
		
			
	
	public void setCreateTime(String createTime) { 
		this.createTime = createTime;
	}

	public String getCreateTime() {
		return this.createTime;
	}
		
		
			
	
	public void setQuestionId(Long questionId) { 
		this.questionId = questionId;
	}

	public Long getQuestionId() {
		return this.questionId;
	}
		
			
	
	public void setUpdateTime(String updateTime) { 
		this.updateTime = updateTime;
	}

	public String getUpdateTime() {
		return this.updateTime;
	}
		
			
	
	public void setVoteTime(String voteTime) { 
		this.voteTime = voteTime;
	}

	public String getVoteTime() {
		return this.voteTime;
	}
		
	
			
	
	public void setBuildingId(Long buildingId) { 
		this.buildingId = buildingId;
	}

	public Long getBuildingId() {
		return this.buildingId;
	}
		
		
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VoteRecordDTO other = (VoteRecordDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}