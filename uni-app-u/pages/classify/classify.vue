<template>
	<view class="container">
		<!-- left左侧列表 -->
		<view class="left">
			<!-- 循环遍历的 -->
			<!--  -->
			<view class="left_list" :class="activeIndex==index?'activeList':''" v-for="(item,index) in cates" :key="index"
			 @click="changeIndex(index)">
				<label for="">{{item.catename}}</label>
			</view>

		</view>
		<!-- right右侧详细分类商品 -->
		<view class="right">
			<!-- 每一个小类 -->
			<view class="right_list">
				<!-- 商品 -->
				<view class="bottom" v-if="cates.length>0">
					<view class="bottom_list" v-for="(item,index) in cates[activeIndex].children" :key="index ">
						<view @click="_goDetailPage">
							<image :src="item.img" alt="">
							<span>{{item.catename}}</span>
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
				cates: [], //所有的商品分类
				activeIndex: 0, //当前的点击项
			}
		},
		mounted() {
			this._getcates();
		},
		methods: {
			//获取所有的分类
			async _getcates() {
				let result = await this.api._getcates();
				console.log(result, 'getcates');
				// 利用双层循环，处理数组问题
				result.data.list.forEach((item, index) => {
					item.children = item.children || [];
					item.children.forEach((val, ind) => {
						val.img = this.baseUrl + val.img
					})

				})
				this.cates = result.data.list;

			},
			//点击左侧分类栏--右侧显示对应商品列表信息
			changeIndex(index) {
				this.activeIndex = index;
				console.log(this.activeIndex, 'activeIndex');

			},
			//点击商品--进入它的详情页面
			_goDetailPage(){
				uni.navigateTo({
					url:'../details/details'
				})
            },
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
