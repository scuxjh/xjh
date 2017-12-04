<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="modal-body" style="padding-left:45px; padding-right:65px;padding-top:10px;">
	<form class="form-horizontal page_form">
    	<div class="form-group">
        	<div class="row">
            	<label class="col-md-2 control-label" for="name">反馈标题:</label>
                <div class="col-md-10">
                	<input type="text" class="form-control" id="feedTitleID" name="feedTitle" value="" dataType="Require" placeholder="反馈标题"><span class="required">*</span>
                    <input type="hidden" id="idID" name="id" />
				</div>
            </div>
		</div>
		<!-- 第2行 -->
		<div class="form-group">
			<div class="row">
			<label class="col-md-2 control-label" for="name">反馈类别:</label>
                <div class="col-md-4">
					<div class="input-group" style="width:100%;">
                    	<div class="btn-group select" id="categoryIdID" selectKey="feed.CATEGORY" ></div>
                        <input type="hidden" id="categoryIdID" name="categoryId" dataType="Require" />
                        <span class="required">*</span>
                    </div>
                </div>
         
                    	<label class="col-md-2 control-label" for="name">发布时间:</label>
            <div class="col-md-4">
				<div class="input-group date form_datetime">
					<input type="text" class="form-control" name="startTime" id="startTimeID" size="16" value="" style="width:100%;">
					<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
				</div>
            </div>
                           
		</div>
		</div>
                    
                    <!-- 第3行 -->
                    <div class="form-group">
                    	<div class="row">
                    	<label class="col-md-2 control-label" for="name">反馈内容:</label>
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
                <div class="col-md-10">
                	<input type="button" name="commentbutton" id="commentbuttonId" value="献策" >
                	
                    
				</div>
            </div>
		</div>
		<div class="commentcontent"hidden="hidden">
		<span>姓名：</span>&nbsp&nbsp<input type=text"name="commentname" id="commentnameId">&nbsp&nbsp&nbsp&nbsp<span>电话：&nbsp&nbsp</span><input type=text"name="commenttel" id="commenttelId"><br>
             <br> <textarea class="form-control" id="feedcommentID" name="feedComment" rows="8" value="" placeholder="填写您宝贵的建议"></textarea><br>
               <input type="button" name="commentcommit" id="commentcommitId" value="提交" >  
              </div>   
                </form>
            </div><!-- End of model-body. -->