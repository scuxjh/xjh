package com.scu.xjh.news.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.dayatang.utils.Page;

import com.scu.xjh.news.facade.NewsFacade;
import com.scu.xjh.news.facade.dto.NewsDTO;

import org.openkoala.koala.commons.InvokeResult;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.apache.commons.lang3.StringEscapeUtils;

@Controller
@RequestMapping("/news")
public class NewsController {
		
	@Inject
	private NewsFacade newsFacade;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(NewsController.class);
	
	/**
	 * 语音文件上传。
	 * 
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * @version
	 * 20181108pm
	 *     1.new.
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadMessage", method = RequestMethod.POST)
	public InvokeResult uploadMessage(HttpServletRequest request) throws IllegalStateException, IOException{
		request.setCharacterEncoding("utf-8");//设置编码
		//配置文件上传的路劲
		//String path = request.getRealPath("/uploadMessage") + "/";
		String path = request.getSession().getServletContext().getRealPath("/uploadMessage") + "/";
		File dirFile = new File(path);
		if(!dirFile.exists()){
			dirFile.mkdir();
		}
		System.out.println("1111, path = "+path);
		//获得磁盘文件条目工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setSizeThreshold(1024 * 1024);
		
		//高水平的API文件处理
		ServletFileUpload upload = new ServletFileUpload(factory);
		Map resultMap = new HashMap();
		try {
			List<FileItem> list = upload.parseRequest(request);
			FileItem fileItem = null;
			for(FileItem item : list){
				//获取表单的属性名字
				String name = item.getFieldName();
				//如果获取的表单信息是普通的文本信息
				if(item.isFormField()){
					//获取用户输入的字符串
					String value = item.getString();
					request.setAttribute(name, value);
					System.out.println("name=" + name + ",value=" + value);
				}
				else {
					fileItem = item;
				}
			}
			
			//自定义上传音频的文件名
			//上传用户的用户名，电话号码，上传时间
			String userName = URLDecoder.decode((String) request.getAttribute("username"), "utf-8");
//			String userName = (String) request.getAttribute("username");
//			userName = StringEscapeUtils.unescapeJava(userName);
			LOGGER.info("111, userName:" + userName);
			String userPhoneNumber = (String) request.getAttribute("userphonenumber");
			String time = (String) request.getAttribute("time");
			String fileName =  userName + userPhoneNumber +" "+ time +".mp3";
					
			String destPath = path + fileName;
			System.out.println("destPath=" + destPath);
			
			//真正写在磁盘上
			File file = new File(destPath);
			OutputStream out = new FileOutputStream(file);
			InputStream in = fileItem.getInputStream();
			int length = 0;
			byte[] buf = new byte[1024];
			//in.read(buf)每次读到的数据存放在buf数组中
			while((length = in.read(buf)) != -1){
				//在buf数组中取出数据写到（输入流）磁盘上
				out.write(buf,0,length);
			}
			in.close();
			out.close();
			
			String imageUrl = request.getContextPath()+"/uploadMessage/" + fileName;
			LOGGER.info("imageUrl:"+imageUrl);
			resultMap.put("message", "上传成功。");
			resultMap.put("imageUrl", imageUrl);
		} catch (Exception e) {
			// TODO: handle exception
		} finally{
			return InvokeResult.success(resultMap);
		}
	}
	
	/**
	 * 新增/修改 新闻 
	 * @param newsDTO
	 * @return
	 * @version
	 * 20170117nt
	 * 		1.new。
	 */
	@ResponseBody
	@RequestMapping("/add")
	public InvokeResult add(NewsDTO newsDTO) {
		LOGGER.info("1111,in add,newsDTO.getNewsTitle:"+newsDTO.getNewsTitle()+",startTime:"+newsDTO.getStartTime()+",categoryId:"+newsDTO.getCategoryId());
		return newsFacade.createNews(newsDTO);
	}
	/**
	 * 
	 * @param newsDTO
	 * @param page
	 * @param pagesize
	 * @return
	 * @version
	 * 20170117nt
	 * 		1.new.
	 */
	@ResponseBody
	@RequestMapping("/pageJson")
	public Page pageJson(NewsDTO newsDTO, @RequestParam int page, @RequestParam int pagesize) {
		LOGGER.info("1111,in pageJson..");
		Page<NewsDTO> all = newsFacade.pageQueryNews(newsDTO, page, pagesize);
		return all;
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public InvokeResult remove(@RequestParam String ids) {
		String[] value = ids.split(",");
        Long[] idArrs = new Long[value.length];
        for (int i = 0; i < value.length; i ++) {
        	idArrs[i] = Long.parseLong(value[i]);
        }
        return newsFacade.removeNewss(idArrs);
	}
	
	@ResponseBody
	@RequestMapping("/get/{id}")
	public InvokeResult get(@PathVariable Long id) {
		return newsFacade.getNews(id);
	}
	
}
