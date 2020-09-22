<template>
	<view class="">
		<!-- 顶部信息 -->
		<view class="HomeTop">
			<view class="logoView">
				<!-- logo -->
				<img class="logo" src="/static/index/logo.jpg" alt="" />
			</view>
			<view class="inputView">
				<input class="textinput" style="text-align: center;" type="text" value="" placeholder="寻找商品" />
			</view>
		</view>

		<!-- 顶部导航  scroll-view -->

		<view class="tabs">
			<scroll-view id="tab-bar" class="scroll-h" scroll-x="{true}">
				<view class="uni-tab-item">
					<text class="uni-tab-item-title uni-tab-item-title-active">推荐</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">推荐</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">鞋包</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">居家</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">母婴儿童</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">美食</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">男装</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">电脑</text>
				</view>
				<view class="uni-tab-item">
					<text class="uni-tab-item-title">内衣</text>
				</view>
			</scroll-view>
		</view>
		<!-- 推荐轮播图 -->
		<view class="banner-container">
			<swiper :indicator-dots="true" :autoplay="true" :interval="2000" :duration="1000">
				<swiper-item>
					<view class="swiper-item">
						<image src="@/static/index/swiper.jpg" mode=""></image>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="swiper-item">
						<image src="@/static/index/swiper.jpg" mode=""></image>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="swiper-item">
						<image src="@/static/index/swiper.jpg" mode=""></image>
					</view>
				</swiper-item>

			</swiper>
		</view>

		<!-- 功能导航开始 -->
		<!-- 功能导航 -->
		<view class="FunctNavCon">
			<view class="FunctNavLi">
				<image src="@/static/index/xiaohuoban.png" alt class="FunImg" />
				<p>限时抢购</p>
			</view>
			<view class="FunctNavLi">
				<image src="@/static/index/jifentixicopy.png" alt class="FunImg" />
				<p>积分商城</p>
			</view>
			<view class="FunctNavLi">
				<image src="@/static/index/lianxiwomen.png" alt class="FunImg" />
				<p>联系我们</p>
			</view>
			<view class="FunctNavLi">
				<image src="@/static/index/-shangpinfenlei-gai.png" alt class="FunImg" />
				<p>商品分类</p>
			</view>
		</view>

		<!-- 推荐部分 未写 -->
		<view class="HotGoods">
			<!-- 热推左侧 -->
			<view class="HotLeft">
				<view class="LimitedContent">
					<image class="LimitedImg" src="@/static/index/xianshi.jpg" alt />
					<label class="Limited">限时秒杀</label>
				</view>
				<p class="LimitedTitle">每天零点场，好货秒不停</p>
				<!-- 倒计时 -->
				<view class="LimitTimeAll">
					<label class="LimitTime">02</label>
					<view class="maohao">:</view>
					<label class="LimitTime">16</label>
					<view class="maohao">:</view>
					<label class="LimitTime">45</label>
					<label class="Seckill">秒杀</label>
				</view>
				<image src="@/static/index/goods.jpg" class="LimitedgoodsImg" alt="">
			</view>

			<!-- 热推右侧 -->
			<view class="HotRight">
				<!-- 右侧顶部部分 -->
				<view class="HotTop">
					<view class="HomeTopInfo">
						<view class="HomeTopInfoOne">
							<label class="BrandNew">品牌上新</label>
							<label class="Discount">折</label>
						</view>
						<view class="HomeTopRobbig">
							<label>每日九点，抢大牌</label>
						</view>
					</view>
					<!-- <div> -->
					<view class="Cloth">
						<image src="@/static/index/goods1.jpg" alt="">
					</view>

					<!-- </div> -->
				</view>
				<!-- 右侧底部 -->
				<view class="HotBottom">
					<view class="HotBottomLeft">
						<view class="HotBottomLeftInfo">
							<label class="HotBottomLeftInfoTitle">每日十件</label>
							<label class="HotBottomLeftInfoDetail">只为你选好货</label>
						</view>
						<view class="HotBottomLeftImage">
							<image src="@/static/index/goods1.jpg" mode=""></image>
						</view>
					</view>
					<view class="HotBottomRight">
						<view class="HotBottomRightInfo">
							<label class="HotBottomRightInfoTitle">每日十件</label>
							<label class="HotBottomRightInfoDetail">只为你选好货</label>
						</view>
						<view class="HotBottomRightImage">
							<image src="@/static/index/goods1.jpg" mode=""></image>
						</view>
					</view>
				</view>
			</view>
		</view>
		<!-- 轮播图2 -->
		<div class="Swiper2">
			<image class="Swiper2Img" src="@/static/index/swiper.jpg" alt />
		</div>

		<!-- 底部商品列表 -->
		<view class="products">
			<!-- 商品标签 -->
			<view class="tags">
				<view class="tag_list active_tag_list">
					<label for="">热门推荐</label>
				</view>
				<view class="tag_list">
					<label for="">最新好货</label>
				</view>
				<view class="tag_list">
					<label for="">所有商品</label>
				</view>
			</view>
			<!-- 标签对应的商品 -->
			<view class="tags_product">
				<view class="product">
					<view class="GoodsLeft">
						<image class="GoodsImg" src="@/static/index/goods.jpg" alt />
					</view>
					<view class="GoodsCont">
						<view class="GoodConTit">1阿道夫修护滋养洗发香乳</view>
						<view class="GoodsPrice">￥200</view>
						<view class="yimai">已售50件</view>
						<view class="Immed">立即抢购</view>
					</view>
				</view>
				<view class="product">
					<view class="GoodsLeft">
						<image class="GoodsImg" src="@/static/index/goods.jpg" alt />
					</view>
					<view class="GoodsCont">
						<view class="GoodConTit">1阿道夫修护滋养洗发香乳</view>
						<view class="GoodsPrice">￥200</view>
						<view class="yimai">已售50件</view>
						<view class="Immed">立即抢购</view>
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
		onLoad() {

		},
		methods: {

		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	@import url("../../common/css/index.css");
</style>
