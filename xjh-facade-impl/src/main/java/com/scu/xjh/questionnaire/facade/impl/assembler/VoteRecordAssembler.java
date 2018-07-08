package com.scu.xjh.questionnaire.facade.impl.assembler;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.scu.xjh.questionnaire.core.domain.*;
import com.scu.xjh.questionnaire.facade.dto.VoteRecordDTO;

public class VoteRecordAssembler {
	
	public static VoteRecordDTO  toDTO(VoteRecord  voteRecord){
		if (voteRecord == null) {
			return null;
		}
    	VoteRecordDTO result  = new VoteRecordDTO();
	    	result.setId (voteRecord.getId());
     	    	result.setVersion (voteRecord.getVersion());
     	    	//result.setCreateTime (voteRecord.getCreateTime());
     	    	//result.setUpdateTime (voteRecord.getUpdateTime());
     	    	//result.setQuestionId (voteRecord.getQuestionId());
     	    	result.setProblemChoice (voteRecord.getProblemChoice());
     	    	//result.setVoteTime (voteRecord.getVoteTime());
     	    	result.setBuildingId (voteRecord.getBuildingId());
     	    return result;
	 }
	
	public static List<VoteRecordDTO>  toDTOs(Collection<VoteRecord>  voteRecords){
		if (voteRecords == null) {
			return null;
		}
		List<VoteRecordDTO> results = new ArrayList<VoteRecordDTO>();
		for (VoteRecord each : voteRecords) {
			results.add(toDTO(each));
		}
		return results;
	}
	
	 public static VoteRecord  toEntity(VoteRecordDTO  voteRecordDTO){
	 	if (voteRecordDTO == null) {
			return null;
		}
	 	VoteRecord result  = new VoteRecord();
        //result.setId (voteRecordDTO.getId());
        //result.setVersion (voteRecordDTO.getVersion());
        // result.setCreateTime (voteRecordDTO.getCreateTime());
         //result.setUpdateTime (voteRecordDTO.getUpdateTime());
         //result.setQuestionId (voteRecordDTO.getQuestionId());
         result.setQuestionnaireId(voteRecordDTO.getQuesitonnaireId());
         result.setProblemChoice (voteRecordDTO.getProblemChoice());
         //result.setVoteTime (voteRecordDTO.getVoteTime());
         //result.setBuildingId (voteRecordDTO.getBuildingId());
 	  	return result;
	 }
	
	public static List<VoteRecord> toEntities(Collection<VoteRecordDTO> voteRecordDTOs) {
		if (voteRecordDTOs == null) {
			return null;
		}
		
		List<VoteRecord> results = new ArrayList<VoteRecord>();
		for (VoteRecordDTO each : voteRecordDTOs) {
			results.add(toEntity(each));
		}
		return results;
	}
}
