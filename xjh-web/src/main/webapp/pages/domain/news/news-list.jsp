<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%//@ taglib prefix="ks" uri="http://www.openkoala.org/security" %>
<!DOCTYPE html>
<html>
<head>
<title>新闻列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
var _dialog;
var selectItems = {};
var contextPath = '${pageContext.request.contextPath}';
//$grid作为全局变量，方便使用。
var $grid_news;
$(function (){	
	var $searchForm_news;
	var nowNumber = $.now();//20150817am
    ($searchForm_news=$("#searchForm_news")).attr("id", "form_"+nowNumber);//20150817am
    ($grid_news=$("#divGrid_news")).attr("id", "grid_"+nowNumber);
    
	PageLoader = {
	    initSearchPanel:function(){},
	    initGridPanel: function(){
	         var self = this;
	         return $grid_news.grid({
	                identity: "id",
	                lockWidth: true,
	                buttons: [
	                       {content: '<button class="btn btn-success" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;高级搜索&nbsp; <span class="caret"></span> </button>', action: 'newsQuery'}
	                    ],
	                url: "/news/pageJson.action",//contextPath+
	                columns: [
	                     	    { title: '标题', name: 'newsTitle', width: col_md}
                               ,{ title: '所属类别', name: 'categoryName', width: col_sm}
                               ,{ title: '是否前台显示', name: 'display', width: col_md, render: function(rowdata, name, index){
	                         		var display = rowdata.display;
	                         		var available = '<span class="glyphicon glyphicon-ok" style="color:#5CB85C;margin-left:15px;" title="是"></span>';
	                         		var forbidden = '<span class="glyphicon glyphicon-remove" style="color:#D9534F;margin-left:15px;" title="否"></span>';
	                         		if(display == "1"){
	                         			return available;
	                         		}else{
	                         			return forbidden;
	                         		}
	                         	}}
                               ,{ title: '发布人员', name: 'adminName', width: col_sm}
                               ,{ title: '创建时间', name: 'createTime', width: col_md}
	                           ,{ title: '发布时间', name: 'startTime', width: col_md}
	                           ,{ title: '操作', width: col_xs, render: function (rowdata, name, index)
	                                 {
	                                     var param = '"' + rowdata.id + '"';
	                                     var h = "<a href='javascript:viewNews(" + param + ")'>查看</a> ";
	                                     return h;
	                                 }
	                            }
	                ]
	         }).on({
	                   'newsQuery': function(event, data){
	                	   $searchForm_news.toggle(500);
	                   }
	         });
	    },//end of initGridPanel().
	    add: function($grid){
	    	addNews($grid);
	    }
	   ,modify: function(id, $grid){
		   addNews($grid, id);
	    }
	   ,remove: function(id, $grid){
		   var theGrid = $grid.getGrid();
		    var data = [{ name: 'ids', value: id}];
	    	$.post(contextPath+"/news/delete.action", data).done(function(result){
	    		if(result.success){
                	theGrid.refresh();
                	$grid.message({type: 'success', content: '操作成功'});
                }else{
                	$grid.message({type: 'error', content: result.errorMessage});
                }
	    	});
	    }
	};//end of PageLoader.
	//PageLoader.initDict();//20150704 am
	//PageLoader.initSearchPanel();
	PageLoader.initGridPanel();
	$searchForm_news.find('#search').on('click', function(){
            //if(!Validator.Validate(document.getElementById(""),3)) return;
        //if(!Validator.Validate($searchForm, 3)) return;
            var params = {};
            $searchForm_news.find('input').each(function(){
                var $this = $(this);
                var name = $this.attr('name');
                if(name){
                    params[name] = $this.val();
                }
            });
            $grid_news.getGrid().search(params);
        });
});
/**
 	* 新增或修改 一条新闻。
   @param
       $grid  
       newsId 主键。
   @version
   	20170118am
       1.new.
 */
var addNews = function($grid, newsId){
	var url = contextPath + "/pages/common/template/ModalDialog-template.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	$dialog.find(".modal-title").html("新增");
    	url = contextPath+"/pages/domain/news/news-form.jsp";
    	$.get(url).done(function(html){
    		$dialog.find("form").append($(html));
    		var $form = $dialog.find('form');
    		//20170118pm
    		initForm($form);
    		$dialog.modal({
                keyboard:true
            }).on({
                'hidden.bs.modal': function(){$(this).remove();}
            });
    		//console.log("1111,in addNews,newsId:"+newsId);
    		if(newsId) appendData2Form("news", $dialog, newsId);
            $dialog.find('#saveBtn').on('click', function(e){
                  //if(!Validator.Validate($form))  return;//20160825nt
                  //console.log("1111,in add..,serialize:"+$dialog.find('form').serialize());
                  var theUrl = contextPath+"/news/add.action";
                  $.post(theUrl, $dialog.find('form').serialize()).done(function(result){
                       if(result.success ){
                    	   $dialog.modal('hide');
                           $grid.getGrid().refresh();
                           $grid.message({type: 'success', content: '操作成功'});
                        }else{
                           $dialog.find('.modal-content').message({type: 'error', content: result.errorMessage});
                        }
                  });//end of $.post.done().
            });
    	});
    });
};//end of function addNews.
/**
 * 查看一条新闻数据记录
   @param
       id:数据记录ID。
   @version
       20170119nt
       1.new.
 */
var viewNews = function(id){
	var url = contextPath + "/pages/common/template/ModalDialog-template.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	//$dialog.find(".modal-title").html("查看");
    	url = contextPath+"/pages/domain/news/news-form.jsp";
    	$.get(url).done(function(html){
    		$dialog.find("form").append($(html));
    	    var $form = $dialog.find('form');
    	    initForm($form);
    	    $dialog.modal({
    	    	keyboard:false
    	    }).on({
    	    	'hidden.bs.modal': function(){$(this).remove();}
    	    });
    	    appendData2Form("news", $dialog, id, true);
    	 });
	});
};//End of function viewNews.
/**
 * 更改新闻前端显示状态。
 * @version
 	20170117nt
 		1.new.
 */
var alterNewsDisplay = function(id, display){
	//20160730pm
	var theGrid = $grid_news.getGrid();
	var items = theGrid.selectedRows();
	var curDisplay = items[0].display;
	if(display == curDisplay)  return;
	var data = [{ name: 'id', value: id},{name:"display", value: display}];
	var url = contextPath+"/news/alterNewsDisplay.action";
	$.post(url, data).done(function(result){
    	if(result.success){
    		theGrid.refresh();//20160407pm
    		$grid_news.message({type: 'success', content: '操作成功'});
        }else{
            $grid_news.message({type: 'error', content: result.errorMessage});
        }
	});
};
</script>
</head>
<body>
<div style="width:98%;margin-right:auto; margin-left:auto; padding-top: 0px;">
<!-- search form -->
<form id="searchForm_news" target="_self" class="form-horizontal" style="display:none;">
<input type="hidden" name="page" value="0">
<input type="hidden" name="pagesize" value="10">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
          <div class="form-group">
          	<label class="control-label" style="width:100px;float:left;">标题:&nbsp;</label>
            <div style="margin-left:15px;float:left;">
            	<input name="newsTitle" class="form-control" type="text" style="width:180px;" id="newsTitleID"  />
        	</div>
          </div>
    </td>
       <td style="vertical-align: bottom;"><button id="search" type="button" style="position:relative; margin-left:35px; top: -15px" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</button></td>
  </tr>
</table>
</form>
<!-- grid -->
<div id="divGrid_news"></div><!-- 20150817am -->
</div>
</body>
</html>