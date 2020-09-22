<template>
	<view class="container">
		<!-- 详情图片 -->
		<view class="detailImage">
			<image src="@/static/detail/1.jpg">
		</view>
		<!-- 详情基本信息 -->
		<view class="detailInfo">
			<view class="detailInfoName">
				<label>阿道夫修护滋养洗发香乳</label>
			</view>
			<view class="detailInfoPrice">
				<label style="color: red;">￥ 158</label>
				<label style="font-size: 24rpx;color: #ccc;">(此价格不与套装优惠同时享受)</label>
			</view>			
		</view>
		
		<!-- 基本信息改变 -->
		<view class="changeInfo">
			<view class="youhui">
				<view>促销：<label class="manjian">满减</label><label class="dazhe">满2件9折；3件8折</label></view>
			</view>
			<!-- 数量加减 -->
			<view class="changeNum">
				<view class="num">购买数量</view>
				<view class="action">
				  <label class="jian">-</label>
				  <label class="zhi">2</label>
				  <label class="jia">+</label>
				</view>
			</view>
			<!-- 商品属性 -->
			<view class="changeState">
				<view class="productStat">
					<label for="">商品属性</label>
				</view>
				<view class="productGuige">
					<label>规格</label>
					<view class="threed3i1">30g</view>
					<view class="threed3i2">5g</view>
				</view>
			</view>
		</view>
		<!-- 商品详情 -->
		 <view class="productDetail">
			<view class="productDetailTitle">商品详情</view>
			<!-- 需要处理图片自适应问题 -->
			<image src="@/static/detail/2.jpg" @load="autoImage" :style="{width:autoWidth+'px',height:autoHeight+'px'}" />
		</view>
		
		<view class="productEval">
			<view class="eval">商品评价</view>
			<view >
				<label class="evalUsername">小李白</label>
				<label class="evalUsertitle">交易很好，物流很快</label>					
				<view class="evalImage">
					<image src="@/static/detail/pingjia1.jpg">
					<image src="@/static/detail/pingjia2.jpg">
					<image src="@/static/detail/pingjia3.jpg">
				</view>
				<label class="evalTime">2020-02-12</label>
			</view>
		</view>
		<!-- 底部按钮 -->
		<view class="foot">
			<button class="footbtn1">加入购物车</button>
			<button class="footbtn2">立即购买</button>
		</view>
	</view>
</template>

<script>
	// 导入图片自适应工具类
	let actionimage = require('../../utils/ActionImage.js');
	export default {
		data() {
			return {
				autoHeight:'',
				autoWidth:''
			}
		},
		methods: {
			//处理图片自适应方法
			autoImage(e){
				// 调用图片自适应工具类方法，进行处理图片
				let auto  = actionimage.default(e)
				this.autoHeight = auto.autoHeight;
				this.autoWidth = auto.autoWidth;
			},
			
		},
		onLoad: function (option) {
			
		}
	}
</script>

<style>
	@import url("../../common/css/details.css");
</style>
