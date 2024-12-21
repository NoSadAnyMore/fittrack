<template>
	<view class="container">
		 <text style="color: seagreen;font-size: 18px; margin-left: 20px;">已有积分：1111</text>
		<view class="goods-list">
			
			<!-- 使用v-for循环展示商品 -->
			<view class="goods-item" v-for="(item, index) in goodsList" :key="index">
				<uni-card :isShadow="true" :title="item.name" mode="style" :extra="item.points" @click="clickCard">
					<view style="margin-bottom: 20rpx;">
						<view style="height: 120rpx;">
							<image style="height: 100%;" mode="aspectFill"
								src="https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/094a9dc0-50c0-11eb-b680-7980c8a877b8.jpg" />
						</view>
						<view class="content-box"><text style="font-size: 12px;"> </text></view>
					</view>
					<uni-button @click="redeemItem(item)" type="primary" class="redeem-btn">兑换</uni-button>
				</uni-card>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				// 模拟商品数据
				goodsList: [{
						name: '商品1',
						points: 100,
						image: '/static/images/banner/banner01.jpg'
					},
					{
						name: '商品2',
						points: 150,
						image: '/static/goods2.jpg'
					},
					{
						name: '商品3',
						points: 200,
						image: '/static/goods3.jpg'
					},
					{
						name: '商品4',
						points: 50,
						image: '/static/goods4.jpg'
					}
				]
			};
		},
		methods: {
			redeemItem(item) {
				// 点击兑换按钮时触发的逻辑
				uni.showToast({
					title: `成功兑换 ${item.name}`,
					icon: 'success',
					duration: 2000
				});
			}
		}
	};
</script>

<style scoped>
	.container {
		padding: 20rpx;
	}

	.goods-list {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}

	.goods-item {
		width: 50%;
		margin-bottom: 20rpx;
	}

	.goods-card .uni-card-header {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.goods-info {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.goods-points {
		font-size: 24rpx;
		color: #666;
		margin-bottom: 10rpx;
	}

	.redeem-btn {
		width: 80%;
		font-size: 28rpx;
	}
</style>