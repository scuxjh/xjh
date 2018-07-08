<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
.arc_info {
    border-top: 1px dashed #D8D8D8;
    border-bottom: 1px dashed #D8D8D8;
    line-height: 25px;
    color: #333333;
    margin:10px 25px auto;
    text-align: center;
    font-size: 13px;
    width:600px;/*定宽*/
}</style>
<div class="modal-body" style="padding-left:45px; padding-right:65px;padding-top:10px;">
	<form class="form-horizontal page_form">
    	<h2 style="margin-top:-10px;text-align:center"><input type="text" class="form-control" id="feedTitleID" name="feedTitle" value=" " ></h2>
		<h1 style="margin-top:-10px;"></h1>
		<!-- 第2行 -->
		
			<div class="arc_info">
			<label >反馈类别:</label>
                <div class="btn-group select" id="categoryIdID" selectKey="feed.CATEGORY" ></div>
                        <input type="hidden" id="categoryIdID" name="categoryId" dataType="Require" />
               <label >发布时间:</label>
					<input type="text"  name="startTime" id="startTimeID" size="16" value="" >
					
          </div>
                    
                    <!-- 第3行 -->
                    <div class="form-group">
                    	<div class="row">
                    	<label class="col-md-2 control-label" for="name"></label>
                        	<div class="col-md-10">
                            	<textarea class="form-control" name="content" id="contentID" rows="5" value="" placeholder="新闻内容" dataType="Require"></textarea>
                            	<span class="required">*</span>
                            	<!--   <textarea class="form-control" name="content" id="contentID" rows="5" value="" placeholder="反馈内容" style="display:none;"></textarea>-->
                            	<!-- <span class="required">*</span>-->
                            	<!-- 加载summernote组件的Div，name和id必须为“summernoteDiv” 20170910pm -->
                            	<!--  <div name="summernoteDiv" id="summernoteDiv"></div>-->
                            	
                        	</div>
                    	</div>
                    </div>
                   
                    <!-- 第4行 -->
                    <div class="form-group">
        	         <div class="row">
                <div class="col-md-10" style="text-align:center;">
                	<input type="button" name="commentbutton" id="commentbuttonId" value="献策" >
                	
                    
				</div>
            </div>
		</div>
		<div class="commentcontent"hidden="hidden" style="text-align:center;">
		<span><b>姓名：</b></span>&nbsp&nbsp<input class="commit" type="text" name="commenterName" id="commenterNameId" placeholder="填写您的姓名">&nbsp&nbsp&nbsp&nbsp<span><b>电话：<b>&nbsp&nbsp</span><input class="commit"  type="text" name="commenterTel" id="commenterTelId" placeholder="填写您的电话"><br>
             <br> <textarea class="commit" id="feedContentID" name="feedContent" rows="8" value="" cols="45" placeholder="填写您宝贵的建议"></textarea><br>
               <input type="button" name="commentcommit" id="commentcommitId" value="提交" >  
              </div>   
                </form>
            </div><!-- End of model-body. -->