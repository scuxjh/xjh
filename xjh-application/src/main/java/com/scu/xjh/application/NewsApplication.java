package com.scu.xjh.application;


import java.util.List;
import java.util.Set;

import com.scu.xjh.news.core.domain.News;

public interface NewsApplication {

	public News getNews(Long id);
	
	public void createNews(News news);
	
	public void updateNews(News news);
	
	public void removeNews(News news);
	
	public void removeNewss(Set<News> newss);
	
	public List<News> findAllNews();
	
}

