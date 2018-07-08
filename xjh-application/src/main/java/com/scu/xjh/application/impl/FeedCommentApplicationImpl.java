package com.scu.xjh.application.impl;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.transaction.annotation.Transactional;

import com.scu.xjh.application.FeedApplication;
import com.scu.xjh.application.FeedCommentApplication;
import com.scu.xjh.feedcomment.core.domain.FeedComment;

@Named
@Transactional
public class FeedCommentApplicationImpl implements FeedCommentApplication {
   @Inject
	private FeedApplication feedApplication;
	public FeedComment getFeedComment(Long id) {
		return FeedComment.get(FeedComment.class, id);
	}
	
	public void creatFeedComment(FeedComment feedComment) {
		feedComment.save();
	}
	
	public void updateFeedComment(FeedComment feedComment) {
		feedComment .save();
	}
	
	public void removeFeedComment(FeedComment feedComment) {
		if(feedComment != null){
			feedComment.remove();
		}
	}
	
	public void removeFeedComments(Set<FeedComment> feedComments) {
		for (FeedComment feedComment : feedComments) {
			feedComment.remove();
		}
	}
	
	public List<FeedComment> findAllFeedComment() {
		return FeedComment.findAll(FeedComment.class);
	}
	
}
