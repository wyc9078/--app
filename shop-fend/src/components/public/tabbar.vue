<template>
    <div class="tabbar">
        <yd-tabbar slot="tabbar" fixed>
            <yd-tabbar-item title="首页" link="/" @click.native="changeTitle('首页')">
                <yd-icon name="home" size=".4rem" slot="icon"></yd-icon>
            </yd-tabbar-item>
            <!-- <yd-tabbar-item title="分类" link="/class" @click.native="changeTitle('分类')">
                <yd-icon name="type" size=".4rem" slot="icon"></yd-icon>
            </yd-tabbar-item> -->
            <yd-tabbar-item title="购物车" link="/cart" @click.native="changeTitle('购物车')">
                <yd-icon name="shopcart-outline" size=".4rem" slot="icon"></yd-icon>
            </yd-tabbar-item>
           
            <yd-tabbar-item title="我的" link="/me" @click.native="changeTitle('我的')">
                <yd-icon name="ucenter-outline" size=".4rem" slot="icon"></yd-icon>
            </yd-tabbar-item>
        </yd-tabbar>
    </div>
</template>


<script>
export default {
  methods: {
    changeTitle(ti) {
      this.$emit("change", ti);
      //console.log(this.$root.$children[0].$data.navbarTitle =ti)
    }
  }
};
</script>

<style scoped>
</style>
