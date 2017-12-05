package com.scu.xjh.feed.facade;

import java.util.List;

import org.dayatang.utils.Page;
import org.openkoala.koala.commons.InvokeResult;

import com.scu.xjh.feed.facade.dto.FeedCommentDTO;

public interface FeedCommentFacade {

	public InvokeResult getFeedComment(Long id);
	
	public void creatFeedComment(FeedCommentDTO feedComment);
	
	//public InvokeResult updateFeedComment(FeedCommentDTO feedComment);
	
	public InvokeResult removeFeedComment(Long id);
	
	public InvokeResult removeFeedComments(Long[] ids);
	
	public List<FeedCommentDTO> findAllFeedComment();
	
	public Page<FeedCommentDTO> pageQueryFeedComment(FeedCommentDTO feedComment, int currentPage, int pageSize);
	

}

