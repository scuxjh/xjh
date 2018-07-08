package com.scu.xjh.application.impl;

import java.util.List;
import java.util.Set;
import javax.inject.Named;
import org.springframework.transaction.annotation.Transactional;
import com.scu.xjh.application.VoteRecordApplication;
import com.scu.xjh.questionnaire.core.domain.VoteRecord;

@Named
@Transactional
public class VoteRecordApplicationImpl implements VoteRecordApplication {

	public VoteRecord getVoteRecord(Long id) {
		return VoteRecord.get(VoteRecord.class, id);
	}
	
	public void creatVoteRecord(VoteRecord voteRecord) {
		voteRecord.save();
	}
	
	public void updateVoteRecord(VoteRecord voteRecord) {
		voteRecord .save();
	}
	
	public void removeVoteRecord(VoteRecord voteRecord) {
		if(voteRecord != null){
			voteRecord.remove();
		}
	}
	
	public void removeVoteRecords(Set<VoteRecord> voteRecords) {
		for (VoteRecord voteRecord : voteRecords) {
			voteRecord.remove();
		}
	}
	
	public List<VoteRecord> findAllVoteRecord() {
		return VoteRecord.findAll(VoteRecord.class);
	}
	
}
