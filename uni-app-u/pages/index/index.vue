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
				<!-- 循环遍历一级分类 -->
				<block v-for="(item,index) in topCates" :key="item.id">
					<view class="uni-tab-item">
						<text class="uni-tab-item-title" :class="topCatesIndex==index?' uni-tab-item-title-active':''" @click="_toProductPage(index,item.id,item.catename)">{{item.catename}}</text>
					</view>

				</block>

			</scroll-view>
		</view>
		<!-- 推荐轮播图 -->
		<view class="banner-container">
			<swiper :indicator-dots="true" :autoplay="true" :interval="2000" :duration="1000">
				<swiper-item v-for="(item,index) in banners" :key="item.id">
					<view class="swiper-item">
						<image :src="item.img" mode=""></image>
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
			<view class="FunctNavLi" @click="_goClassifyPage">
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
					<label class="LimitTime">{{ timeObj.h }}</label>
					<view class="maohao">:</view>
					<label class="LimitTime">{{ timeObj.m }}</label>
					<view class="maohao">:</view>
					<label class="LimitTime">{{ timeObj.s }}</label>
					<label class="Seckill">秒杀</label>
				</view>
				<image :src="seckill.img" class="LimitedgoodsImg" alt="">
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
				<view class="tag_list" :class="botTabIndex==0?'active_tag_list':''" @click='_changeBotIndex(0)'>
					<label for="">热门推荐</label>
				</view>
				<view class="tag_list" :class="botTabIndex==1?'active_tag_list':''" @click='_changeBotIndex(1)'>
					<label for="">最新好货</label>
				</view>
				<view class="tag_list" :class="botTabIndex==2?'active_tag_list':''" @click='_changeBotIndex(2)'>
					<label for="">所有商品</label>
				</view>
			</view>
			<!-- 标签对应的商品 -->
			<view class="tags_product">
				<block v-if="indexGoods.length>0">
					<view class="product" v-for="(item,index) in indexGoods[botTabIndex].content" :key="index">
						<view class="GoodsLeft">
							<image class="GoodsImg" :src="item.img" alt />
						</view>
						<view class="GoodsCont">
							<view class="GoodConTit">{{item.goodsname}}</view>
							<view class="GoodsPrice">￥{{item.price}}</view>
							<view class="yimai">已售50件</view>
							<view class="Immed" @click="_goProductDetailPage(item.id,item.goodsname)">立即抢购</view>
						</view>
					</view>
				</block>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				topCates: [], //存储的一级分类
				topCatesIndex: 0, //导航默认显示的选项索引
				banners: [], // 首页轮播图
				seckill:{},//秒杀活动
				timeObj:{},//倒计时的时间对象
				timer:null,//定时器
				botTabIndex: 0, //底部商品选项索引
				indexGoods: [], //首页商品
			}
		},
		mounted() {
			//获取一级分类信息
			this._getTopCates();
			// 获取轮播图
			this._getbanners();
			//获取首页默认商品列表信息
			this._getindexgoods();
		},
		onShow() {
			//获取秒杀活动
			this._getseckill();
		},
		onHide(){
			if(this.timer) clearInterval(this.timer);
		},
		methods: {
			//获取一级分类信息
			async _getTopCates() {
				let result = await this.api._getTopCates();
				// console.log(result, '一级分类');
				this.topCates = result.data.list;
			},
			//点击一级分类跳转到进入商品列表页面
			_toProductPage(index, cateid, catename) {
				// console.log(ind);//一级分类点击--下标显示
				this.topCatesIndex = index;
				uni.navigateTo({
					url: `../product/product?cateid=${cateid}&title=${catename}`,

				})
			},
			// 获取轮播图
			async _getbanners() {
				let result = await this.api._getbanners();
				// 进行赋值
				// console.log(result,'轮播图');
				result.data.list.map((item, index) => {
					item.img = this.baseUrl + item.img;

				});

				this.banners = result.data.list;
			},
			//获取秒杀活动
			async _getseckill() {
				let result = await this.api._getseckill();
				console.log(result, '秒杀');
				//处理图片
				result.data.list[0].img=this.baseUrl+result.data.list[0].img;
				this.seckill=result.data.list[0];
				this._setSeckill(this.seckill.endtime)//传入活动结束时间
			},
			// 处理倒计时
			_setSeckill(endtime){
				if(this.timer) clearInterval(this.timer);
				this.timer=setInterval(()=>{
					//倒计时时间差计算
					let t=parseInt((endtime-new Date().getTime())/1000);//s 秒
					let h,m,s;
					h=parseInt(t/3600);//小时
					m=parseInt(t%3600/60)//分钟
					s=t%60;//秒数
					//设置格式
					h=h<10?"0"+h:""+h;
					m=m<10?"0"+m:""+m;
					s=s<10?"0"+s:""+s;
					this.timeObj={h,m,s};
				},1000)
			},

			// 获取首页商品-推荐、最新上架、所有商品
			// 首页选项卡
			_changeBotIndex(index) {
				this.botTabIndex = index;
			},
			// 获取首页商品-推荐、最新上架、所有商品
			async _getindexgoods(ind) {
				let result = await this.api._getindexgoods();
				console.log(result.data.list, 'getindexgoods');

				//如果使用js处理图片地址，使用双层循环
				result.data.list.forEach((item, index) => {
					item.content.forEach((val, ind) => {
						val.img = this.baseUrl + val.img
					})
				});
				this.indexGoods = result.data.list;
			},
			//进入商品分类页
			_goClassifyPage() {
				uni.navigateTo({
					url: '../classify/classify'
				})
			},
			//首页-点击商品--进入它的详情页
			// 跳转到商品详情页面
			_goProductDetailPage(id,goodsname) {
				uni.navigateTo({
					url: `../details/details?goodsid=${id}&goodsname=${goodsname}`
				})
			}
		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	@import url("../../common/css/index.css");
</style>
