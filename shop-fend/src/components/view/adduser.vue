<template>
    <div class="adduser">
         <v-header :title="'注册'"></v-header>
         <yd-cell-group>
            <yd-cell-item>
                <yd-input slot="right" required type="number" ref="phone" v-model="userPhone" regex="mobile" placeholder="手机号"></yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <yd-input slot="right" required type="text" ref="nicname" min="3" max="10" v-model="userNicName" placeholder="昵称（3-10）"></yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <yd-input slot="right" required type="password" ref="surepwd" min="6" max="20" v-model="userPwd" placeholder="密码（6-20）"></yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <yd-input slot="right" required type="password" ref="surepwds" min="6" max="20" v-model="userSurePwd" placeholder="确认密码（6-20）"></yd-input>
            </yd-cell-item>
        </yd-cell-group>
        <yd-button-group>
          <yd-button size="large" type="primary" bgcolor="#f37d0f" color="#fff" shape="circle" @click.native="clickHander">注册</yd-button>
        </yd-button-group>

        <div class="reg-tips">
          <a class="index" href="#/">首页</a>
          <a class="action" href="#/login">登录</a>
        </div>
    </div>
</template>

<script>
import UserHeader from "./../public/user-header";
export default {
  data() {
    return {
      userPhone: null,
      userNicName: null,
      userPwd: null,
      userSurePwd: null
    };
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = false;
      vm.$parent.$data.showNavBar = false;
    });
  },
  methods: {
    async clickHander() {
      if (
        this.$refs.phone.valid &&
        this.$refs.nicname.valid &&
        this.$refs.surepwd.valid &&
        this.$refs.surepwds.valid
      ) {

        if (this.userPwd == this.userSurePwd) {
debugger
          let list = await this.$http.post({
            url: "/user/addUser",
            token: this.$utils.encrypt({
              phone: this.userPhone,
              nickname: this.userNicName,
              pwd: this.userSurePwd
            })
          });
          if (list.data.affectedRows == 1) {
            this.$dialog.toast({
              mes: "注册成功",
              timeout: 1500,
              icon: "success",
              callback: () => {
                this.$router.push({ name: "login" });
              }
            });
          }
        } else {
          this.$dialog.toast({
            mes: "密码不一致",
            timeout: 1500
          });
        }
      }
    }
  },
  components: {
    "v-header": UserHeader
  }
};
</script>

<style scoped>
.reg-tips {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 21px;
  color: #919191;
  letter-spacing: 2px;
  padding: 0 12px;
  font-size: 12px;
}
.action {
  float: right;
}
.index {
  float: left;
}
</style>
