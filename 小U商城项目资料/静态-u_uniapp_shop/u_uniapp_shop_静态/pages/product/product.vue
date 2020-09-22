<template>
	<view>
		<view class="search">
			<icon type="search" color="white" size="10"></icon>
			<input type="text" value="" placeholder="搜索商品" placeholder-class="placeholder"/>
		</view>
		<view class="list" v-if="true">
			<view class="row" >
			<!-- <view class="row"> -->
				<image src="@/static/index/goods.jpg" mode="widthFix"></image>
				<view class="info">
					<text>阿道夫修护滋养洗发香乳</text>	
					<text>￥158</text>	
					<text>3565评论</text>	
				</view>
			</view>
		</view>
		<view class="tishi" v-else>
			没有数据亲！
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
		
	}
}
</script>

<style>
	.search{
		margin: 50rpx;
		height: 80rpx;
		background-color: #f26b11;
		border-radius: 80rpx;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	icon{
		margin:0 10rpx 0 250rpx;
	}
	.placeholder{
		color: white;
		font-size: 25rpx;
	}
	.row{
		position: relative;
		margin: 10rpx 20rpx;
		height: 330rpx;
		border-bottom: 1rpx solid #AAAAAA;
	}
	image{
		position: absolute;
		top: 0;
		left:10rpx;
		width: 160rpx;
	}
	.info{
		height: 85%;
		width: 100%;
		position: absolute;
		top: 0;
		left: 200rpx;
		display: flex;
		justify-content: space-around;
		flex-direction: column;
		font-size: 25rpx;
	}
	.info text:nth-of-type(2){
		color: red;
	}
	.info text:nth-of-type(3){
		font-size: 20rpx;
		color: #AAAAAA;
	}
	.tishi{
		line-height: 200rpx;
		text-align: center;
		font-size: 40rpx;
		color: #006699;
	}
</style>
