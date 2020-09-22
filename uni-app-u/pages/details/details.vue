<template>
	<view class="container">
		<!-- 详情图片 -->
		<view class="detailImage">
			<image :src="goods.img">
		</view>
		<!-- 详情基本信息 -->
		<view class="detailInfo">
			<view class="detailInfoName">
				<label>{{goods.goodsname}}</label>
			</view>
			<view class="detailInfoPrice">
				<label style="color: red;">￥{{goods.price}}</label>
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
					<label class="jian" @click="desc">-</label>
					<label class="zhi">{{ num }}</label>
					<label class="jia" @click="asc">+</label>
				</view>
			</view>
			<!-- 商品属性 -->
			<view class="changeState">
				<view class="productStat">
					<label for="">商品属性</label>
				</view>
				<view class="productGuige">
					<label>{{goods.specsname}}</label>
					<view class="threed3i1" v-for="(item,index) in goods.specsattr" :key="index">{{item}}</view>

				</view>
			</view>
		</view>
		<!-- 商品详情 -->
		<view class="productDetail">
			<view class="productDetailTitle">商品详情</view>
			<!-- 需要处理图片自适应问题 -->
			<rich-text :nodes="goods.description"></rich-text>
		</view>

		<view class="productEval">
			<view class="eval">商品评价</view>
			<view>
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
			<button class="footbtn1" @click="_cartAdd">加入购物车</button>
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
				autoHeight: '',
				autoWidth: '',
				goods: {}, //获取最终商品的信息
				num: 1 //默认的购买数量
			}
		},
		onLoad: function(options) {

			console.log(options, 'options');
			let {
				goodsid,
				goodsname
			} = options;
			uni.setNavigationBarTitle({
				title: goodsname,
			})

			this.goodsid = goodsid;
			this.goodsname = goodsname;
			this._getGoodsinfo();

		},
		methods: {
			//处理图片自适应方法
			autoImage(e) {
				// 调用图片自适应工具类方法，进行处理图片
				let auto = actionimage.default(e)
				this.autoHeight = auto.autoHeight;
				this.autoWidth = auto.autoWidth;
			},
			//获取商品详细信息
			async _getGoodsinfo() {
				let result = await this.api._getgoodsinfo({
					id: this.goodsid
				});
				console.log(result, 'getgoodsinfo');
				let goods = result.data.list[0]; //获取最终的信息；
				goods.img = this.baseUrl + goods.img;
				goods.specsattr = goods.specsattr.split(',');
				console.log(goods.specsattr, 'goods.specsattr');
				this.goods = goods;
			},
			//数量的  +  -
			asc() {
				this.num++;
				if (this.num >= 100) {
					//添加的数量大于库存
					this.num = 100;
				}
			},
			desc() {
				this.num--;
				if (this.num <= 0) {
					this.num = 1;
				}
			},
			//购物车添加
			async _cartAdd() {
				/*
				，必填项
				goodsid商品编号，必填项
				num数量，必填项
				checked是否选中，必填项 ，默认1 选中  0 不选中
				authorization header头中需要添加token后台验证条件								
				*/
				let uid = uni.getStorageSync('uid'); //uid用户编号
				let goodsid = this.goodsid; //goodsid商品编号
				let num = this.num; //num数量
				let checked = 1; //  选中状态   0  非选中状态
				let authorization = uni.getStorageSync('token'); // 用来检测是否登录的
				//执行添加
				let result = await this.api._cartAdd({
					uid,
					goodsid,
					num,
					checked
				}, {
					authorization
				})
				console.log(result, 'cartadd');
				//发送添加购物车请求失败
				if (result.data.code == 500) {
					uni.showToast({
						title: '登录已过期',
						icon: 'none'
					})
					setTimeout(() => {
						uni.navigateTo({
							url: '../send/send'
						})
					}, 1500)
				} else {
					//插入成功 （跳转到购物车页面）
					uni.showToast({
						title: '添加成功',
					})
					setTimeout(() => {
						uni.switchTab({
							url: "../cart/cart"
						})
					}, 1500)
				}
			}
		},


	}
</script>

<style>
	@import url("../../common/css/details.css");
</style>
