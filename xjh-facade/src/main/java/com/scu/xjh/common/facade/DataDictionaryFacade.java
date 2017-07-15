package com.scu.xjh.common.facade;

import java.util.LinkedHashMap;

public interface DataDictionaryFacade {

	/**
	 * @title  根据数据字典ID查询该类字典的数据项。  
     * @author ywang
	 * @param dictId 
     * @return
     * @version  
     * 20160821am
     *     1.new.
	 */
	public LinkedHashMap<String, Object> getDictItems(String dictId);
//	public abstract List<Map<String, String>> translateFromFile(String dicId);
	public abstract LinkedHashMap<String, Object> translateFromFile(String dictId);
}