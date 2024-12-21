<template>
  <view class="container">
    <!-- 页面标题 -->
    <view class="header">
      <text class="title">食谱计划</text>
    </view>

    <!-- 食谱推荐 -->
    <view class="recipe-recommendation">
      <text class="section-title">推荐食谱</text>
      <view class="recipe-list">
        <view class="recipe-item" v-for="(recipe, index) in recommendedRecipes" :key="index">
          <!-- <image class="recipe-image" :src="recipe.image" mode="aspectFill"></image> -->
          <view class="recipe-info">
            <text class="recipe-name">{{ recipe.name }}</text>
            <text class="recipe-description">{{ recipe.description }}</text>
            <picker mode="selector" :range="mealTimes" @change="onMealTimeChange(index, $event)">
              <view class="picker">
                <text>{{ selectedMealTimes[index] || '选择餐次' }}</text>
              </view>
            </picker>
            <button class="add-button" @click="addRecipeToPlan(index)">添加</button>
          </view>
        </view>
      </view>
    </view>

    <!-- 我的计划 -->
    <view class="my-plan">
      <text class="section-title">我的计划</text>
      <view class="plan-category" v-for="mealTime in mealTimes" :key="mealTime">
        <text class="meal-time-title">{{ mealTime }}餐</text>
        <view class="plan-list">
          <view class="plan-item" v-for="(recipe, index) in myPlan[mealTime]" :key="index">
            <!-- <image class="plan-image" :src="recipe.image" mode="aspectFill"></image> -->
            <view class="plan-info">
              <text class="plan-name">{{ recipe.name }}</text>
              <text class="plan-description">{{ recipe.description }}</text>
            </view>
          </view>
        </view>
      </view>
    </view>

    <!-- 底部按钮 -->
    <button class="add-recipe-button" @click="goToAddRecipePage">添加食谱计划</button>
  </view>
</template>

<script>
export default {
  data() {
    return {
      // 推荐食谱数据（模拟数据）
      recommendedRecipes: [
        {
          name: '番茄炒蛋',
          image: 'https://example.com/tomato-egg.jpg',
          description: '简单美味，人人都会做。',
        },
        {
          name: '宫保鸡丁',
          image: 'https://example.com/kung-pao-chicken.jpg',
          description: '经典川菜，香辣可口。',
        },
        // 其他食谱
      ],
      // 我的计划数据，按餐次分类
      myPlan: {
        早餐: [],
        午餐: [],
        晚餐: [],
      },
      // 用于存储选定的餐次
      selectedMealTimes: [],
      // 餐次分类
      mealTimes: ['早餐', '午餐', '晚餐'],
    };
  },
  methods: {
    // 添加食谱到指定餐次
    addRecipeToPlan(recipeIndex) {
      const mealTime = this.selectedMealTimes[recipeIndex];
      if (mealTime) {
        const recipe = this.recommendedRecipes[recipeIndex];
        this.myPlan[mealTime].push(recipe);
      } else {
        uni.showToast({
          title: '请选择餐次',
          icon: 'none',
        });
      }
    },
    // 选择餐次时更新对应的索引
    onMealTimeChange(index, event) {
      const selectedIndex = event.detail.value;
      this.$set(this.selectedMealTimes, index, this.mealTimes[selectedIndex]);
    },
    // 跳转到添加食谱页面
    goToAddRecipePage() {
      uni.navigateTo({
        url: '/pages/sport/addRecipe/addRecipe'
      });
    }
  }
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

.section-title {
  font-size: 18px;
  margin-bottom: 10px;
  font-weight: bold;
}

.recipe-list, .plan-list {
  display: flex;
  flex-wrap: wrap;
}

.recipe-item, .plan-item {
  width: 48%;
  margin: 10px 1%;
  display: flex;
  background-color: #f9f9f9;
  padding: 10px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.recipe-image, .plan-image {
  width: 60px;
  height: 60px;
  margin-right: 10px;
  border-radius: 5px;
}

.recipe-info, .plan-info {
  flex: 1;
}

.recipe-name, .plan-name {
  font-size: 16px;
  font-weight: bold;
}

.recipe-description, .plan-description {
  font-size: 14px;
  color: #666;
}

.add-button {
  margin-top: 10px;
  background-color: #3b8d99;
  color: white;
  border-radius: 5px;
  padding: 8px;
  border: none;
}

.picker {
  background-color: #f0f0f0;
  padding: 5px;
  margin: 10px 0;
  border-radius: 5px;
}

.add-recipe-button {
  width: 100%;
  background-color: #3b8d99;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
}

.plan-category {
  margin-top: 20px;
}

.meal-time-title {
  font-size: 18px;
  font-weight: bold;
}

.plan-list {
  display: flex;
  flex-wrap: wrap;
}
</style>
