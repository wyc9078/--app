<template>
    <div class="cart">
      <div v-if="cartList.length == 0" class="noCart">
          <img src="../../../static/img/nocart.png" alt="没有数据">
          <p>再忙 <br> 也要买点东西犒劳自己</p>
      </div>
      <div class="cart-listshop" v-else>
        <yd-checklist v-model="checklist4" :label="false">
            <yd-checklist-item  v-for="(item,index) in cartList" :key="index" :val="item.cid">
                <yd-flexbox style="padding: 15px 0;">
                    <img :src="item.commodity_thumbnail" class="demo-checklist-img">
                    <yd-flexbox-item align="top">
                        {{item.commodity_name}}<br/>
                        {{item.commodity_content | SpliceString}}<br/>
                        <div class="total">
                           <div class="reduce" @click="reduce(index)">-</div>
                           <div class="numbers">{{item.cart_nums}}</div>
                           <div class="plus" @click="plus(index)">+</div>
                        </div>
                        <br><br><br>
                       <div class="action">
                            <p class="price">单价: {{item.commodity_nowprice}}</p>
                            <span> 小计: {{item.commodity_nowprice * item.cart_nums}}</span>
                            <span class="delete" @click="deleteShop(index,item.cid)">删除</span>
                       </div>
                    </yd-flexbox-item>
                </yd-flexbox>
            </yd-checklist-item>                                                         
        </yd-checklist>
        <div class="cart-play">
            <div class="play-left">
                总计：{{totalPrice}} 元
            </div>
            <div class="play-right" @click="submitOrder()">
                下单买({{cartList.length}})
            </div>
        </div>
      </div>

   
    </div>
</template>

<script>
export default {
  created() {
    this.getCartList();
  },
  data() {
    return {
      checklist4: [],
      spinner1: 0,
      cartList: []
    };
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = true;
      vm.$parent.$data.showNavBar = false;
    });
  },
  methods: {
    submitOrder() {
      this.$utils.SetLocalstorage("data", this.cartList);
      this.$router.push({ name: "order" });
    },
    // 删除商品的操作
    async deleteShop(index, cid) {
      this.cartList.splice(index, 1);
      let deletes = await this.$http.post({
        url: "/cart/deleteCart",
        token: this.$utils.encrypt({
          cid: cid
        })
      });
    },
    // 减商品数量的操作
    reduce(index) {
      this.cartList[index].cart_nums <= 1
        ? ""
        : this.cartList[index].cart_nums--;
    },
    // 加商品数量操作
    plus(index) {
debugger
     this.cartList[index].cart_nums++;
    },
    /**
     * 获取购物车列表的数据
     */
    async getCartList() {
      let shoplist = await this.$http.post({
        url: "/cart/selectCart",
        token: this.$utils.encrypt({ userid: this.$utils.getUserInfo().id })
      });
      shoplist.status == 200 ? (this.cartList = shoplist.data) : [];
    }
  },
  // 计算属性，计算商品的总价
  computed: {
    totalPrice() {
      let total = 0;
      for (const key in this.cartList) {
        total +=
          this.cartList[key].cart_nums * this.cartList[key].commodity_nowprice;
      }
      return total;
    }
  },
  // 过滤器，裁剪手机的介绍文字
  filters: {
    SpliceString(val) {
      return val.substring(0, 30) + "...";
    }
  }
};
</script>

<style scoped>
@import url("../../assets/css/cart.css");
.cart {
  height: 100%;
}
.cart-listshop {
  padding: 0 0 1.95rem 0;
}
</style>
