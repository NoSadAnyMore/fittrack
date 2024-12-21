<template>
	<view class="normal-login-container">
		<view class="logo-content align-center justify-center flex">
			<image style="width: 100rpx;height: 100rpx;" :src="globalConfig.appInfo.logo" mode="widthFix">
			</image>
			<text class="title">fittrack</text>
		</view>
		<view class="login-form-content">
			<view class="input-item flex align-center">
				<view class="iconfont icon-user icon"></view>
				<input v-model="loginForm.username" class="input" type="text" placeholder="请输入账号" maxlength="30" />
			</view>
			<view class="input-item flex align-center">
				<view class="iconfont icon-password icon"></view>
				<input v-model="loginForm.password" type="password" class="input" placeholder="请输入密码" maxlength="20" />
			</view>
			<view class="input-item flex align-center" style="width: 60%;margin: 0px;" v-if="captchaEnabled">
				<view class="iconfont icon-code icon"></view>
				<input v-model="loginForm.code" type="number" class="input" placeholder="请输入验证码" maxlength="4" />
				<view class="login-code">
					<image :src="codeUrl" @click="getCode" class="login-code-img"></image>
				</view>
			</view>
			<view class="action-btn">
				<button       @click="handleLogin" class="login-btn cu-btn  bg-blue lg round">账号密码登录</button>
				<button    class="login-btn cu-btn  bg-green lg " @click="wxhandleLogin">微信授权登陆</button>
			</view>
			
			
			<view class="reg text-center" v-if="register">
				<text class="text-grey1">没有账号？</text>
				<text @click="handleUserRegister" class="text-blue">立即注册</text>
			</view>
			<view class="xieyi text-center">
				<text class="text-grey1">登录即代表同意</text>
				<text @click="handleUserAgrement" class="text-blue">《用户协议》</text>
				<text @click="handlePrivacy" class="text-blue">《隐私协议》</text>
			</view>
		</view>

	</view>
</template>

<script>
	import {
		getCodeImg
	} from '@/api/login'

	export default {
		data() {
			return {
				codeUrl: "",
				captchaEnabled: true,
				// 用户注册开关
				register: false,
				globalConfig: getApp().globalData.config,
				loginForm: {
					username: "admin",
					password: "admin123",
					code: "",
					uuid: ''
				},
				/**微信登录的form数据**/
				wxLoginForm: {
					code: "",
					encryptedIv: "",
					encryptedData: "",
				}
			}
		},
		created() {
			this.getCode()
		},
		methods: {
			// 用户注册
			handleUserRegister() {
				this.$tab.redirectTo(`/pages/register`)
			},
			// 隐私协议
			handlePrivacy() {
				let site = this.globalConfig.appInfo.agreements[0]
				this.$tab.navigateTo(`/pages/common/webview/index?title=${site.title}&url=${site.url}`)
			},
			// 用户协议
			handleUserAgrement() {
				let site = this.globalConfig.appInfo.agreements[1]
				this.$tab.navigateTo(`/pages/common/webview/index?title=${site.title}&url=${site.url}`)
			},
			// 获取图形验证码
			getCode() {
				getCodeImg().then(res => {
					this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled
					if (this.captchaEnabled) {
						this.codeUrl = 'data:image/gif;base64,' + res.img
						this.loginForm.uuid = res.uuid
					}
				})
			},
			// 登录方法
			async handleLogin() {
				if (this.loginForm.username === "") {
					this.$modal.msgError("请输入您的账号")
				} else if (this.loginForm.password === "") {
					this.$modal.msgError("请输入您的密码")
				} else if (this.loginForm.code === "" && this.captchaEnabled) {
					this.$modal.msgError("请输入验证码")
				} else {
					this.$modal.loading("登录中，请耐心等待...")
					this.pwdLogin()
				}
			},
			// 密码登录
			async pwdLogin() {
				this.$store.dispatch('Login', this.loginForm).then(() => {
					this.$modal.closeLoading()
					this.loginSuccess()
				}).catch(() => {
					if (this.captchaEnabled) {
						this.getCode()
					}
				})
			},
			// 登录成功后，处理函数
			loginSuccess(result) {
				// 设置用户信息
				this.$store.dispatch('GetInfo').then(res => {
					this.$tab.reLaunch('/pages/index')
				})
			},
			/**微信授权登录**/
			async wxhandleLogin() {
				console.log(1)
				uni.getProvider({
					service: 'oauth',
					success: (res) => {
						if (~res.provider.indexOf("weixin")) {
							uni.login({
								provider: "weixin",
								success: (loginRes) => {
									console.log(loginRes.code)
									this.wxLoginForm.code = loginRes.code
									uni.getUserInfo({
										success: (infoRes) => {
											console.log(infoRes.userInfo)
											this.wxLoginForm.userName = infoRes.userInfo.nickName 
											this.wxLoginForm.avatarUrl =infoRes.userInfo.avatarUrl
											this.wxLoginForm.encryptedIv = infoRes.iv 
											this.wxLoginForm.encryptedData = infoRes.encryptedData
											this.sendWxLoginFormToLocalService()
										}
									})
								}
							})
						}
					}
				})
			},
			sendWxLoginFormToLocalService() {
				this.$store.dispatch('WxLogin', this.wxLoginForm).then(() => {
					this.$modal.closeLoading()
					this.loginSuccess()
					console.log('登录成功')
				}).catch((err) => {
					console.log(err)
					console.log('登录失败')
				})
			},
		}
	}
</script>

<style lang="scss">
	page {
		background-color: #ffffff;
	}

	.normal-login-container {
		width: 100%;

		.logo-content {
			width: 100%;
			font-size: 21px;
			text-align: center;
			padding-top: 15%;

			image {
				border-radius: 4px;
			}

			.title {
				margin-left: 10px;
			}
		}

		.login-form-content {
			text-align: center;
			margin: 20px auto;
			margin-top: 15%;
			width: 80%;

			.input-item {
				margin: 20px auto;
				background-color: #f5f6f7;
				height: 45px;
				border-radius: 20px;

				.icon {
					font-size: 38rpx;
					margin-left: 10px;
					color: #999;
				}

				.input {
					width: 100%;
					font-size: 14px;
					line-height: 20px;
					text-align: left;
					padding-left: 15px;
				}

			}

			.login-btn {
				margin-left: 1%;
				width: 49%;
				margin-top: 40px;
				height: 45px;
			}

			.reg {
				margin-top: 15px;
			}

			.xieyi {
				color: #333;
				margin-top: 20px;
			}

			.login-code {
				height: 38px;
				float: right;

				.login-code-img {
					height: 38px;
					position: absolute;
					margin-left: 10px;
					width: 200rpx;
				}
			}
		}
	}
</style>
