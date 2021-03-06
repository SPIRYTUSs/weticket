<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>停车消费记录</title>
    <link rel="stylesheet" href="${base}/statics/css/bootstrap.min.css">
    <link href="${base}/statics/css/octopus/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${base}/statics/css/bootstrap-datetimepicker.min.css">
    <script src="${base}/statics/libs/jquery.min.js"></script>
    <script src="${base}/statics/plugins/layer/layer.js"></script>
    <script src="${base}/statics/plugins/layui/layui.js"></script>
    <script src="${base}/statics/js/common.js"></script>
    <script src="${base}/statics/libs/bootstrap-datetimepicker.min.js"></script>
    <script src="${base}/statics/libs/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="javascript:void(0);">业务模块</a></li>
        <li><a href="javascript:void(0);">停车消费记录</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div id="rightbody">
        <div class="tools">
            <div class="row">
                <div class="row col-xs-9">
                    <div class="col-xs-2">
                        <input type="text" class="form-control" id="plate" placeholder="车牌号">
                    </div>
                    <div class="col-xs-2">
                        <input type="text" class="form-control" id="trueName" placeholder="用户名">
                    </div>
                    <div class="col-xs-2">
                        <select class="form-control" name="status" id="status">
                            <option value=0>状态</option>
                            <option value=1>正常</option>
                            <option value=3>未支付</option>
                            <option value=2>未支付成功</option>
                            <option value=6>退单</option>
                        </select>
                    </div>
                    <div class="col-xs-3 input-append date form_datetime">
                        <input type="text" class="form-control" id="startTime" value="" readonly placeholder="开始时间"/>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                    <div class="col-xs-3 input-append date form_datetime">
                        <input type="text" class="form-control" id="endTime" value="" readonly placeholder="结束时间"/>
                        <span class="add-on"><i class="icon-th"></i></span>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="tools">
                        <ul class="toolbar">
	        		[@shiro.hasPermission name="parking:charge:list"]
                            <li class="click" onclick="queryList(null,0)"><span><img
                                    src="${base}/statics/images/octopus/find024.png"></span>查询
                            </li>
                    [/@shiro.hasPermission]
                            <li class="click" onclick="resetQuery()"><span><img
                                    src="${base}/statics/images/octopus/reset024.png"></span>重置
                            </li>
	        		[@shiro.hasPermission name="parking:charge:delete"]
                            <li class="click" onclick="del()"><span><img
                                    src="${base}/statics/images/octopus/t03.png"></span>删除
                            </li>
                    [/@shiro.hasPermission]
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <input type='hidden' value='1' id='page'/>
        <table class="tablelist">
            <thead>
            <tr>
                <th><input id="selectAll" type="checkbox"/></th>
                <th>车牌号</th>
                <th>会员名</th>
                <th>订单号</th>
                <th>消费单号</th>
                <th>消费金额</th>
                <th>状态</th>
                <th>开始时间</th>
                <th>结束时间</th>

            </tr>
            </thead>
            <tbody id="list">
            </tbody>
        </table>
        <div class="pagin">
            <div class="message">共<i class="total"></i>条记录，&nbsp&nbsp共<i class="pagetoal"></i>页&nbsp&nbsp当前显示第&nbsp;<i
                    class="page" style="margin-left:-0.1px"></i>
                页&nbsp;&nbsp;每页显示&nbsp;&nbsp;
                <select onchange="selectByLimit()" style="border:1px solid  black" id="limit">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
                条
            </div>
            <ul class="paginList" style="margin-right:300px">
            </ul>
        </div>
    </div>
</div>
<script src="${base}/statics/js/octopus/service/parking.js"></script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        linkFormat: "yyyy-mm-dd hh:ii",
        autoclose:true,
        language: 'zh-CN'
    });
</script>
</body>
</html>