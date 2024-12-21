<template>
	<view class="container">
		<!-- 地图组件 -->
		<map id="map" class="map" :longitude="currentLocation.longitude" :latitude="currentLocation.latitude"
			:polyline="polyline" @regionchange="onRegionChange" @updated="onMapUpdated">
			<!-- 开始/暂停按钮 -->
			<button class="start-btn" @click="toggleRunning">
				{{ isRunning ? '暂停跑步' : '开始跑步' }}
			</button>
			<view class="start-btn " style="bottom: 40px; background-color: skyblue;" v-if="isRunning">时间:
				{{ duration }}</view>
		</map>

		<!-- 信息栏 -->
		<view class="info-bar">
			<view class="info-item">时速: {{ speed }} km/h</view>
			<view class="info-item">公里数: {{ distance }} km</view>
			<view class="info-item">卡路里: {{ calories }} k</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isRunning: false, // 跑步状态
				currentLocation: {
					latitude: 0,
					longitude: 0
				}, // 当前定位
				path: [], // 跑步轨迹
				polyline: [], // 地图轨迹绘制
				distance: 0, // 总公里数
				speed: 0, // 当前速度
				duration: '00:00:00',
				calories: 0, // 总时长
				timer: null,
				startTime: null,
				lastUpdate: null,
				weight: 70,
			};
		},
		methods: {
			// 切换跑步状态
			toggleRunning() {
				if (!this.isRunning) {
					this.startRunning();
				} else {
					this.pauseRunning();
				}
			},
			// 开始跑步
			startRunning() {
				this.isRunning = true;
				this.startTime = Date.now();
				this.lastUpdate = this.startTime;

				// 获取实时位置
				this.timer = setInterval(this.trackLocation, 1000);
			},
			// 暂停跑步
			pauseRunning() {
				this.isRunning = false;
				clearInterval(this.timer);
				this.timer = null;
			},
			// 实时获取位置
			trackLocation() {
			  uni.getLocation({
			    type: 'gcj02',
			    success: (res) => {
			      const newPoint = { latitude: res.latitude, longitude: res.longitude };
			      const now = Date.now();
			
			      if (this.path.length > 0) {
			        const lastPoint = this.path[this.path.length - 1];
			        const timeDiff = (now - this.lastUpdate) / 1000; // 秒
			        const distance = this.calculateDistance(lastPoint, newPoint);
			
			        // 如果移动距离大于 5 米，更新相关数据
			        if (distance > 5) {
			          this.distance = (
			            parseFloat(this.distance) + distance / 1000
			          ).toFixed(2); // 转换为公里并保留两位小数
			
			          this.speed = (distance / timeDiff * 3.6).toFixed(2); // m/s 转 km/h，保留两位小数
			
			          // 卡路里消耗计算（使用 MET * 体重 * 时间）
			          const met = 9.8; // 跑步的 MET 值
			          const timeInHours = timeDiff / 3600; // 时间从秒转换为小时
			          const caloriesBurned = met * this.weight * timeInHours;
			
			          this.calories = (
			            parseFloat(this.calories) + caloriesBurned
			          ).toFixed(2); // 保留两位小数
			
			          this.path.push(newPoint);
			          this.polyline = [
			            {
			              points: this.path,
			              color: '#FF0000DD',
			              width: 5,
			            },
			          ];
			        }
			      } else {
			        // 第一次更新位置
			        this.path.push(newPoint);
			      }
			
			      this.lastUpdate = now;
			
			      // 更新时间
			      const elapsed = now - this.startTime;
			      this.duration = this.formatDuration(elapsed);
			
			      // 更新当前位置
			      this.currentLocation = newPoint;
			    },
			    fail: (err) => {
			      console.error('获取定位失败:', err);
			    },
			  });
			},

			// 计算两点间距离
			calculateDistance(point1, point2) {
				const radLat1 = (point1.latitude * Math.PI) / 180;
				const radLat2 = (point2.latitude * Math.PI) / 180;
				const deltaLat = radLat2 - radLat1;
				const deltaLng = ((point2.longitude - point1.longitude) * Math.PI) / 180;
				const a =
					Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2) +
					Math.cos(radLat1) *
					Math.cos(radLat2) *
					Math.sin(deltaLng / 2) *
					Math.sin(deltaLng / 2);
				const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
				const distance = 6378137 * c; // 地球半径 (m)
				return distance;
			},
			// 格式化时间
			formatDuration(milliseconds) {
				const totalSeconds = Math.floor(milliseconds / 1000);
				const hours = String(Math.floor(totalSeconds / 3600)).padStart(2, '0');
				const minutes = String(
					Math.floor((totalSeconds % 3600) / 60)
				).padStart(2, '0');
				const seconds = String(totalSeconds % 60).padStart(2, '0');
				return `${hours}:${minutes}:${seconds}`;
			},
			onRegionChange() {
				// 视野变化时的事件处理
			},
			onMapUpdated() {
				// 地图更新事件
			},
		},
		onLoad() {
			// 初始化定位
			uni.getLocation({
				type: 'gcj02',
				success: (res) => {
					this.currentLocation = {
						latitude: res.latitude,
						longitude: res.longitude,
					};
				},
			});
		},
		onUnload() {
			// 清理定时器
			if (this.timer) {
				clearInterval(this.timer);
			}
		},
	};
</script>

<style>
	.container {
		display: flex;
		flex-direction: column;
		height: 100vh;
	}

	.map {
		flex: 1;
		width: 100%;
	}

	.info-bar {
		background-color: #fff;
		padding: 10px;
		display: flex;
		justify-content: space-between;
		border-top: 1px solid #eee;
	}

	.info-item {
		font-size: 16px;
		color: #333;
	}

	.start-btn {
		position: absolute;
		bottom: 80px;
		left: 50%;
		transform: translateX(-50%);
		padding: 10px 20px;
		background-color: #ff5722;
		color: white;
		border-radius: 20px;
	}
</style>