<template>
    <div class="">
    <v-dialog v-model="dialog" width="500px" transition="dialog-top-transition">
      <template v-slot:activator="{ on, attrs }" class="create-user-btn">
        <v-btn color="red darken-1" dark class="hvr-grow" v-bind="attrs" v-on="on" bottom fab fixed right><v-icon class="white--text">mdi-account-plus</v-icon></v-btn>
      </template>
      <v-row justify="center" class="a">
        <v-card ref="form" class="form">
          <h2 class="c-s">Create Student</h2>
          <form>
            <v-text-field prepend-icon="mdi-account" ref="first name" v-model="first_name" label="First Name" required></v-text-field>
            <v-text-field prepend-icon="mdi-account" ref="last name" v-model="last_name" label="Last Name" required></v-text-field>
            <v-radio-group v-model="sex" row>
              <v-radio label="Female" value="Female"></v-radio>
              <v-radio label="Male" value="Male"></v-radio>
            </v-radio-group>
            <v-text-field ref="class" prepend-icon="mdi-school" v-model="getClass" label="Class" required></v-text-field>
            <v-text-field prepend-icon="mdi-phone-in-talk" ref="phone number" v-model="phone" label="Phone Number" required></v-text-field>
            <v-file-input prepend-icon="mdi-paperclip" label="Choose image" v-model="image" v-if="showfilInput"></v-file-input>
            <p>{{ errorMessage }}</p>
            <v-card-actions>
              <v-btn color="error" class="hvr-grow" @click="cancelCreate"> Cancel </v-btn>
              <v-btn color="primary" class="hvr-grow" @click="createStudent"> Create </v-btn>
            </v-card-actions>
          </form>            
        </v-card>
      </v-row>
    </v-dialog>
  </div>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  emits: ["add-student"],
  data: () => ({
    getClass: "",
    phone: null,
    first_name: "",
    last_name: "",
    sex: "",
    image: null,
    id: null,
    showfilInput: true,
    dialog: false,
    errorMessage: "",
  }),
  methods: {
    createStudent() {
      let newStudent = new FormData();
      newStudent.append("first_name", this.first_name);
      newStudent.append("last_name", this.last_name);
      newStudent.append("class", this.getClass);
      newStudent.append("phone", this.phone);
      newStudent.append("gender", this.sex);
      newStudent.append("image", this.image);
      axios
        .post("/students", newStudent)
        .then((res) => {
          console.log(res.data);
          this.$emit("add-student", res.data);
          this.cancelCreate();
        })
        .catch((error) => {
          console.log(error);
          this.errorMessage = "Oops! You must fill in all fields";
        });
      this.phone = null;
      this.first_name = "";
      this.last_name = "";
      this.sex = "";
      this.getClass = "";
      this.image = null;
      this.errorMessage = "";
    },
    cancelCreate() {
      this.dialog = false;
      this.phone = null;
      this.first_name = "";
      this.last_name = "";
      this.sex = "";
      this.getClass = "";
      this.image = null;
      this.errorMessage = "";
    },
    getActionUser() {
      axios.get("/getUserByID/" + this.userID).then((res) => {
        this.userAction = res.data;
      });
    },
  },
  mounted() {
    this.userID = localStorage.getItem("UserID");
    this.getActionUser();
  },
};
</script>

<style scoped>
.c-s {
  text-align: center;
  align-items: center;
  justify-content: center;
}
.form {
  width: 100%;
  height: 100%;
  padding: 20px;
}
.a {
  overflow-y: hidden;
  overflow-x: hidden;
  margin: 0;
  padding: 0;
}

p {
  color: red;
  text-align: center;
}
</style>