<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../include/left.jsp"></jsp:include>

<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->

    <div class="main-content">
        <c:if test="${baseResult.status==500}">
            <div class="row">
                <div class="box-body">
                    <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </div>
            </div>
        </c:if>
        <div class="row">
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"> ${tbUser.id==null?"新增":"编辑"}用户</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <%--<form class="form-horizontal" action="/user/save" method="post">--%>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Horizontal Form -->
                            <div class="box box-info">
                                <div class="box-header with-border">
                                    <h3 class="box-title"> ${product.productId==null?"新增":"编辑"}内容</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <%--<form class="form-horizontal" action="/user/save" method="post">--%>
                                <form:form cssClass="form-horizontal" action="/product/save" method="post" modelAttribute="product">
                                    <form:hidden path="productId"/>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="categoryId" class="col-sm-2 control-label">父级分类</label>
                                            <div class="col-sm-10">
                                                <form:hidden id="parentId" path="parent.productId"/>
                                                <input type="text" class="form-control" readonly="true" onclick="showModal()" id="parentName" value="${product.parent.product_name}" placeholder="请选择">
                                                    <%--   <form:input cssClass="form-control" path="categoryName" readonly="true" onclick="showModal()" placeholder="请选择"/>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productName" class="col-sm-2 control-label">商品名称</label>

                                            <div class="col-sm-10">

                                                <form:input cssClass="form-control" path="productName"
                                                            placeholder="商品名称"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="productPicture" class="col-sm-2 control-label">商品图片</label>

                                            <div class="col-sm-10">

                                                <form:input cssClass="form-control" path="productPicture"
                                                            placeholder="商品图片"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="titleDesc" class="col-sm-2 control-label">标题描述</label>

                                            <div class="col-sm-10">

                                                <form:input cssClass="form-control" path="titleDesc"
                                                            placeholder="标题描述"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="url" class="col-sm-2 control-label">链接</label>

                                            <div class="col-sm-10">

                                                <form:input cssClass="form-control" path="url" placeholder="链接"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pic" class="col-sm-2 control-label">图片1</label>

                                            <div class="col-sm-10">

                                                <form:input cssClass="form-control" path="pic" placeholder="图片1"/>
                                                <div id="dropz" style="border: 2px dashed #0087F7;"
                                                     class="dropzone"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pic2" class="col-sm-2 control-label">图片2</label>

                                            <div class="col-sm-10">
                                                <form:input cssClass="form-control" path="pic2" placeholder="图片2"/>
                                                <div id="dropz2" style="border: 2px dashed #0087F7;"
                                                     class="dropzone"></div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="content" class="col-sm-2 control-label">详情</label>

                                            <div class="col-sm-10">
                                                <div id="editor">
                                                        ${tbContent.content}
                                                </div>
                                                <form:hidden cssClass="form-control" path="content" placeholder="详情"/>
                                            </div>
                                        </div>


                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer">
                                        <button type="button" onclick="history.go(-1)" class="btn btn-default">返回
                                        </button>
                                        <button type="submit" onclick="save()" class="btn btn-info pull-right">提交
                                        </button>


                                    </div>
                                    <!-- /.box-footer -->
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (main row) -->

                    </section>
                    <!-- /.content -->
                </div>

            </div>
        </div>
        <!-- Add the sidebar's background. This div must be placed
        immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
</div>
<jsp:include page="../include/jsfooter.jsp"></jsp:include>
<!-- ./wrapper -->
<script src="/static/assets/plugins/jquery-ztree/js/jquery.ztree.core-3.5.js"></script>
<script src="/static/assets/plugins/dropzone/min/dropzone.min.js"></script>
<script src="/static/assets/plugins/wangEditor/wangEditor.min.js"></script>
<script>

    var setting = {
        view: {
            selectedMulti: false
        },

        async: {
            enable: true,
            url: "/product/category/detail",
            autoParam: ["productId"]
        }
    };


    function showModal() {
        $("#modal-title").html("选择分类");
        $("#modal-detail").html('<ul id="treeDemo" class="ztree"></ul>');
        $.fn.zTree.init($("#treeDemo"), setting);

        $("#modal-user").modal("show");
    }

    function modalClick() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        nodes = zTree.getSelectedNodes();
        if (nodes.length == 0) {
            alert("请选择一个分类");
        } else {
            $("#parentId").val(nodes[0].id)
            $("#parentName").val(nodes[0].name);
            $("#modal-user").modal("hide");
        }

    }

    var myDropzone = new Dropzone("#dropz", {
        url: "/upload",
        dictDefaultMessage: '拖动文件至此或者点击上传',
        paramName: "dropFile",
        init: function () {
            this.on("success", function (file, data) {
                // 上传成功触发的事件
                //将图片路径显示在表单中
                $("#pic").val(data.filename);

            });
        }
    });


    var myDropzone = new Dropzone("#dropz2", {
        url: "/upload",
        dictDefaultMessage: '拖动文件至此或者点击上传',
        paramName: "dropFile",
        init: function () {
            this.on("success", function (file, data) {
                // 上传成功触发的事件
                //将图片路径显示在表单中
                $("#pic2").val(data.filename);

            });
        }
    });
    var E = window.wangEditor
    var editor = new E('#editor')

    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '/upload';
    //配置文件对象名
    editor.customConfig.uploadFileName = 'editorFile';


    editor.create()


    function save() {
        $("#content").val(editor.txt.html());
    }


</script>

</body>
</html>
