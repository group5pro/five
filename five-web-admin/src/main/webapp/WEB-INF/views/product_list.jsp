<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../include/left.jsp"></jsp:include>

<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
            <%--<c:if test="${baseResult.status==200}">--%>
                <%--<div class="row">--%>
                    <%--<div class="box-body">--%>
                        <%--<div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">--%>
                            <%--<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>--%>
                                <%--${baseResult.message}--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</c:if>--%>


            <!-- Small boxes (Stat box) -->
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">商品列表</h3>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="padding-left: 25px">
                                <a href="/content/form" type="button" class="btn btn-sm btn-default"><i
                                        class="fa fa-plus"></i> 新增</a>&nbsp;&nbsp;
                                <a type="button" onclick="App.deleteMuti('/content/deletemulti')" class="btn btn-sm btn-default"><i class="fa fa-trash"></i> 删除</a>&nbsp;&nbsp;
                            </div>

                        </div>
                        <!-- /.box-header -->
                        <div style="height: 20px;width: auto"></div>
                        <div class="box-body">
                            <div class="col-sm-5 form-group">
                                <label for="productName" class="col-sm-3 control-label">商品名称</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="productName" placeholder="商品名称"/>
                                </div>

                            </div>
                            <div class="col-sm-5 form-group">
                                <label for="originPrice" class="col-sm-3 control-label">商品价格</label>
                                <div class="col-sm-8">
                                    <input type="text" id="originPrice" class="form-control" placeholder="商品价格">
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

         <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box-body table-responsive no-padding">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <div class="col-xs-4">
                            <tr>
                                    <th><input type="checkbox" class="flat-red checkbox-master"></th>
                                    <th>ID</th>
                                    <th>商品名称</th>
                                    <th>商品图片</th>
                                    <th>原价</th>
                                    <th>折扣价</th>
                                    <th>评论数</th>
                                    <th>累计销量</th>
                                    <th>操作</th>
                                </tr>
                            </div>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
         </div>
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
<!-- ./wrapper -->
<!--modal-->
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">友情提醒</h4>
            </div>
            <div class="modal-body">
                <p id="model-message"></p>
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
<!--/.modal-->

    </div>
</div>








<jsp:include page="../include/jsfooter.jsp"></jsp:include>
</body>
<script>
    var url = "/product/page";
    var columns = [
        {
            "data": function (row, type, val, meta) {
                return '<input id="' + row.productId + '" type="checkbox" class="flat-red">';
            }
        },
        {"data": "productId"},
        {"data": "productName"},
        {"data": function (row, type, val, meta) {
                if(row.productPicture==null){
                    return '';
                }
                return '<a href="'+row.productPicture+'" target="_blank" >查看</a>   ';
            }
        },
        {"data": "originPrice"},
        {"data": "discountPrice"},
        {"data": "commentNum"},
        {"data":"salesNum"},
        {
            "data": function (row, type, val, meta) {
                return '<a href="/content/detail?id='+row.id+'" type="button" class="btn btn-sm btn-default">查看</a>' +
                    '<a type="button" href="/content/form?id='+row.id+'" class="btn btn-sm btn-default">编辑</a>' +
                    '<a type="button" class="btn btn-sm btn-default">删除</a>'
            }
        }
    ];
    var dt = App.datatable(url,columns);

    function mysearch(){
        var productName = $("#productName").val();
        var originPrice = $("#originPrice").val();
        var param = {
            "productName":productName,
            "originPrice":originPrice,
        };
        App.search(dt,param);
    }

</script>

</html>

