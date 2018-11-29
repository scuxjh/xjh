<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- taglib可以自定义标签库 -->

<!DOCTYPE html>
<html>
<head>
<title>问卷调查</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script type="text/javascript">
var _dialog;
var selectItems = {};
//取得绝对路经
var contextPath = '${pageContext.request.contextPath}';
//$grid作为全局变量，方便使用。
var $grid_question;
$(function (){	
	var $searchForm_question;
	//$.now() 函数用于返回当前时间距1970年1月1日午夜所经过的毫秒数
	var nowNumber = $.now();//20150817am
    ($searchForm_question=$("#searchForm_question")).attr("id", "form_"+nowNumber);//20150817am
    ($grid_question=$("#divGrid_question")).attr("id", "grid_"+nowNumber);
    //设置pageloader的initGridPanel属性为一个function函数，PageLoader。initGridPanel可以调用此函数
	PageLoader = {
	    initSearchPanel:function(){},
	    initGridPanel: function(){
	         var self = this;
	         //？？
	         return $grid_question.grid({
	                identity: "id",
	                lockWidth: true,
	                buttons: [
	                        {content: '<ks:hasSecurityResource identifier="questionQuery"><button class="btn btn-success" type="button"><span class="glyphicon glyphicon-search"></span>&nbsp;高级搜索&nbsp; <span class="caret"></span> </button></ks:hasSecurityResource>', action: 'questionQuery'}
	                    ],
	                url: contextPath+"/Questionnaire/pageJson.action",
	                //name属性与questionnaireDTO的字段对应
	                columns: [
	                     	    { title: '问卷标题', name: 'questionnaireTitle', width: "250px"}
                               ,{ title: '所属类别', name: 'categoryName', width: col_sm}
	                           ,{ title: '发布时间', name: 'startTime', width: col_md}
	                           ,{ title: '操作', width: col_xs, render: function (rowdata, name, index)
	                                 {
	                                     var param = '"' + rowdata.id + '"';
	                                     //点击链接时返回js函数viewquestion
	                                     var h = "<a href='javascript:viewquestion(" + param + ")'>填写问卷</a> ";
	                                     return h;                         
	                                 }
	                            }
	                ]
	         }).on({
	                   
	                   'questionQuery': function(event, data){
	                	   $searchForm_question.toggle(500);
	                   }
	                   ,'activate': function(event, data){//20160407pm
	                	   var indexs = data.data;
	                	   var $this = $(this);
	                       if(indexs.length != 1){
	                           $this.message({type: 'warning', content: '请选择一条记录'});
	                           return;
	                       }
	                	   alterquestionDisplay(indexs[0], 1);
	                   }
	                   ,'forbidden': function(event, data){
	                	   var indexs = data.data;
	                	   var $this = $(this);
	                       if(indexs.length != 1){
	                           $this.message({type: 'warning', content: '请选择一条记录'});
	                           return;
	                       }
	                	   alterquestionDisplay(indexs[0], 0);
	                   }
	         });
	    },//end of initGridPanel().
	    
	};//end of PageLoader.
	//PageLoader.initDict();//20150704 am
	//PageLoader.initSearchPanel();
	PageLoader.initGridPanel();
	$searchForm_question.find('#search').on('click', function(){
            //if(!Validator.Validate(document.getElementById(""),3)) return;
        //if(!Validator.Validate($searchForm, 3)) return;
            var params = {};
            $searchForm_question.find('input').each(function(){
                var $this = $(this);
                var name = $this.attr('name');
                if(name){
                	alert($this.val());
                    params[name] = $this.val();
                }
            });
            $grid_question.getGrid().search(params);
        });
});

var viewquestion = function(id){
	var url = contextPath + "/pages/common/template/ModalDialog-template-lg.jsp";
    $.get(url).done(function(html){
    	var $dialog = $(html);
    	//$dialog.find(".modal-title").html("查看");
    	url = contextPath+"/pages/domain/questionnaire/Questionnaire-form.jsp";
    	$.get(url).done(function(html){
    		$dialog.find("form").append($(html));
    	    var $form = $dialog.find('form');
    	    $dialog.find(".display").hide();
    	    initForm($form);
    	    $dialog.modal({
    	    	keyboard:false
    	    }).on({
    	    	'hidden.bs.modal': function(){$(this).remove();}
    	    });
    	    //去除编辑模块
    	    $dialog.find(".xxk_box").remove();
    	    //改变模板标题、保存按钮，防止被appendData2Form方法修改
            $dialog.find(".modal-title").attr("class","quest-title").html("填写问卷");
    	    $dialog.find("#saveBtn").attr("id","questionsaveBtn");
    	    appendData2Form("Questionnaire", $dialog, id, true);
    	    showquestionnaire($dialog,id);
    	    $dialog.find('#questionsaveBtn').on('click', function(e){
                var theUrl = contextPath+"/VoteRecord/add.action";
                
                var dananswer;
                
                console.log($dialog.find('form').serialize());
                //传送问卷内容
                
                var uanswer="";
                $dialog.find(".movie_box").each(function(){
                	var xx_value =[];//定义一个空数组  
                	var questiontype=$(this).children(".dx_box").attr("data-t");
                	var formname=$(this).find("#xxgroup").first().attr("name");
                	if(questiontype==2){
                		uanswer+=$(this).find("textarea").val();
                		uanswer+=";";
                	}
                		$(this).find("input:checked").each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数    
                			
                			var xxanswer=$(this).siblings(".xxwenzi").text();
                			if($(this).parents("li").nextAll().find("input:checked").length==0)
                				xxanswer+=";";
                            xx_value.push(xxanswer);//将选中的值添加到数组chk_value中  
                            });	
                		//xx_value.push(";");
                		 uanswer+=xx_value.toString();
                });
                $.post(theUrl,{
        			problemChoice:uanswer,
        			quesitonnaireId:id,
        			//questionId:$(this).attr("id"),
        		}).done(function(result){
                    if(result.success ){
                   	   $dialog.modal('hide');
                   	  //$dialog.refresh();
                          $grid_question.getGrid().refresh();
                          $grid_question.message({type: 'success', content: '操作成功'});
                       }else{
                          $dialog.find('.modal-content').message({type: 'error', content: result.errorMessage});
                       }
                 });///end of $.post.done().
               
          });
    		
    	 });
	});
};//End of function viewquestion.
/**
 * 更改新闻前端显示状态。
 * @version
 	20170117nt
 		1.new.
 */
var alterquestionDisplay = function(id, display){
	//20160730pm
	var theGrid = $grid_question.getGrid();
	var items = theGrid.selectedRows();
	var curDisplay = items[0].display;
	if(display == curDisplay)  return;
	var data = [{ name: 'id', value: id},{name:"display", value: display}];
	var url = contextPath+"/Questionnaire/alterQuestionnaireDisplay.action";
	$.post(url, data).done(function(result){
    	if(result.success){
    		theGrid.refresh();//20160407pm
    		$grid_question.message({type: 'success', content: '操作成功'});
        }else{
            $grid_question.message({type: 'error', content: result.errorMessage});
        }
	});
};
</script>
</head>
<body>
<div style="width:98%;margin-right:auto; margin-left:auto; padding-top: 0px;">
<!-- search form -->
<form id="searchForm_question" target="_self" class="form-horizontal" style="display:none;">
<input type="hidden" name="page" value="0">
<input type="hidden" name="pagesize" value="10">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
          <div class="form-group">
          	<label class="control-label" style="width:100px;float:left;">标题:&nbsp;</label>
            <div style="margin-left:15px;float:left;">
            	<input name="questionTitle" class="form-control" type="text" style="width:180px;" id="questionTitleID"  />
        	</div>
          </div>
    </td>
       <td style="vertical-align: bottom;"><button id="search" type="button" style="position:relative; margin-left:35px; top: -15px" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>&nbsp;查询</button></td>
  </tr>
</table>
</form>
<!-- grid -->
<div id="divGrid_question"></div><!-- 20150817am -->
</div>
</body>
</html>