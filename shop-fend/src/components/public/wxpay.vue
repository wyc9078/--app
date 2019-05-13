<template>
    <div class="weixinPay" v-if="wxxxpay">
        <p hidden :name="NowMoney = MoneyTotals"></p>
        <div class="pay-windows">
            <div class="windows-title flex-layout">
                <img src="../../../static/img/xx_03.jpg"  @click="changFatherStatus">
                <img src="../../../static/img/jftc_03.jpg" alt="">
                <span>请输入支付密码</span>
            </div>
            <div class="windows-money flex-layout">
                <span>心机购官方直营店</span>
                <p>￥ {{MoneyTotals}}</p>
            </div>
            <div class="windows-card">
                <img src="../../../static/img/ye.png" alt="">
                <p>余额</p>
                <img src="../../../static/img/jftc_09.jpg" alt="">
            </div>
            <div class="input">
                <ul>
                    <li v-for="(pwds,index) in passwordList" 
                        :key="index"
                        :class="pwds.hasClass ? 'pwd' : '' "
                         @click="hidden = true"></li>
                </ul>
            </div>
        </div>
        <div class="numb_box" v-if="hidden">
            <div class="xiaq_tb" @click="hidden = false">
                <img src="../../../static/img/jftc_14.jpg" alt="">
            </div>
            <ul class="nub_ggg">
                <li v-for="(item,index) in keyNumber" 
                    :key="index"
                    :class="item.haveClass == 0 ? '' : item.haveClass == 1 ? 'zj_x' : 'no' "
                    @click="item.haveClass == 2 ? '': item.haveClass == 3 ? deletePay() : submitPay() ">
                    {{item.num == 'space' ? '' : item.num == 'delete' ? '' : item.num }}
                    <img v-if="index == 11" :src="item.imgUrl" alt="">
                </li>
            </ul>
        </div>
        <div class="zhez">
        </div>

       
    </div>
</template>

<script>
export default {
  props: {
    wxxxpay: false,
    MoneyTotals: Number
  },
  data() {
    return {
      keyNumber: [
        {
          num: 1,
          haveClass: 0
        },
        {
          num: 2,
          haveClass: 1
        },
        {
          num: 3,
          haveClass: 0
        },
        {
          num: 4,
          haveClass: 0
        },
        {
          num: 5,
          haveClass: 1
        },
        {
          num: 6,
          haveClass: 0
        },
        {
          num: 7,
          haveClass: 0
        },
        {
          num: 8,
          haveClass: 1
        },
        {
          num: 9,
          haveClass: 0
        },
        {
          num: "space",
          haveClass: 2
        },
        {
          num: 0,
          haveClass: 1
        },
        {
          num: "delete",
          haveClass: 3,
          imgUrl: "../../../static/img/jftc_18.jpg"
        }
      ],
      passwordList: [
        {
          setClass: "pwd",
          hasClass: false
        },
        {
          setClass: "pwd",
          hasClass: false
        },
        {
          setClass: "pwd",
          hasClass: false
        },
        {
          setClass: "pwd",
          hasClass: false
        },
        {
          setClass: "pwd",
          hasClass: false
        },
        {
          setClass: "pwd",
          hasClass: false
        }
      ],
      i: 0,
      hidden: true
    };
  },
  methods: {
    changFatherStatus() {
      this.$emit("change", false);
    },
    submitPay() {
      this.i++;
      if (this.i < 6) {
        this.passwordList[this.i - 1].hasClass = true;
      } else {
        this.passwordList[this.i - 1].hasClass = true;
        setTimeout(() => {
          this.$router.push({ name: "result" });
        }, 500);
      }
    },
    deletePay() {
      if (this.i > 0) {
        this.i--;
        this.passwordList[this.i].hasClass = false;
        this.i == 0;
      }
    }
  }
};
</script>

<style scoped>
@import url("../../assets/css/wxpay.css");
</style>