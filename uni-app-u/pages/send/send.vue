<template>
	<view class="box">
		<view class="row">
			<text>手机号</text>
			<input type="text" v-model="tel" placeholder="输入手机号" maxlength="12" />
		</view>
		<view class="row">
			<view class="send">
				<text>验证码</text>
				<text @click="_getPhoneCode">{{codeMsg}}</text>
			</view>
			<input type="text" v-model="code" placeholder="- - - -" maxlength="6" />
		</view>
		<view class="row">
			<text style="font-size: 23rpx;">收不到验证码？试试 <text style="color:#00BB00;font-size: 23rpx;"> 语音验证</text></text>
			<!--   -->
			<button type="primary" style="width: 90%;border-radius: 80rpx;margin-top: 50rpx;" @click="_doLogin">登录</button>
		</view>
		<view class="row">
			<!-- <text style="color: #006699;text-align: center;" >通过微信授权登录</text> -->
		</view>
	</view>
</template>

<script>
	let app = getApp()

	export default {
		data() {
			return {
				codeMsg: '获取手机验证码',
				tel: null, //存储用户输入的手机号,
				timer: null, //设置定时器，倒计时60s验证码失效
				isSend: false, //false  没有发送  true 已经发送 （开关）
				code: null, //输入的验证码
			}

		},
		methods: {
			//获取手机验证码
			async _getPhoneCode() {
				if (this.isSend) {
					//已经发送验证码
					return;
				}
				console.log(this.tel);
				let tel = this.tel;
				// 再一次使用正则匹配
				let regExp = /^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}$/;
				            if(!regExp.test(tel)){
					uni.showToast({
						title:'请输入正确的手机号',
						icon:'none'
					})
				}
				//发送请求，获取验证码
				let result = await this.api._getsms({
					phone: tel
				});
				console.log(result, 'code');
				//若验证码不为空
				if (result.data.list !== null) {
					let num = 60;
					if (this.timer) clearInterval(this.timer);
					this.timer = setInterval(() => {
						num--;
						this.codeMsg = num + '秒之后，重新获取验证码';
						if (num <= 0) {
							this.codeMsg = '获取手机验证码',
								this.isSend = false;
							clearInterval(this.timer);

						}
					}, 1000)
					this.isSend = true; //发送之后改变发送状态

					//获取到验证码--存入缓存
					uni.setStorageSync('code', result.data.list.code)
				}
			},
			//执行登录--用户输入的手机号--输入的验证码--与缓存的验证码对比
			async _doLogin() {
				let code = this.code;
				let tel = this.tel;
				// 再一次使用正则匹配
				let  regExp = /^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}$/;
				if(!regExp.test(tel)){
				   uni.showToast({
				   	   title:"请输入正确的手机号",
					   icon:"none"
				   })
				   return;
				}
				let sCode = uni.getStorageSync('code');
				if (code != sCode) {
					uni.showToast({
						title: '您输入的验证码有误',
						icon: 'none'
					})
					return;
				}
				//执行登录
				console.log('执行登录');
				let result = await this.api._wxDoLogin({
					phone: tel
				});
				if (result.data.list != null) {
					//登录成功--存token、用户id、用户手机号
					let {
						token,
						uid,
						phone
					} = result.data.list;
					uni.setStorageSync('token', token);
					uni.setStorageSync('uid', uid);
					uni.setStorageSync('phone', phone);

					//登录成功后-->跳转到个人中心页面
					uni.showToast({
						title: '登录成功',
						icon: 'none'
					});
					setTimeout(() => {
						//返回个人中心页
						//返回上一个页面--可做跳转来源判断
						uni.navigateBack({
							delta: 1
						})
					}, 1500)
				} else {
					uni.showToast({
						title: "登录失败，检测网络",
						icon: "none"
					})
				}

			}

		}
	}
</script>

<style>
	/* 导入外部的样式文件 */
	.box {
		position: relative;
	}

	.row {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		margin: 40rpx;
	}

	.send {
		display: flex;
		justify-content: space-between;
	}

	.send text:nth-of-type(2) {
		color: #00BB00;
	}

	text {
		font-size: 27rpx;
		margin-bottom: 10rpx;
	}

	input {
		border-bottom: 1rpx solid gray;
		height: 65rpx;
	}
</style>
