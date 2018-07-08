package com.scu.xjh.feed.facade;

import java.util.List;

import org.dayatang.utils.Page;
import org.openkoala.koala.commons.InvokeResult;

import com.scu.xjh.feed.facade.dto.*;

public interface FeedFacade {

	public InvokeResult getFeed(Long id);
	
	public InvokeResult creatFeed(FeedDTO feed);
	
	//public InvokeResult updateFeed(FeedDTO feed);
	
	public InvokeResult removeFeed(Long id);
	
	public InvokeResult removeFeeds(Long[] ids);
	
	public List<FeedDTO> findAllFeed();
	
	public Page<FeedDTO> pageQueryFeed(FeedDTO feed, int currentPage, int pageSize);
	

}

