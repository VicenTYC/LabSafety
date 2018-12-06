	//考试结束跳转时间
	var time=3;
	function settimes(){
		time=time-1;
		// console.log(time);
		if(time<=0){
			self.location.href="getIndex.do"	
		}else{
		}
	}
	function tiaozhuan(){
		setInterval(function(){
				if(time>0){
				settimes();
				}
			}, 1000);	
		};
		
	function test(){
		layui.use('layer', function(){
	
		 layer = layui.layer;
		 layer.open({
		        type: 1
		        ,title: false // 不显示标题栏
		        ,closeBtn: false
		        ,area: '300px;'
		        ,shade: 0.8
		        ,id: 'LAY_layuipro' // 设定一个id，防止重复弹出
		        ,btn: []
		        ,btnAlign: 'c'
		        ,moveType: 1 // 拖拽模式，0或者1
		        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">考试已经结束请离开考场 ^_^</div>'
		        ,success: function(layero){
		        	tiaozhuan();
		        }
		      });    
	});
	
	}
		window.jQuery(function($) {
			"use strict";

			$('time').countDown({
				with_separators : false
			});
			$('.alt-1').countDown({
				css_class : 'countdown-alt-1'
			});
			$('.alt-2').countDown({
				css_class : 'countdown-alt-2'
			});

		});

		$(function() {
			$('li.option label').click(
					function() {
//						debugger;
						var examId = $(this).closest('.test_content_nr_main')
								.closest('li').attr('id'); // 得到题目ID
						
						var liId = 'a[href="#' + examId + '"]';						
						var cardLi = $(liId); // 根据题目ID找到对应答题卡						
						// 设置已答题
						if (!cardLi.hasClass('hasBeenAnswer')) {
							cardLi.addClass('hasBeenAnswer');
						}

					});
		});