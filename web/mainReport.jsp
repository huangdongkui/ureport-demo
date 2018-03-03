<%@page import="com.bstek.ureport.export.html.HtmlReport"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bstek.ureport.export.ExportManager"%>
<%@page import="com.bstek.ureport.Utils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HTML报表测试</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<!-- Latest compiled and minified Locales -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

<script type="text/javascript">
 $(function(){
	//$("table").addClass("table-bordered table-condensed table");
	$("table").removeAttr("border");
	$("table").removeAttr("style");
	$("table").addClass("table-bordered table-condensed table table-hover table-striped");
	$("table").attr("data-toggle","table");
	$("table tr:first").css("font-weight","bold");
}); 
</script>
</head>
<body>
<!-- 通过一个HTML链接来导出目标报表模版的PDF格式报表 -->
<a href="<%=request.getContextPath() %>/ureport/pdf?_u=file:sysfunc.ureport.xml">导出PDF格式报表</a>
<p></p>
<% 
ExportManager  exportManager=(ExportManager)Utils.getApplicationContext().getBean(ExportManager.BEAN_ID);
Map<String,Object> parameters=new HashMap<String,Object>();
HtmlReport htmlReport = exportManager.exportHtml("file:sysfunc.ureport.xml",request.getContextPath(),parameters);
//输出Css样式
/*  out.println("<style type=\"text/css\">");
out.println(htmlReport.getStyle());
out.println("</style>"); 
//输出报表内容 */
out.println(htmlReport.getContent());
%>

</body>
</html>