<template>
  <div class="login-page" >
    <v-container fluid fill-height class="bg">
      <v-layout align-center justify-center>
        <div class="form-container">
          <form @submit.prevent="signin" ref="form">
            <div class="logo">
              <img src="../../assets/pnc.png" alt="" />
            </div>
            <div>
              <v-text-field 
                class="input-field" outlined dense white v-model="email" :error-messages="emailErrors" 
                label="E-mail" :append-icon="'mdi-email'"  required @input="$v.email.$touch()" 
                @blur="$v.email.$touch()"><v-scpacer>mdi-email</v-scpacer>
              </v-text-field><br>
              <v-text-field 
                class="input-field" outlined dense white v-model="password" :error-messages="passwordErrors" 
                label="Password" required @input="$v.password.$touch()" @blur="$v.password.$touch()" 
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'" :rules="[rules.required, rules.min]" 
                :type="show1 ? 'text' : 'password'" name="input-10-1" hint="At least 8 characters" @click:append="show1 = !show1">
              </v-text-field>
              <small>{{ errorMessage }}</small>
              <v-card-actions>
                <v-btn color="primary" type="submit" id="login-btn">Login</v-btn>
              </v-card-actions>
            </div>
          </form>
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import axios from "../../axios-request.js";
import { validationMixin } from "vuelidate";
import { required, email } from "vuelidate/lib/validators";
export default {
  emits: ["userLogin"],
  mixins: [validationMixin],
  validations: {
    email: { required, email },
    password: { required },
  },
  data: () => ({
    email: "",
    password: "",
    islogin: true,
    errorMessage: "",
    show1: false,
    rules: {
      required: (value) => !!value || "Password is required.",
      min: (v) => v.length >= 8 || "Min 8 characters",
    },
  }),
  computed: {
    emailErrors() {
      const errors = [];
      if (!this.$v.email.$dirty) return errors;
      !this.$v.email.email && errors.push("Must be valid e-mail");
      return errors;
    },
    passwordErrors() {
      const errors = [];
      if (!this.$v.password.$dirty) return errors;
      !this.$v.password.required && errors.push("Must be valid password");
      return errors;
    },
  },
  methods: {
    submit() {
      this.$v.$touch();
    },
    signin() {
      let userSignin = {
        email: this.email,
        password: this.password,
      };
      axios
        .post("/login", userSignin)
        .then((res) => {
          localStorage.setItem("UserID", res.data.data.id);
          localStorage.setItem("UserRole", res.data.data.role);
          sessionStorage.setItem("key", res.data.data.role);
          this.$emit("userLogin", this.islogin);
          if (res.data.data.role == "STUDENT") {
            this.$router.push("/studentInfo");
          } else {
            this.$router.push("/home");
          }
          console.log(res.data);
        })
        .catch((error) => {
          console.log(error);
          this.errorMessage = "Password or Email is not match";
          this.email = "";
          this.password = "";
        });
    },
  },
};
</script>

<style scoped>
.login-page {
  height: 100vh;
  width: 100%;
  background-image: url("../../assets/river.jpg");
  background-position: center;
  background-size: cover;
  display: flex;
}

.bg {
  background: rgba(0, 0, 0, 0.131);
}

form {
  background: rgb(255, 255, 255);
  box-shadow: 0px 4px 8px 8px rgba(0, 0, 0, 0.083);
  height: 50vh;
  width: 70%;
  align-items: center;
  justify-content: center;
  margin-left: 10%;
  padding: 20px;
  border-radius: 5px;
}

.logo {
  width: 100%;
  height: 8vh;
}

img {
  width: 25%;
  align-items: center;
  margin-left: 35%;
  margin-top: -20%;
}

.input-field {
  width: 100%;
  height: 8vh;
}

#login-btn {
  width: 105%;
  margin-left: -3%;
  margin-top: 2%;
}

small {
  color: red;
  margin-top: 10px;
  margin-left: 25%;
}
</style>
