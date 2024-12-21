<template>
  <view class="container">
    <view class="form">
      <view class="input-item">
        <text class="label">身高 (cm)</text>
        <input class="input" v-model="height" type="number" placeholder="请输入身高" />
      </view>

      <view class="input-item">
        <text class="label">体重 (kg)</text>
        <input class="input" v-model="weight" type="number" placeholder="请输入体重" />
      </view>

      <view class="input-item">
        <text class="label">年龄</text>
        <input class="input" v-model="age" type="number" placeholder="请输入年龄" />
      </view>

      <view class="input-item">
        <text class="label">性别</text>
        <picker v-model="gender" :range="genderOptions" mode="selector">
          <view class="picker">
            <text>{{ genderOptions[gender] }}</text>
          </view>
        </picker>
      </view>

      <view class="input-item">
        <text class="label">日消耗卡路里量 (kcal)</text>
        <input class="input" v-model="calories" type="number" placeholder="请输入日消耗卡路里" />
      </view>

      <view class="submit-btn">
        <button class="submit" @click="submitPlan">提交计划</button>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      height: '',
      weight: '',
      age: '',
      gender: 0,
      genderOptions: ['男', '女'],
      calories: ''
    };
  },
  methods: {
    submitPlan() {
      if (!this.height || !this.weight || !this.age || !this.calories) {
        uni.showToast({
          title: '请填写完整信息',
          icon: 'none'
        });
        return;
      }
      uni.showToast({
        title: '计划提交成功',
        icon: 'success'
      });
      console.log({
        height: this.height,
        weight: this.weight,
        age: this.age,
        gender: this.genderOptions[this.gender],
        calories: this.calories
      });
    }
  }
};
</script>

<style scoped>
/* 页面容器 */
.container {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

/* 表单布局 */
.form {
  display: flex;
  flex-direction: column;
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

/* 输入项 */
.input-item {
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
}

.label {
  font-size: 16px;
  color: #333;
  margin-bottom: 5px;
}

.input {
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
  background-color: #f9f9f9;
  height: 100rpx;
}

.picker {
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #f9f9f9;
  text-align: center;
  font-size: 14px;
}

/* 提交按钮 */
.submit-btn {
  margin-top: 20px;
}

.submit {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  text-align: center;
  cursor: pointer;
}

.submit:hover {
  background-color: #0056b3;
}

/* 输入框聚焦效果 */
.input:focus, .picker:focus {
  border-color: #007bff;
  outline: none;
}

/* 按钮点击反馈 */
button:active {
  opacity: 0.8;
}
</style>
