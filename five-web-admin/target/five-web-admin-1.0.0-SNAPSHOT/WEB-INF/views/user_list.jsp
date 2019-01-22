<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../include/left.jsp"></jsp:include>

<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <!-- /.row -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">用户列表</h3>
                        <c:if test="${baseResult!=null}">

                            <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                    &times;
                                </button>
                                    ${baseResult.message}
                            </div>

                        </c:if>


                        <div class="row" style="padding-left: 15px;padding-top: 5px">
                            <a type="button" href="/user/form" class="btn btn-sm btn-default"><i
                                    class="fa fa-plus"></i> 新建</a>&nbsp;&nbsp;
                            <a type="button" onclick="App.deleteMuti('/user/deleteMuti')"
                               class="btn btn-sm btn-default"><i class="fa fa-trash"></i> 删除</a>&nbsp;&nbsp;

                        </div>

                    </div>

                    <div style="height: 20px;width: auto"></div>

                    <div class="box-body">
                        <div class="col-sm-4 form-group">
                            <label for="username" class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-6">
                                <input id="username" placeholder="姓名"/>
                            </div>

                        </div>
                        <div class="col-sm-3 form-group">
                            <label for="phone" class="col-sm-3 control-label">电话</label>
                            <div class="col-sm-6">
                                <input id="phone" placeholder="电话"/>
                            </div>
                        </div>
                        <div class="col-sm-4 form-group">
                            <label for="email" class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-6">
                                <input id="email" placeholder="邮箱"/>
                            </div>
                        </div>
                        <div class="box-tools">
                            <button type="button" onclick="mysearch()" class="btn  btn-primary btn-sm">搜索</button>
                        </div>
                    </div>


                </div>
                <!-- /.box -->
            </div>
        </div>
        <div class="row">


            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
                <table id="dataTable" class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" class="flat-red checkbox-master"/>
                        </th>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>手机号码</th>
                        <th>更新时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>

                </table>
            </div>
            <!-- /.box-body -->
        </div>


        <!-- end div class="wrapper"-->
        <!-- modals -->
        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">温馨提示</h4>
                    </div>
                    <div class="modal-body">
                        <p></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                        <button type="button" onclick="App.btnClick()" class="btn btn-primary">确定</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

    </div>
</div>
<!--modal-->
<div class="modal fade" id="modal-user">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-title">用户详情</h4>
            </div>
            <div class="modal-body">
                <p id="modal-detail"></p>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="modalClick()"  data-dismiss="modal" class="btn btn-primary">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--/.modal-->

<jsp:include page="../include/jsfooter.jsp"></jsp:include>
</body>
<script src="/static/assets/js/datetime.js"></script>
<script>

    var url = "/user/page";

    var columns = [
        {
            "data": function (row, type, val, meta) {
                return '<input id=\"' + row.id + '\" type=\"checkbox\" class=\"flat-red\" />'
            }
        },
        {"data": "id"},
        {"data": "username"},
        {"data": "email"},
        {"data": "phone"},
        {
            "data": function (row, type, val, meta) {
                return DateTime.format(row.created, "yyyy-MM-dd HH:mm:ss");
            }
        },
        {
            "data": function (row, type, val, meta) {
                return DateTime.format(row.updated, "yyyy-MM-dd HH:mm:ss");
            }
        },
        {
            "data": function (row, type, val, meta) {
                return '<button type="button" onclick="App.showDetail(\'/user/detail?id=' + row.id + '\')" class="btn btn-sm btn-default">查看</button>' +
                    '<a type="button" href="/user/form?id=' + row.id + '" class="btn btn-sm btn-default">编辑</a>' +
                    '<a type="button" onclick="App.deletesingle(' + row.id + ')" class="btn btn-sm btn-default">删除</a>';
            }
        }
    ];

    var dt = App.datatable(url, columns);


    function mysearch() {
        var username = $("#username").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var param = {
            "username": username,
            "email": email,
            "phone": phone
        };
        App.search(dt, param);
    }


</script>
</html>

