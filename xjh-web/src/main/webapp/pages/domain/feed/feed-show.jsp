<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- taglib可以自定义标签库 -->

<!DOCTYPE html>
<html>
<head>
<title>新闻列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script type="text/javascript">
var _dialog;
var selectItems = {};
//取得绝对路经
var contextPath = '${pageContext.request.contextPath}';
//$grid作为全局变量，方便使用。
var $grid_feed;
$(function (){	
	var $searchForm_feed;
	//$.now() 函数用于返回当前时间距1970年1月1日午夜所经过的毫秒数
	var nowNumber = $.now();//20150817am
    ($searchForm_feed=$("#searchForm_feed")).attr("id", "form_"+nowNumber);//20150817am
  //alert($searchForm_feed.attr("id"));
    ($grid_feed=$("#divGrid_feed")).attr("id", "grid_"+nowNumber);
    //设置pageloader的initGridPanel属性为一个function函数，PageLoader。initGridPanel可以调用此函数
	PageLoader = {
	    initSearchPanel:function(){},
	    initGridPanel: function(){
	         var self = this;
	         var timewidth="180px";
	         var titlewidth="280px";
	         //？？
	         return $grid_feed.grid({
	                identity: "id",
	                lockWidth: true,
	                buttons: [
	                          //&nbsp表示空格
	                        {content: '<ks:hasSecurityResource identifier="feedQuery"><button class="btn btn-success" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;高级搜索&nbsp; <span class="caret"></span> </button></ks:hasSecurityResource>', action: 'feedQuery'}
	                    ],
	                url: contextPath+"/Feed/pageJson.action",
	                columns: [
	                            //name属性与feed的属性值对应
	                     	    { title: '标题', name: 'feedTitle', width: titlewidth}
                               ,{ title: '所属类别', name: 'categoryName', width: col_md}
                               
                               ,{ title: '创建时间', name: 'createTime', width: timewidth}
	                           ,{ title: '发布时间', name: 'startTime', width: timewidth}
	                           ,{ title: '操作', width: col_xs, render: function (rowdata, name, index)
	                                 {
	                                     var param = '"' + rowdata.id + '"';
	                                     //点击链接时返回js函数viewFeed
	                                     var h = "<a href='javascript:viewFeed(" + param + ")'>查看</a> ";
	                                     return h;                         
	                                 }
	                            }
	                ]
	         }).on({
	                   'add': function(){
	                       self.add($(this));
	                   },
	                   //event,data怎么传递的
	                   'modify': function(event, data){
	                        var indexs = data.data;
	                        var $this = $(this);
	                        if(indexs.length == 0){
	                            $this.message({
	                                type: 'warning',
	                                content: '请选择一条记录进行修改'
	                            })
	                            return;
	                        }
	                        if(indexs.length > 1){
	                            $this.message({
	                                type: 'warning',
	                                content: '只能选择一条记录进行修改'
	                            })
	                            return;
	                        }
	                       self.modify(indexs[0], $this);
	                    },
	                   'delete': function(event, data){
	                        var indexs = data.data;
	                        var $this = $(this);
	                        if(indexs.length<1){
	                            $this.message({type: 'warning', content: '请选择一条记录'});
	                            return;
	                        }
	                        var remove = function(){
	                        	for(var i in indexs){
	                            self.remove(indexs[i], $this);
	                        	}
	                        };
	                        $this.confirm({content: '确定要删除所选记录吗?', callBack: remove});
	                   }
	                   ,'feedQuery': function(event, data){
	                	   $searchForm_feed.toggle(500);
	                   }
	                   ,'activate': function(event, data){//20160407pm
	                	   var indexs = data.data;
	                	   var $this = $(this);
	                       if(indexs.length != 1){
	                           $this.message({type: 'warning', content: '请选择一条记录'});
	                           return;
	                       }
	                	   alterFeedDisplay(indexs[0], 1);
	                   }
	                   ,'forbidden': function(event, data){
	                	   var indexs = data.data;
	                	   var $this = $(this);
	                       if(indexs.length != 1){
	                           $this.message({type: 'warning', content: '请选择一条记录'});
	                           return;
	                       }
	                	   alterFeedDisplay(indexs[0], 0);
	                   }
	         });
	    },//end of initGridPanel().
	    add: function($grid){
	    	addfeed($grid);
	    }
	   ,modify: function(id, $grid){
		   addfeed($grid, id);
	    }
	   ,remove: function(id, $grid){
		   var theGrid = $grid.getGrid();
		    var data = [{ name: 'ids', value: id}];
	    	$.post(contextPath+"/Feed/delete.action", data).done(function(result){
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
	$searchForm_feed.find('#search').on('click', function(){
            //if(!Validator.Validate(document.getElementById(""),3)) return;
        //if(!Validator.Validate($searchForm, 3)) return;
            var params = {};
            $searchForm_feed.find('input').each(function(){
                var $this = $(this);
                var name = $this.attr('name');
                if(name){
                    params[name] = $this.val();
                }
            });
            $grid_feed.getGrid().search(params);
        });
});

/**
 * 查看一条新闻数据记录
   @param
       id:数据记录ID。
   @version
       20170119nt
       1.new.
 */
var viewFeed = function(id){
	var url = contextPath + "/pages/common/template/ModalDialog-template-full.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	//$dialog.find(".modal-title").html("查看");
    	url = contextPath+"/pages/domain/feed/feed-form.jsp";
    	$.get(url).done(function(html){
    		$dialog.find("form").append($(html));
    	    var $form = $dialog.find('form');
    	    initForm($form);
    	    $dialog.modal({
    	    	keyboard:false
    	    }).on({
    	    	'hidden.bs.modal': function(){$(this).remove();}
    	    });
    	    appendData2Form("Feed", $dialog, id, true);
    	    $form.find("#commentbuttonId").click( function(){
    	    	$form.find(".commit").attr("value","");
    	    	$form.find(".commentcontent").show();
    	    });
    	   $form.find("#commentcommitId").click(function(){
    		   $form.find("#commentbuttonId").attr("value","再次献策haha");
    		   
    		   if($(this).prevAll("#feedCommentId").val()!=null)
    		   addcomment($form,id);
    	   })
    	 });
	});
};//End of function viewFeed.
//保存献策的内容和献策者的姓名和电话
var addcomment=function($form,id){
	var theUrl = contextPath+"/FeedComment/add.action";
    $.post(theUrl, {feedId:id,
    	commenterName:$form.find("#commenterNameId").attr("value"),
    	commenterTel:$form.find("#commenterTelId").attr("value"),
    	feedContent:$form.find("#feedContentID").attr("value"),
    	});
    $form.find(".commentcontent").hide();
}
/**
 * 更改新闻前端显示状态。
 * @version
 	20170117nt
 		1.new.
 */
var alterFeedDisplay = function(id, display){
	//20160730pm
	var theGrid = $grid_feed.getGrid();
	var items = theGrid.selectedRows();
	var curDisplay = items[0].display;
	if(display == curDisplay)  return;
	var data = [{ name: 'id', value: id},{name:"display", value: display}];
	var url = contextPath+"/Feed/alterFeedDisplay.action";
	$.post(url, data).done(function(result){
    	if(result.success){
    		theGrid.refresh();//20160407pm
    		$grid_feed.message({type: 'success', content: '操作成功'});
        }else{
            $grid_feed.message({type: 'error', content: result.errorMessage});
        }
	});
};
</script>
</head>
<body>
<div style="width:98%;margin-right:auto; margin-left:auto; padding-top: 0px;">
<!-- search form -->
<form id="searchForm_feed" target="_self" class="form-horizontal" style="display:none;">
<input type="hidden" name="page" value="0">
<input type="hidden" name="pagesize" value="10">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
          <div class="form-group">
          	<label class="control-label" style="width:100px;float:left;">标题:&nbsp;</label>
            <div style="margin-left:15px;float:left;">
            	<input name="feedTitle" class="form-control" type="text" style="width:180px;" id="feedTitleID"  />
        	</div>
          </div>
    </td>
       <td style="vertical-align: bottom;"><button id="search" type="button" style="position:relative; margin-left:35px; top: -15px" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</button></td>
  </tr>
</table>
</form>
<!-- grid -->
<div id="divGrid_feed"></div><!-- 20150817am -->
</div>
</body>
</html>