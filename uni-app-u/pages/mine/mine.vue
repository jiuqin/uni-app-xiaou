<template>
	<view class="container">
		<!-- 顶部头像部分 -->
		<view class="mineTop">
			<view class="mineTop_left">
				<view class="mineTop_left_image">
					<image src="@/static/mine/timg.jpg" mode=""></image>
				</view>
				<view class="mineTop_left_info" v-if="loginStatus">
					<text for="" style="color: #fff;">{{phone}}</text>
					<text for="">V1</text>
				</view>
				<view class="" v-else>
					<button type="default" size="mini" @click="_goToLoginPage">登录</button>
				</view>
			</view>
			<view class="mineTop_right">
				<view class="mineTop_right_info">
					<text for="">每日签到</text>
				</view>
			</view>
		</view>

		<!-- 订单状态 -->
		<view class="order_state">
			<view class="order_state_list">
				<image src="@/static/mine/quanbudingdan.png" mode=""></image>
				<text class="list_text">全部订单</text>
			</view>
			<view class="order_state_list">
				<image src="@/static/mine/daifukuan.png" mode=""></image>
				<text class="list_text">待付款</text>
			</view>
			<view class="order_state_list">
				<image src="@/static/mine/daishouhuo.png" mode=""></image>
				<text class="list_text">待收货</text>
			</view>
		</view>

		<!-- 个人信息 -->
		<view class="person_msg">
			<view class="person_msg_list">
				<view class="person_msg_list_info">
					<image src="@/static/mine/dizhiguanli.png" alt class="MsgItemLogo" />
					<text>地址管理</text>
				</view>
				<view class="MsgItemRight">
					<image src="@/static/mine/xiayiye.png" alt class="MsgItemDetail" />
				</view>
			</view>
			<view class="person_msg_list">
				<view class="person_msg_list_info">
					<image src="@/static/mine/zu.png" alt class="MsgItemLogo" />
					<text>我的钱包</text>
				</view>
				<view class="MsgItemRight">
					<text class="remaB" v-show="true">200余额</text>
					<image src="@/static/mine/xiayiye.png" alt class="MsgItemDetail" />
				</view>
			</view>
			<view class="person_msg_list">
				<view class="person_msg_list_info">
					<image src="@/static/mine/wodeyouhuiquan.png" alt class="MsgItemLogo" />
					<text>我的优惠券</text>
				</view>
				<view class="MsgItemRight">
					<image src="@/static/mine/xiayiye.png" alt class="MsgItemDetail" />
				</view>
			</view>
			<view class="person_msg_list">
				<view class="person_msg_list_info">
					<image src="@/static/mine/wodeerweima.png" alt class="MsgItemLogo" />
					<text>我的二维码</text>
				</view>
				<view class="MsgItemRight">
					<image src="@/static/mine/xiayiye.png" alt class="MsgItemDetail" />
				</view>
			</view>
			<view class="person_msg_list">
				<view class="person_msg_list_info">
					<image src="@/static/mine/xiaohuoban.png" alt class="MsgItemLogo" />
					<text>我的小伙伴</text>
				</view>
				<view class="MsgItemRight">
					<image src="@/static/mine/xiayiye.png" alt class="MsgItemDetail" />
				</view>
			</view>

		</view>
	</view>
</template>

<script>
	import checkToken from "../../utils/utils.js";
	export default {
		data() {
			return {
				phone: null, //手机号--初始为空
				loginStatus: false, //登录状态--初始为--未登录
				//   个人信息
				personMsgList: [{
						name: "地址管理",
						icon: "../../static/mine/dizhiguanli.png"
					},
					{
						name: "我的钱包",
						icon: "../../static/mine/zu.png",
						remaBala: "200余额"
					},
					{
						name: "我的优惠券",
						icon: "../../static/mine/wodeyouhuiquan.png",
					},
					{
						name: "我的二维码",
						icon: "../../static/mine/wodeerweima.png",
					},
					{
						name: "我的小伙伴",
						icon: "../../static/mine/xiaohuoban.png"
					}
				],
			}
		},
		onLoad() {},
		onShow() {
			this._checkTokenStatus() //检测登录状态
		},
		methods: {
			//检测用户登录状态--获取到token、用户名、用户登录状态true/false
			async _checkTokenStatus() {
				let token = uni.getStorageSync('token');
				this.phone = uni.getStorageSync('phone');
				this.loginStatus = await checkToken(this, token);
			},
			_goToLoginPage() {
				uni.navigateTo({
					url: "../login/login"
				})
			}
		},

	}
</script>

<style>
	@import url("../../common/css/mine.css");
</style>
