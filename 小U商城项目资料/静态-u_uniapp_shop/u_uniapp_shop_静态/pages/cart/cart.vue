<template>
	<view class="container">
		<view class="top">
			<scroll-view class="scroll-view_H" scroll-x="true" >
				<view class="cartInfo">
					<view class="cartInfochild">
						<!-- 选择框 -->
						<view class="cartInfo_switch common">
							<!-- 点击当前商品 -->
							 <switch  type="checkbox" />
						</view>
						<!-- 图片 -->
						<view class="cartInfo_image common">
							<image src="@/static/index/goods.jpg" mode=""></image>
						</view>
						
						<!-- 信息 -->
						<view class="cartInfo_info">
							<label for="" style="font-size: 26rpx;">阿道夫修护滋养洗发香乳</label>
							<label for="" style="font-size: 24rpx; color: #ccc;">规格：白色</label>
							<label for="" style="color: red;">￥158</label>
						</view>
						<!-- 加减数量 -->
						<view class="cartInfo_num">
							<view class="cartInfo_num_child">
								<label for="">-</label>
								<label for="">2</label>
								<label for="">+</label>
							</view>						
						</view>
					</view>
					
				</view>
				<view class="cartDel">
					<label for="">删除</label>
				</view>			
			</scroll-view>
			
			<scroll-view class="scroll-view_H" scroll-x="true" >
				<view class="cartInfo">
					<view class="cartInfochild">
						<!-- 选择框 -->
						<view class="cartInfo_switch common">
							<!-- 点击当前商品 -->
							 <switch  type="checkbox" />
						</view>
						<!-- 图片 -->
						<view class="cartInfo_image common">
							<image src="@/static/index/goods.jpg" mode=""></image>
						</view>
						
						<!-- 信息 -->
						<view class="cartInfo_info">
							<label for="" style="font-size: 26rpx;">阿道夫修护滋养洗发香乳</label>
							<label for="" style="font-size: 24rpx; color: #ccc;">规格：白色</label>
							<label for="" style="color: red;">￥158</label>
						</view>
						<!-- 加减数量 -->
						<view class="cartInfo_num">
							<view class="cartInfo_num_child">
								<label for="">-</label>
								<label for="">2</label>
								<label for="">+</label>
							</view>						
						</view>
					</view>
					
				</view>
				<view class="cartDel">
					<label for="">删除</label>
				</view>			
			</scroll-view>
			
		</view>
		
		<!-- 底部 -->
		<view class="foot">
			<view class="footd1">
				<switch  type="checkbox" />
				<label>全选</label>
			</view>
			<view class="footd2">
				<view class="footd2sp1">总计：<label style="color: red;">253</label></view>
				<label class="footd2sp2">不含运费，已优惠￥0.00</label>
			</view>
			<!-- 跳到提交订单，结算页面 -->
			<view class="footd3" @click="confirm">
				<!-- 被选中的商品的个数 -->
				<label>去结算(3件)</label>
			</view>
		</view>
		
	</view>
</template>

<script>
	export default {
		data(){
			return {
				
			}
		},
		methods:{
			
		},
	}
</script>

<style>
	@import url("../../common/css/cart.css");

	.cartInfo_image_img{
		width: 120rpx;
		height: 120rpx;
	}
	.foot{
		bottom: var(--window-bottom)
	}
</style>
