<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- name与id属性的值与questionnaire字段相对应 -->


<style type="text/css">         
.tb960x90 {display:none!important;display:none}

.arc_info {
    border-top: 1px dashed #D8D8D8;
    border-bottom: 1px dashed #D8D8D8;
    line-height: 25px;
    color: #333333;
    margin: 1px 25px auto;
    text-align: center;
    font-size: 14px;
    width: 600px;
}
</style>



<div class="modal-body" style="padding-left:45px; padding-right:65px;padding-top:10px;">
	<form class="form-horizontal page_form">
    	<div class="form-group">
        	<div class="row">
        	<h2 style="margin-top:-10px;text-align:center">
            	<div class="col-md-10">
                	<input type="text" class="form-control" id="questionnaireTitleID" name="questionnaireTitle" value="" dataType="Require" placeholder="问卷标题"><span class="required">*</span>
                    <input type="hidden" id="idID" name="id" />
				</div>
				</h2>
            </div>
		</div>
		<!-- 第2行 -->
			<div class="arc_info">
			<label>问卷类别:	</label>
                    	<div class="btn-group select" id="categoryIdID" selectKey="questionnaire.CATEGORY" ></div>
                        <input type="hidden" id="categoryIdID" name="categoryId" dataType="Require" />
                        <span class="required">*</span>
                    
                
               <label >发布时间:</label>
					<input type="text" class="form-control" name="startTime" id="startTimeID" size="16" value="" style="width:100%;"/>
				
            </div>
                    <!-- 第3行 -->
                    
                    <div class="form-group">
                    	<div class="row">
                    	<label class="col-md-2 control-label" for="name"></label>
                        	<div class="col-md-10">
                            	
                            	<!-- 加载summernote组件的Div，name和id必须为“summernoteDiv” 20170910pm -->
                            	<!--题目显示区域---------------------------------------------------------------------------------------------------------------------------------------->
                                 <div class=" all_660">
                                  <div class="yd_box">
                                   </div>
                                    </div>
                                     <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
  
  <div class="xxk_box" >
    <ul class="xxk_title">
      <li class="on">单选</li>
      <li>多选</li>
      <li>填空</li>
    </ul>
    <div class="xxk_conn"> 
      <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box dxuan " id="jsd">
        <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_dx"    onblur="if(!this.value)this.value='单选题目'" onclick="if(this.value&&this.value=='单选题目' )  this.value=''"></textarea>
        <div class="title_itram" id="text">
          <div class="kzjxx_iteam" >
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
          <div class="kzjxx_iteam">
            <input name="" type="radio" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
        </div>
        <a href="javascript:void(0)" class="zjxx">增加选项</a> 
        
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
      
      <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box duoxuan ">
        <textarea name="" cols="" rows=""  class="input_wenbk btwen_text btwen_text_duox"    onblur="if(!this.value)this.value='多选题目'" onclick="if(this.value&&this.value=='多选题目' )  this.value=''"></textarea>
        <div class="title_itram">
          <div class="kzjxx_iteam">
            <input name="" type="checkbox" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
            <a href="javascript:void(0);" class="del_xm">删除</a> </div>
          <div class="kzjxx_iteam">
            <input name="" type="checkbox" value="" class="dxk">
            <input name="" type="text" class="input_wenbk" value="选项" onblur="if(!this.value)this.value='选项'" onclick="if(this.value&&this.value=='选项' )  this.value=''">
           <a href="javascript:void(0);" class="del_xm">删除</a> </div>
        </div>
        <a href="javascript:void(0)" class="zjxx">增加选项</a> 
        
        <!--完成编辑-->
       <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
      
      <!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
      <div class="xxk_xzqh_box tktm ">
        <textarea name=""  cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" onblur="if(!this.value)this.value='填空题目'" onclick="if(this.value&&this.value=='填空题目' )  this.value=''"></textarea>
          
        <!--完成编辑-->
        <div class="bjqxwc_box"> <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but" > 完成编辑</a> </div>
      </div>
     </div>
  </div>
</div>

                                    
                        	</div>
                    	</div>
                    </div>
                 </form>
            </div><!-- End of model-body. -->
  
  
 