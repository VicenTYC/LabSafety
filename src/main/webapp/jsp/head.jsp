<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="./Resource/css/index_shouye.css">
<link rel="stylesheet" type="text/css" href="./Resource/css/layui.css">
<link href="./Resource/css/main.css" rel="stylesheet" />

<script src="./Resource/js/layui.js" charset="utf-8"></script>
<script>
	layui.use('element', function() {
		var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

		//触发事件
		var active = {
			tabAdd : function() {
				//新增一个Tab项
				element.tabAdd('demo', {
					title : '新选项' + (Math.random() * 1000 | 0) //用于演示
					,
					content : '内容' + (Math.random() * 1000 | 0),
					id : new Date().getTime()
				//实际使用一般是规定好的id，这里以时间戳模拟下
				})
			},
			tabDelete : function(othis) {
				//删除指定Tab项
				element.tabDelete('demo', '44'); //删除：“商品管理”

				othis.addClass('layui-btn-disabled');
			},
			tabChange : function() {
				//切换到指定Tab项
				element.tabChange('demo', '22'); //切换到：用户管理
			}
		};

		$('.site-demo-active').on('click', function() {
			var othis = $(this), type = othis.data('type');
			active[type] ? active[type].call(this, othis) : '';
		});

		//Hash地址的定位
		var layid = location.hash.replace(/^#test=/, '');
		element.tabChange('test', layid);

		element.on('tab(test)', function(elem) {
			location.hash = 'test=' + $(this).attr('lay-id');
		});

	});
</script>
<style type="text/css">
body {
	margin: 0 auto;
}
</style>


