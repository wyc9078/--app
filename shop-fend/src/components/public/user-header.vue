<template>
    <div class="me-header">
        <img class="user-logo" src="https://m.mi.com/static/img/avatar.76a75b8f17.png" alt="">
        <p>{{title}}</p>
        <span v-if="yue">￥{{yue}}</span>
    </div>
</template>

<script>
export default {
  props: {
    title: String,
    yue: String
  }
};
</script>

<style scoped>
.me-header {
  width: 100%;
  height: 4.6rem;
  background: url("https://m.mi.com/static/img/bg.63c8e19851.png") center 0
    #f37d0f;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
.me-header img {
  width: 1.6rem;
}
.me-header p {
  color: #fff;
  margin-top: 0.4rem;
  font-size: 0.3rem;
  letter-spacing: 3px;
}
.me-header span {
  color: #ffd000;
  margin-top: 5px;
}
</style>