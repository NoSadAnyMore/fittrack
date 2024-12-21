<template>
  <view class="container">
    <!-- 页面标题 -->
    <view class="header">
      <text class="title">添加食谱计划</text>
    </view>

    <!-- 食谱名称 -->
    <view class="input-group">
      <text class="label">食谱名称</text>
      <input class="input" v-model="recipe.name" placeholder="请输入食谱名称" />
    </view>

    <!-- 食谱描述 -->
    <view class="input-group">
      <text class="label">食谱描述</text>
      <input class="input" v-model="recipe.description" placeholder="请输入食谱描述" />
    </view>

    <!-- 食谱图片 -->
    <view class="input-group">
      <text class="label">食谱图片链接</text>
      <input class="input" v-model="recipe.image" placeholder="请输入图片链接" />
    </view>

    <!-- 选择餐次 -->
    <view class="input-group">
      <text class="label">选择餐次</text>
      <picker mode="selector" :range="mealTimes" @change="onMealTimeChange">
        <view class="picker">
          <text>{{ selectedMealTime || '请选择餐次' }}</text>
        </view>
      </picker>
    </view>

    <!-- 提交按钮 -->
    <button class="submit-button" @click="submitRecipe">添加食谱</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      // 食谱数据
      recipe: {
        name: '',
        description: '',
        image: '',
      },
      // 餐次分类
      mealTimes: ['早餐', '午餐', '晚餐'],
      // 选择的餐次
      selectedMealTime: '',
    };
  },
  methods: {
    // 选择餐次时更新餐次
    onMealTimeChange(event) {
      const selectedIndex = event.detail.value;
      this.selectedMealTime = this.mealTimes[selectedIndex];
    },
    // 提交食谱
    submitRecipe() {
      if (!this.recipe.name || !this.recipe.description || !this.recipe.image) {
        uni.showToast({
          title: '请填写完整的食谱信息',
          icon: 'none',
        });
        return;
      }
      if (!this.selectedMealTime) {
        uni.showToast({
          title: '请选择餐次',
          icon: 'none',
        });
        return;
      }

      // 模拟保存食谱到本地或后端
      const newRecipe = {
        ...this.recipe,
        mealTime: this.selectedMealTime,
      };

      // 假设保存成功后回到计划页面
      uni.showToast({
        title: '食谱添加成功',
        icon: 'success',
      });

      // 可以通过事件或路由返回到计划页面
      setTimeout(() => {
        uni.navigateBack();
      }, 1500);
    },
  },
};
</script>

<style scoped>
.container {
  padding: 20px;
}

.header {
  text-align: center;
  margin-bottom: 20px;
}

.title {
  font-size: 24px;
  font-weight: bold;
}

.input-group {
  margin-bottom: 20px;
}

.label {
  font-size: 16px;
  margin-bottom: 5px;
}

.input {
  width: 100%;
  padding: 8px;
  height: 100rpx;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.picker {
  padding: 10px;
  background-color: #f0f0f0;
  border-radius: 5px;
}

.submit-button {
  width: 100%;
  background-color: #3b8d99;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
}
</style>
