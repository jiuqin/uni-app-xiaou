<template>
	<view class="container">
		<block v-if="loginStatus">
			<view class="top">
				<!-- 购物车信息遍历开始 -->
				<block v-if="carts.length > 0">
					<scroll-view class="scroll-view_H" scroll-x="true" v-for="(item,index) of carts" :key="item.id">
						<view class="cartInfo">
							<view class="cartInfochild">
								<!-- 选择框 -->
								<view class="cartInfo_switch common">
									<!-- 点击当前商品 -->
									<switch type="checkbox" @change="changeChecked($event,index)"  :checked="item.checked" />
								</view>
								<!-- 图片 -->
								<view class="cartInfo_image common">
									<image :src="item.img" mode=""></image>
								</view>

								<!-- 信息 -->
								<view class="cartInfo_info">
									<label for="" style="font-size: 26rpx;">{{ item.goodsname }}</label>
									<label for="" style="font-size: 24rpx; color: #ccc;">规格：白色</label>
									<label for="" style="color: red;">￥{{ item.price }}</label>
								</view>
								<!-- 加减数量 -->
								<view class="cartInfo_num">
									<view class="cartInfo_num_child">
										<label for="" @click="desc(index)">-</label>
										<label for="">{{ item.num }}</label>
										<label for="" @click="asc(index)">+</label>
									</view>
								</view>
							</view>

						</view>
						<view class="cartDel" @click="deleteCarts(index,item.id)">
							<label for="">删除</label>
						</view>
					</scroll-view>
					<!-- 购物车信息遍历开结束-->
				</block>
				<view class="" v-else>
					您太懒了，什么都没有~~~
				</view>

			</view>

			<!-- 底部 -->
			<view class="foot">
				<view class="footd1">
					<switch type="checkbox" :checked="_allCheckedStatus" @change="changeAllChecked($event)" />
					<label>全选</label>
				</view>
				<view class="footd2">
					<view class="footd2sp1">总计：<label style="color: red;">{{ _totalPrice }}</label></view>
					<label class="footd2sp2">不含运费，已优惠￥0.00</label>
				</view>
				<!-- 跳到提交订单，结算页面 -->
				<view class="footd3" @click="_confirm">
					<!-- 被选中的商品的个数 -->
					<label>去结算({{ _totalNum }}件)</label>
				</view>
			</view>
		</block>
		<block v-else>
			未登录
		</block>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				carts: [], //购物车商品列表信息
				loginStatus: false, //默认为--用户未登录状态
			}
		},
		onShow() {
			this._getCarts();
		},
		//计算属性
		computed: {
			//购买的总件数
			_totalNum() {
				let total = 0;
				this.carts.forEach((item, index) => {
					item.checked ? total += item.num : '';
				})
				return total;
			},
			//商品的总价格
			_totalPrice() {
				//所有的被选中的商品的数量累加
				let total = 0;
				this.carts.forEach((item, index) => {
					item.checked ? total += item.num * item.price : '';
				})
				return total;
			},
			//全选状态
			_allCheckedStatus() {
				let checked = this.carts.every((item) => {
					return item.checked==true;
				});
				if (this.carts.length <= 0) {
					checked = false; //如果购物车列表没有商品数据--则全选不选中
				}
				return checked;
			}

		},
		methods: {
			// 获取购物车信息
			async _getCarts() {
				let uid = uni.getStorageSync('uid');
				let authorization = uni.getStorageSync('token')
				let result = await this.api._cartlist({
					uid
				}, {
					authorization
				});
				console.log(result, 'cartslist');
				if (result.data.code == 500) {
					//登录状态过期
					this.loginStatus = false;
					uni.showToast({
						title: '请登录',
						icon: 'none'
					})
					setTimeout(() => {
						uni.navigateTo({
							url: '../send/send'
						})
					}, 1500)
				} else {
					//正常的登录成功
					this.loginStatus = true;
					// 遍历数据
					if (result.data.list == null) return;
					result.data.list.forEach((item) => {
						item.img = this.baseUrl + item.img;
						item.checked = item.checked == 1 ? true : false; //要与数据库中的字段向匹配
					})
					this.carts = result.data.list;
				}

			},
			//跳转到确定订单页面
			_confirm() {
				//获取被选中的所有的购物车商品
				let carts = this.carts.filter((item) => {
					return item.checked == true;
				})
				console.log(carts,'选中的商品提交到订单')
				//将数据存入缓存
				uni.setStorageSync('carts', carts);
				if (carts.length <= 0) {
					uni.showToast({
						title: '请至少选中一商品',
						icon: 'none'
					})
					return;
				}
				//进行跳转
				uni.navigateTo({
					url: '../confirm/confirm'
				})
			},
			//购物车商品删除
			deleteCates(index, id) {
				let authorization = uni.getStorageSync('token');
				uni.showModal({
					title: '危险提示',
					content: '您确定要删除么',
					success: (res) => {
						if (res.confirm) {
							this.api._cartdelete({
								id
							}, {
								authorization
							});
							this.carts.splice(index, 1);
						}
					}
				})
			},
			//商品修改函数封装
			async _editCart(index) {
				/*id[cartid]购物车编号，必填项
				num数量
				checked状态
				authorization   header头中需要添加token后台验证条件
				*/
				let {
					id,
					num,
					checked
				} = this.carts[index];
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
			//添加+
			asc(index) {
				this.carts[index].num++;
				this._editCart(index);
			},
			//数量-
			desc(index) {
				this.carts[index].num--;
				if (this.carts[index].num <= 0) {
					this.carts[index].num = 1;
				}
				this._editCart(index);
			},
			//全选状态
			changeAllChecked(e) {
				console.log(e, 'e-changeAllChecked')
				this.carts.forEach((item) => {
					item.checked = e.detail.value;

				})
				let authorization = uni.getStorageSync('token');
				this.carts.forEach((item, index) => {
					let checked = item.checked == true ? 1 : 0; //  处理每一个的值
					this.api._editCart({
						id: item.id,
						num: item.num,
						checked
					}, {
						authorization
					})
				})
			},
			//单个状态属性改变
			changeChecked(e,index) {
				this.carts[index].checked = e.detail.value;
				this._editCart(index);
			}

		},
	}
</script>

<style>
	@import url("../../common/css/cart.css");

	.cartInfo_image_img {
		width: 120rpx;
		height: 120rpx;
	}

	.foot {
		bottom: var(--window-bottom)
	}
</style>
