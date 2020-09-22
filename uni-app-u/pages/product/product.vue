<template>
	<view>
		<view class="search">
			<icon type="search" color="white" size="10"></icon>
			<input type="text" value="" placeholder="搜索商品" placeholder-class="placeholder" />
		</view>
		<view class="list" v-if="products.length > 0">

			<view class="row" v-for="(item,index) in products">
				<!-- <view class="row"> -->
				<image :src="item.img" mode="widthFix"></image>
				<view class="info">
					<text>{{item.goodsname}}</text>
					<text>￥{{item.price}}</text>
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
		data() {
			return {
				fid: null, //类别id
				page: 1, //当前页码
				size: 4, //每页请求的条数
				products: [], //商品

			}
		},
		onLoad(options) {
			let {
				cateid,
				title
			} = options;
			uni.setNavigationBarTitle({
				title,
			})
			this.fid = cateid;
			this._getcategoodPage();

		},
		methods: {
			//获取每个分类下面的商品列表
			// fid一级分类id,必填page请求页码，必填size分页偏移量，必填
			async _getcategoodPage() {

				let {
					fid,
					page,
					size
				} = this;

				uni.showLoading({
					title: "请求中···"
				})
				let result = await this.api._getcategoodPage({
					fid,
					page,
					size
				});

				// 获取到的数据为null，证明没有商品了，直接返回，不进行处理图片路径问题
				if (result.data.list[1] == null) {
					uni.hideLoading()
					return;
				}
				// 请求成功之后，隐藏加载loading图标
				if (result.data.list[1].length > 0) {
					uni.hideLoading()
				}
				//获取总页数
				this.totalPage = result.data.list[0];
				//获取商品信息列表
				let products = result.data.list[1];
				//处理图片路径
				products.map((item, index) => {
					item.img = this.baseUrl + item.img;
				});
				//分页数据的拼接
				products = this.products.concat(products);
				this.products = products;
				console.log(result, '_getcategoodPage')
			}
		},
		onReachBottom(){
				this.page++; //  3 4
				// 根据总页数判断是否还有更多的商品
				if(this.page >  this.totalPage){
					uni.showToast({
						title:"已经没有商品啦",
						icon:"none"
					})
					return;
				}
				this._getcategoodPage();
			}

	}
</script>

<style>
	.search {
		margin: 50rpx;
		height: 80rpx;
		background-color: #f26b11;
		border-radius: 80rpx;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	icon {
		margin: 0 10rpx 0 250rpx;
	}

	.placeholder {
		color: white;
		font-size: 25rpx;
	}

	.row {
		position: relative;
		margin: 10rpx 20rpx;
		height: 330rpx;
		border-bottom: 1rpx solid #AAAAAA;
	}

	image {
		position: absolute;
		top: 0;
		left: 10rpx;
		width: 160rpx;
	}

	.info {
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

	.info text:nth-of-type(2) {
		color: red;
	}

	.info text:nth-of-type(3) {
		font-size: 20rpx;
		color: #AAAAAA;
	}

	.tishi {
		line-height: 200rpx;
		text-align: center;
		font-size: 40rpx;
		color: #006699;
	}
</style>
