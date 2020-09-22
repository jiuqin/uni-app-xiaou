<template>
	<view class="container">
		<!-- s收货地址 -->
		<view class="address">
			<view class="address_info">
				<label for="">收件人:{{ information.name }}</label>
				<label for="">{{ information.phone }}</label>
			</view>
			<view class="address_res">
				收货地址：<label for="">{{ information.address }}</label>
			</view>
		</view>

		<!-- 商品信息 -->
		<view class="carts">
			<!-- cartsInfo 循环体 -->
			<view class="cartsInfo" v-for="(item,index) of   cartsInfo">
				<!-- 70px -->
				<view class="carts_detail">
					<view class="carts_image">
						<image :src="item.img" mode=""></image>
					</view>
					<view class="carts_name">
						<view for="" style="font-size: 30rpx;">{{item.goodsname}}</view>
						<view for="" style="font-size: 26rpx; color: #C0C0C0;">规格:白色</view>
					</view>
					<view class="carts_price">
						<label for="">￥{{ item.price }}</label>
					</view>
				</view>
				<!-- 50px -->
				<view class="cart_num">
					<view class="">
						购买数量：
					</view>
					<view class="">
						<label for="" class="jian" @click="desc(index)">-</label>
						<label for="" class="num">{{ item.num }}</label>
						<label for="" class="jia" @click="asc(index)">+</label>
					</view>
				</view>
				<!-- 横线 -->
				<view class="xian"></view>
			</view>
			<!-- 50px -->
			<view class="kuaidi">
				<label for="">配送方式</label>
				<label for="">XX快递</label>
			</view>
		</view>

		<!-- 优惠券 -->
		<view class="yhquan">
			<label for="">优惠券</label>
			<label for="" style="margin-right: 40rpx;">无可用</label>
		</view>
		<!-- jifen积分 -->
		<view class="jifen">
			<view class="use">
				<label for="">使用积分</label>
			</view>
			<view class="input" style="margin-right: 40rpx;">
				<input type="text" value="" placeholder="输入积分" />
				<label for="" class="input_use">使用</label>
				<label for="" class="input_keyi">可使用50积分</label>
			</view>
		</view>

		<!-- 具体详细 -->
		<view class="resDetail">
			<view class="">
				<label for="">商品金额</label>
				<label for="" style="margin-right:40rpx;color:red">￥420</label>
			</view>
			<view class="">
				<label for="">运费</label>
				<label for="" style="margin-right:40rpx;color:red">+￥0.00</label>
			</view>
			<view class="">
				<label for="">优惠券</label>
				<label for="" style="margin-right:40rpx;color:red">-￥{{yhq}}</label>
			</view>
			<view class="">
				<label for="">会员优惠</label>
				<label for="" style="margin-right:40rpx;color:red">-￥0.00</label>
			</view>
			<view class="">
				<label for="">积分抵扣</label>
				<label for="" style="margin-right:40rpx;color:red">-￥0.00</label>
			</view>
		</view>
		<!-- 实付金额 -->
		<view class="sfje">
			实付金额：<label for="" style="color:red">￥{{ _confirmPrice }}</label>
		</view>

		<!-- 确认订单按钮 -->
		<view class="btn">
			<!-- 点击提交订单按钮，发起支付请求 -->
			<button type="primary" @click="_confirmOrder">提交订单</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				yhq: 100, //优惠券
				cartsInfo: [], //确认订单页--商品信息
				information: {
					name: 'YouSu',
					phone: '15811112222',
					address: '北京市海淀区隐泉路清林苑6号楼'
				}
			}
		},
		computed: {
			//总价格
			_totalPrice() {
				let total = 0;
				//总价=被选中商品*单价
				
				this.cartsInfo.forEach((item) => {
					item.checked ? total += item.num * item.price : '';
				})
				return total;
			},
			//确认总价
			_confirmPrice() {
				let confirmPrice = this._totalPrice -this.yhq; //确定价格-优惠券
				return confirmPrice;
			},
			//购买的总件数
			_totalNum() {
				let total = 0;
				this.cartsInfo.forEach((item, index) => {
					item.checked ? total += item.num : '';
				})
				return total;
			}
		},
		onLoad() {
			this._getCarts();
		},
		methods: {
			async _confirmOrder() {
				let uid = uni.getStorageSync('uid');
				let username = this.information.name;
				let userphone = this.information.phone;
				let address = this.information.address;
				let countmoney = this._totalPrice;
				let countnumber = this._totalNum;
				let addtime = new Date().getTime();
				let authorization = uni.getStorageSync('token');
				let idstr = "";
				this.cartsInfo.forEach((item) => {
					idstr += item.id + ',';
				})
				//去掉多余的逗号
				idstr = idstr.substr(0, idstr.length - 1);
				let params = {
					uid,
					username,
					userphone,
					address,
					countmoney,
					countnumber,
					addtime
				}
				//将js对象转成json格式数据
				params = JSON.stringify(params);
				console.log(params, 'params');
				let result = await this.api._orderadd({
					idstr,
					params
				}, {
					authorization
				})
				console.log(result, '_orderadd');
				if (result.data.code == 500) {
					uni.showToast({
						title: '下单失败',
						icon: 'none'
					})
				} else {
					uni.showToast({
						title: '下单成功',

					})
					uni.removeStorageSync('carts');
					setTimeout(() => {
						uni.navigateTo({
							url: '../order/order'
						})
					}, 1500)
				}
			},
			//获取购物车选中的商品
			_getCarts() {
				let cartsInfo = uni.getStorageSync('carts');
				this.cartsInfo = cartsInfo;
				console.log(this.cartsInfo,'获取到购物车中选中的商品')
			},
			//数量 +  -
			asc(index) {
				this.cartsInfo[index].num++;
				this._editCart(index);;
				uni.setStorageSync('carts',this.cartsInfo);//重新设置缓存信息--页面渲染最新数据信息
				
			},
			desc(index) {
				this.cartsInfo[index].num--;
				if (this.cartsInfo[index].num <= 0) {
					this.cartsInfo[index].num = 1;
				}
				this._editCart(index);
				uni.setStorageSync('carts',this.cartsInfo);
			},
			// 封装修改cart数据的方法
			async _editCart(index) {
				let {
					id,
					num,
					checked
				} = this.cartsInfo[index];
				checked = checked == true ? 1 : 0;
				let authorization = uni.getStorageSync('token');
				let result = await this.api._editCart({
					id,
					num,
					checked
				}, {
					authorization
				});
				console.log(result,'封装修修改的函数--修改数据库中的数据');
				if (result.data.code == 500) {
					//登录状态过期
					this.loginStatus = false;
				}

			},
		}
	}
</script>

<style>
	@import url("../../common/css/confirm.css");
</style>
