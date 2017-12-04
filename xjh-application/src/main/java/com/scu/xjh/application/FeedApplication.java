package com.scu.xjh.application;


import java.util.List;
import java.util.Set;

import com.scu.xjh.feed.core.domain.Feed;

public interface FeedApplication {

	public Feed getFeed(Long id);
	
	public void creatFeed(Feed feed);
	
	public void updateFeed(Feed feed);
	
	public void removeFeed(Feed feed);
	
	public void removeFeeds(Set<Feed> feeds);
	
	public List<Feed> findAllFeed();
	
}

