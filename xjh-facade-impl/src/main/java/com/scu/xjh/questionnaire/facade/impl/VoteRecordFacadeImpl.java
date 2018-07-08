package com.scu.xjh.questionnaire.facade.impl;

import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;
import java.text.MessageFormat;

import javax.inject.Inject;
import javax.inject.Named;

import org.dayatang.domain.InstanceFactory;
import org.dayatang.utils.Page;
import org.dayatang.querychannel.QueryChannelService;
import org.openkoala.koala.commons.InvokeResult;

import com.scu.xjh.application.VoteRecordApplication;
import com.scu.xjh.questionnaire.core.domain.*;
import com.scu.xjh.questionnaire.facade.VoteRecordFacade;
import com.scu.xjh.questionnaire.facade.dto.VoteRecordDTO;
import com.scu.xjh.questionnaire.facade.impl.assembler.VoteRecordAssembler;

@Named
public class VoteRecordFacadeImpl implements VoteRecordFacade {

	@Inject
	private VoteRecordApplication  application;

	private QueryChannelService queryChannel;

    private QueryChannelService getQueryChannelService(){
       if(queryChannel==null){
          queryChannel = InstanceFactory.getInstance(QueryChannelService.class,"queryChannel");
       }
     return queryChannel;
    }
	
	public InvokeResult getVoteRecord(Long id) {
		return InvokeResult.success(VoteRecordAssembler.toDTO(application.getVoteRecord(id)));
	}
	
	public InvokeResult creatVoteRecord(VoteRecordDTO voteRecordDTO) {
		application.creatVoteRecord(VoteRecordAssembler.toEntity(voteRecordDTO));
		return InvokeResult.success();
	}
	
	public InvokeResult updateVoteRecord(VoteRecordDTO voteRecordDTO) {
		application.updateVoteRecord(VoteRecordAssembler.toEntity(voteRecordDTO));
		return InvokeResult.success();
	}
	
	public InvokeResult removeVoteRecord(Long id) {
		application.removeVoteRecord(application.getVoteRecord(id));
		return InvokeResult.success();
	}
	
	public InvokeResult removeVoteRecords(Long[] ids) {
		Set<VoteRecord> voteRecords= new HashSet<VoteRecord>();
		for (Long id : ids) {
			voteRecords.add(application.getVoteRecord(id));
		}
		application.removeVoteRecords(voteRecords);
		return InvokeResult.success();
	}
	
	public List<VoteRecordDTO> findAllVoteRecord() {
		return VoteRecordAssembler.toDTOs(application.findAllVoteRecord());
	}
	
	public Page<VoteRecordDTO> pageQueryVoteRecord(VoteRecordDTO queryVo, int currentPage, int pageSize) {
		List<Object> conditionVals = new ArrayList<Object>();
	   	StringBuilder jpql = new StringBuilder("select _voteRecord from VoteRecord _voteRecord   where 1=1 ");
	   	if (queryVo.getCreateTime() != null) {
	   		jpql.append(" and _voteRecord.createTime between ? and ? ");
	   		conditionVals.add(queryVo.getCreateTime());
	   		//conditionVals.add(queryVo.getCreateTimeEnd());
	   	}	
	   	if (queryVo.getUpdateTime() != null) {
	   		jpql.append(" and _voteRecord.updateTime between ? and ? ");
	   		conditionVals.add(queryVo.getUpdateTime());
	   		//conditionVals.add(queryVo.getUpdateTimeEnd());
	   	}	
	   	if (queryVo.getProblemChoice() != null && !"".equals(queryVo.getProblemChoice())) {
	   		jpql.append(" and _voteRecord.problemChoice like ?");
	   		conditionVals.add(MessageFormat.format("%{0}%", queryVo.getProblemChoice()));
	   	}		
	   	if (queryVo.getVoteTime() != null) {//conditionVals.add(queryVo.getVoteTimeEnd());
	   	}	
        Page<VoteRecord> pages = getQueryChannelService()
		   .createJpqlQuery(jpql.toString())
		   .setParameters(conditionVals)
		   .setPage(currentPage, pageSize)
		   .pagedList();
		   
        return new Page<VoteRecordDTO>(pages.getStart(), pages.getResultCount(),pageSize, VoteRecordAssembler.toDTOs(pages.getData()));
	}
	
	
}
