<%@ page import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.util.List,beans.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="parts/admin_authcheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="parts/admin_header.jsp" %>
<body class="skin-blue">
<%@ include file="parts/admin_body_header.jsp" %>

<div class="wrapper row-offcanvas row-offcanvas-left">
<%@ include file="parts/admin_menu.jsp" %>
<%
EmployeBean employe = (EmployeBean)request.getAttribute("employe");
String action = (String)request.getAttribute("action");
List<DepartmentBean> departmentList = (List<DepartmentBean>)request.getAttribute("departments");
List<PositionBean> positionList = (List<PositionBean>)request.getAttribute("positions");



%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
    <!-- Content Header (Page header) -->
    <section class="content-header">
<%if (action.equals("add")) {%>  
    <div class="box box-danger">
        <div class="box-header">
            <h3 class="box-title"><i class="fa fa-edit"></i>社員を追加</h3>
        </div>
    </div>
<%}else{%>
    <div class="box box-danger">
        <div class="box-header">
            <h3 class="box-title"><i class="fa fa-edit"></i>社員情報を修正</h3>
        </div>
    </div
<%}%>      
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="box box-primary" style="width:810px;">
                                <!-- form start -->
                                <form role="form" action="/wanwan/admin/employe" method="post">
<input type="hidden" name="action" value="<%=action%>" />
    <input type="hidden" name="e_id" value="<%=employe.getId()%>" />
        <div class="box-header">
            <div class="input-group" style="width:780px;">
            <span for="e_name" class="input-group-addon">名前</span>
                <input type="text" class="form-control" id="e_name" name="e_name" value="<%=employe.getJpName()%>" placeholder="名前">
                                     
            <span for="e_en_name" class="input-group-addon">名前（読み方）</span>
                 <input type="text" class="form-control" id="e_en_name" name="e_en_name" value="<%=employe.getEnName()%>" placeholder="名前（読み方）">
            </div>
        </div><!-- /.box-header -->
            <div class="box-body">

         <table class="table table-bordered ">
            <tbody>
              <tr>
                <td rowspan="5" style="width:150px;" id="faceimg">
<%String faceimg = employe.getFaceImg();
if(faceimg==null || faceimg.length()<1){%>
    <label><input type="file" id="file"></label>
<%}else{%>
    <img src="/wanwan/img/faces/<%=employe.getFaceImg()%>" width="150"/><%}%>
                </td>
     <td>
     <div class="input-group">
     <span for="e_birthday" class="input-group-addon">生年月日</span>
    <input type="text" class="form-control datepicker" id="e_birthday" name="e_birthday" value="<%=employe.getBirthday()%>" placeholder="生年月日">
     </div>
    </td>                        
            </tr>
    <tr><td>
    <div class="input-group">
        <span for="e_mail" class="input-group-addon">メール</span>
            <input type="email" class="form-control" id="e_mail" name="e_email" value="<%=employe.getEmail()%>" placeholder="メール">
    </div>
        </td></tr>
    <tr> <td>
    <div class="input-group">
    <span for="e_password" class="input-group-addon">パスワード</span>
        <input type="password" class="form-control" id="e_password" name="e_password" value="<%=employe.getPassword()%>" placeholder="Password">
    </div>
    </td></tr>
    <tr><td>
        <div class="input-group">
    <span for="e_enterdate" class="input-group-addon">入社日付</span>
    <input type="text" class="form-control datepicker" id="e_enterdate" name="e_enterdate" value="<%=employe.getEnterDate()%>"placeholder="入社日付">
        </div>
    </td></tr>
    <tr> <td>
        <div class="input-group">
    <span for="e_leavedate" class="input-group-addon">退社日付</span>
        <input type="text" class="form-control datepicker" id="e_leavedate" name="e_leavedate" value="<%=employe.getLeaveDate()%>" placeholder="退社日付">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
 <td colspan="2">
    <div class="input-group" style="width:780px;">
        <span for="e_address" class="input-group-addon">住所</span>
            <input type="text" class="form-control" id="e_address" name="e_address" value="<%=employe.getAddress()%>" placeholder="住所">
                                                        </div>
                                                    </td>
                                                </tr>
<tr><td colspan="2">
    <div class="input-group">
    <span class="input-group-addon">所属</span>
        <select class="form-control" name="e_department" style="width:120px;">
    <%for(DepartmentBean department:departmentList){
            String did = department.getId();
    %>
    <option value="<%=did%>" <%=did.equals(employe.getDepartmentId())?"selected":""%>><%=department.getName()%></option>
    <%}%>
        </select>
                                                        </div>
                                                    </td>
                                                </tr>
<tr><td colspan="2">
    <div class="input-group">
    <span class="input-group-addon">役職</span>
    <select class="form-control" name="e_position"  style="width:120px;">
    <%for(PositionBean position:positionList){
            String pid = position.getId();
     %>
        <option value="<%=pid%>" <%=pid.equals(employe.getPositionId())?"selected":""%>><%=position.getName()%></option>
        <%}%>
    </select>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
    </div><!-- /.box-body -->

        <div class="box-footer">
            <button type="submit" class="btn btn-primary">送信する</button>
            <button type="submit" class="btn btn-primary">リセット</button>
                                    </div>
                                </form>
                            </div>

    </section><!-- /.content -->
</aside><!-- /.right-side -->
</div>


<%@ include file="parts/footer.jsp" %>	

<script type="text/javascript">
$(document).ready(function(){
    
    var ajax; // 途中で停止する場合に必要。
    var ajaxSettings = {
        xhr: function() {
            var xhr = new window.XMLHttpRequest();
            // アップロードの進捗状況を取得
            xhr.upload.addEventListener("progress", function(event) {
                if (event.lengthComputable) {
                    console.log(parseInt(parseInt((event.loaded / event.total) * 100)) + '%');
                }
            }, false);
            // 中止の際に何かしたい場合
            xhr.addEventListener("abort", function(event) {
            }, false);
            
            return xhr;
        },
        type: 'post',
        url: '/wanwan/admin/upload',
        processData: false,
        contentType: false, // 送信するデータをFormDataにする場合、こうしないといけない。
        cache: false,
        dataType: 'json',
        success: function(data) {
            if (data && data.result == 'ok') {
                $("input[name='e_id']").val(data.eid);
                $("input[name='action']").val('update');
                $("#faceimg").html('<img src="/wanwan/img/faces/'+data.file+'" width="150"/>');
            } else {
                console.log('アップロード失敗');
            }
            ajax = null;
        },
        error: function(xhr, textStatus, errorThrown) {
            alert('エラー\n' + textStatus);
            ajax = null;
        }
    };
    
    // ファイルが選択されたらアップロードする。
    $('#file').bind('change', onChangeFile);

    function onChangeFile() {
        // ファイルの情報を取得
        var uploadFile = $('#file')[0].files[0];
        $('#fileInfo').html(uploadFile.name + ' サイズ:' + uploadFile.size);
        var formData = new FormData();
        formData.append("file", uploadFile);
        ajaxSettings.data = formData;
        var eid = $("input[name='e_id'").val();
        if (eid) {
            ajaxSettings.url = '/wanwan/admin/upload?eid=' + eid;
        }
        ajax = $.ajax(ajaxSettings);
    }

});    
</script>

</body>
</html>
