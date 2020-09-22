<template>
	<view class="container">
		<!-- left左侧列表 -->
		<view class="left">
			<!-- 循环遍历的 -->
			<!--  -->
			<view class="left_list activeList">
				<label for="">家用电器</label>
			</view>
			<view class="left_list">
				<label for="">手机</label>
			</view>
			<view class="left_list">
				<label for="">上衣</label>
			</view>
		</view>
		<!-- right右侧详细分类商品 -->
		<view class="right">
			<!-- 每一个小类 -->
			<view class="right_list">
				<!-- 商品 -->
				<view class="bottom">
					<view class="bottom_list">
						<view>
							<image src="@/static/classify/1.jpg" alt="">
								<span>空调</span>
						</view>
					</view>
					<view class="bottom_list">
						<view>
							<image src="@/static/classify/2.jpg" alt="">
								<span>电视</span>
						</view>
					</view>
					
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {

		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	@import url("../../common/css/classify.css");

	/* 点击左侧导航，显示动态样式 */
	.activeList {
		border-left: 6rpx solid #f26b11;
		color: #f26b11;
	}

	.bottom {
		text-align: center;
		display: flex;
		flex-direction: row;
	}
</style>
