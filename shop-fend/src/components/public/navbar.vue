<template>
    <div class="v-navbar">
       <yd-search 
         class="search" 
         :result="result" 
         fullpage 
         v-model="searchKey" 
         placeholder="搜索商品名称"
         :item-click="itemClickHandler" 
         :on-submit="submitHandler"
         :on-cancel="cancelHandler">
       </yd-search>
       <yd-icon name="ucenter-outline" @click.native="$router.push({ name: 'me'})" color="#8d8d8d" class="me-icon"></yd-icon>
    </div>
</template>


<script>
export default {
  props: ["headerTitle"],
  data() {
    return {
      searchKey: "",
      result: []
    };
  },
  methods: {
    changeTitle(ti) {
      this.$emit("change", ti);
      this.$router.go(-1);
    },
    getResult(val) {
      if (!val) return [];
      return [
        "Apple",
        "Banana",
        "Orange",
        "Durian",
        "Lemon",
        "Peach",
        "Cherry",
        "Berry",
        "Core",
        "Fig",
        "Haw",
        "Melon",
        "Plum",
        "Pear",
        "Peanut",
        "Other"
      ].filter(value => new RegExp(val, "i").test(value));
    },
    // 匹配结果点击事件
    itemClickHandler(item) {
      this.$dialog.toast({ mes: `搜索1：${item}` });
    },
    // 	提交时触发方法
    submitHandler(value) {
      this.$dialog.toast({ mes: `搜索2：${value}` });
    },
    cancelHandler() {
      this.searchKey = "";
    }
  },
  watch: {
    searchKey(val) {
      this.result = this.getResult(val);
    }
  }
};
</script>

<style scoped>
.v-navbar {
  position: fixed;
  width: 100%;
  left: 0;
  top: 0;
  z-index: 999;
  background: #efeff4;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.search {
  flex-grow: 1;
}
.me-icon {
  padding-right: 8px;
}
</style>
