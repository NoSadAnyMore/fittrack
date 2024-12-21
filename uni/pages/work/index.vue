<template>
	<view class="page">
		<uni-swipe-action>
			<view class="list-item" v-for="(item,index) in users" :key="index" @click="connect(item)">
				<uni-swipe-action-item style="width: 100%;">
					<view class="conList">
						<view class="avatar">
							<text class="round" v-if="item.read"></text>
							<image :src="item.avatar" mode="widthFix"></image>
						</view>
						<view class="content">
							<view class="title">
								<text class="name">{{ item.name }}</text>
								<text class="time">{{ item.time }}</text>
							</view>
							<view class="txt">{{ item.msg }}</view>
						</view>

					</view>
					<template v-slot:right>
						<view class="swipBox">
							<view class="swipBox-item" style="background-color: #5a95ed;" @click.stop="Topping()"><text>置顶</text></view>
							<view class="swipBox-item" @click.stop="Delete()"><text>删除</text></view>
						</view>

					</template>
				</uni-swipe-action-item>
			</view>
		</uni-swipe-action>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				users: [{
						avatar: '/static/avatar/avatar1.png',
						name: '杨涛',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					{
						avatar: '/static/avatar/avatar2.jpg',
						name: '雨中漫步',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					{
						avatar: '/static/avatar/avatar3.jpeg',
						name: '糖果梦境',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					{
						avatar: '/static/avatar/avatar4.png',
						name: '海上日落',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					{
						avatar: '/static/avatar/avatar6.png',
						name: '男朋友',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					{
						avatar: '/static/avatar/avatar8.png',
						name: '女朋友',
						read: 1,
						time: '23:59',
						msg: '没有消息就是最好的消息'
					},
					 
				]
			};
		},
		methods: {
			/**
			 * 置顶按钮
			 */
			Topping() {
				console.log("置顶按钮");
			},
			/**
			 * 删除按钮
			 */
			Delete() {
				console.log("删除按钮");
			},
			/**
			 * 跳转页面
			 * @param {Object} item
			 */
			connect(item) {
				uni.navigateTo({
					url: `/pages/message/message?name=${item.name}&avatar=${item.avatar}`
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.page {
		padding: 0 32rpx;
		color: #333;
	}

	.conList {
		width: 100%;
		display: flex;
	}

	.list-item {
		width: 100%;
		display: flex;
		padding: 30rpx 0;
		border-bottom: 1px solid #ccced3;

		.avatar {
			width: 90rpx;
			height: 90rpx;
			border-radius: 10rpx;
			margin-right: 20rpx;
			position: relative;

			.round {
				position: absolute;
				width: 14rpx;
				height: 14rpx;
				border-radius: 50%;
				background: #ef5656;
				top: -4rpx;
				right: -4rpx;
				z-index: 1;
			}

			image {
				width: 100%;
				height: 100%;
				border-radius: 10rpx;
			}
		}

		.content {
			flex: 1;

			.title {
				display: flex;
				justify-content: space-between;

				.name {
					font-weight: bold;
				}

				.time {
					color: #999;
					font-size: 24rpx;
				}
			}

			.txt {
				margin-top: 10rpx;
				overflow: hidden;
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 1;
				-webkit-box-orient: vertical;
				text-align: left;
				color: #999;
				font-size: 26rpx;
			}
		}
	}

	.swipBox {
		width: 210rpx;
		height: 100%;
		display: flex;
		justify-content: space-between;
		padding-left: 20rpx;
		.swipBox-item {
			flex: 1;
			height: 100%;
			background: red;
			color: #ffffff;
			display: flex;
			align-items: center;
			justify-content: center;
		}
	}
</style>