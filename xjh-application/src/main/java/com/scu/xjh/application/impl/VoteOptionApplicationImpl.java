package com.scu.xjh.application.impl;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.inject.Named;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.scu.xjh.application.VoteOptionApplication;
import com.scu.xjh.application.VoteTitleApplication;
import com.scu.xjh.questionnaire.core.domain.VoteOption;

@Named
@Transactional
public class VoteOptionApplicationImpl implements VoteOptionApplication {
	@Inject
	private VoteTitleApplication voteTitleApplication;
	

	private static final Logger LOGGER = LoggerFactory.getLogger(VoteTitleApplicationImpl.class);

	public VoteOption getVoteOption(Long id) {
		return VoteOption.get(VoteOption.class, id);
	}
	public List<VoteOption> getVoteOptionByvtId(Long vtid) {
		List<VoteOption> resultList= VoteOption.findByProperty(VoteOption.class, "questionId", vtid);
		LOGGER.info("resultListoption.size():"+resultList.size());
		return resultList;
	}
	public void creatVoteOption(VoteOption voteOption) {
		voteOption.setQuestionId(voteTitleApplication.getCurrenttitleid());
		voteOption.save();
	}
	
	public void updateVoteOption(VoteOption voteOption) {
		voteOption .save();
	}
	
	public void removeVoteOption(VoteOption voteOption) {
		if(voteOption != null){
			voteOption.remove();
		}
	}
	
	public void removeVoteOptions(Set<VoteOption> voteOptions) {
		for (VoteOption voteOption : voteOptions) {
			voteOption.remove();
		}
	}
	
	public List<VoteOption> findAllVoteOption() {
		return VoteOption.findAll(VoteOption.class);
	}
	
}
