<template>
	<view class="work-container">
		<!-- 轮播图 -->
		<uni-swiper-dot class="uni-swiper-dot-box" :info="data" :current="current" field="content">
			<swiper class="swiper-box" :current="swiperDotIndex" @change="changeSwiper">
				<swiper-item v-for="(item, index) in data" :key="index">
					<view class="swiper-item" @click="clickBannerItem(item)">
						<image :src="item.image" mode="aspectFill" :draggable="false" />
					</view>
				</swiper-item>
			</swiper>
		</uni-swiper-dot>

		<!-- 宫格组件 -->
		<uni-section title="健康中心" type="line"></uni-section>
		<view class="grid-body">
			<uni-grid :column="2" :showBorder="false" @change="changeGrid">
				<uni-grid-item :index="0">
					<view class="grid-item-box">
						<uni-icons type="person-filled" size="100"></uni-icons>
						<text class="text">开始运动</text>
					</view>
				</uni-grid-item>
				<uni-grid-item :index="1">
					<view class="grid-item-box">
						<uni-icons type="staff-filled" size="100"></uni-icons>
						<text class="text">计划定制</text>
					</view>
				</uni-grid-item>
				<uni-grid-item :index="2">
					<view class="grid-item-box">
						<uni-icons type="color" size="100"></uni-icons>
						<text class="text">积分商城</text>
					</view>
				</uni-grid-item>
				<uni-grid-item :index="3">
					<view class="grid-item-box">
						<uni-icons type="settings-filled" size="100"></uni-icons>
						<text class="text">食谱计划</text>
					</view>
				</uni-grid-item>

			</uni-grid>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				current: 0,
				swiperDotIndex: 0,
				data: [{
						image: '/static/images/banner/banner01.jpg'
					},
					{
						image: '/static/images/banner/banner02.jpg'
					},
					{
						image: '/static/images/banner/banner03.jpg'
					}
				]
			}
		},
		methods: {
			clickBannerItem(item) {
				console.info(item)
			},
			goRun() {
				this.$tab.navigateTo(`/pages/sport/run/run`)
			},
			changeSwiper(e) {
				this.current = e.detail.current
			},
			changeGrid(e) {
				console.log(e)
				if (e.detail.index === 0) {
					this.$tab.navigateTo(`/pages/sport/run/run`)
				}
				if (e.detail.index === 1) {
					this.$tab.navigateTo(`/pages/sport/sport_plan/sport_plan`)
				}
				if (e.detail.index === 2) {
					this.$tab.navigateTo(`/pages/sport/jf/jf`)
				}
				if (e.detail.index === 3) {
					this.$tab.navigateTo(`/pages/sport/recipePlan/recipePlan`)
				}
			}
		}
	}
</script>

<style lang="scss">
	/* #ifndef APP-NVUE */
	page {
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
		background-color: #fff;
		min-height: 100%;
		height: auto;
	}

	view {
		font-size: 14px;
		line-height: inherit;
	}

	/* #endif */

	.text {
		text-align: center;
		font-size: 26rpx;
		margin-top: 10rpx;
	}

	.grid-item-box {
		flex: 1;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 15px 0;
		background-color: lightblue;
		width: 80%;
		margin-left: 10%;
		margin-top: 10%;
	}

	.uni-margin-wrap {
		width: 690rpx;
		width: 100%;
		;
	}

	.swiper {
		height: 300rpx;
	}

	.swiper-box {
		height: 150px;
	}

	.swiper-item {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: center;
		align-items: center;
		color: #fff;
		height: 300rpx;
		line-height: 300rpx;
	}

	@media screen and (min-width: 500px) {
		.uni-swiper-dot-box {
			width: 400px;
			/* #ifndef APP-NVUE */
			margin: 0 auto;
			/* #endif */
			margin-top: 8px;
		}

		.image {
			width: 100%;
		}
	}
</style>