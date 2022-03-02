<template>
  <v-app>
    <navigation v-if="menubar" @sign-out="Logout"></navigation>
    <v-main>
      <router-view @userLogin="logined"></router-view>
    </v-main>
  </v-app>
</template>

<script>
import Navigation from "./components/nav/Navigation.vue";
export default {
  name: "App",
  components: {
    Navigation,
  },
  data() {
    return {
      menubar: false,
      userID: "",
    };
  },
  methods: {
    logined(user) {
      this.menubar = user;
      console.log("Logined: " + user);
    },
    Logout(logout) {
      this.menubar = logout;
      console.log(logout);
    },
  },
  mounted() {
    this.userID = localStorage.getItem("UserID");
    this.userID = localStorage.getItem("UserID");
    this.UserRole = localStorage.getItem("UserRole");
    if (this.userID != null || this.userID == "") {
      this.menubar = true;
      if (this.UserRole != "STUDENT") {
        this.$router.push("/home");
      } else {
        this.$router.push("/studentInfo");
      }
    } else {
      this.$router.push("/");
    }
  },
};
</script>

<style>
body {
  background: #cfd8dc;
}
</style>
