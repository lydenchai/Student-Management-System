<template>
  <div class="">
    <v-dialog v-model="dialog" width="500" transition="dialog-top-transition">
      <template v-slot:activator="{ on, attrs }" class="create-user-btn">
        <v-btn color="red darken-1" dark class="hvr-grow" v-bind="attrs" v-on="on" bottom fab fixed right><v-icon class="white--text">mdi-account-plus</v-icon></v-btn>
      </template>
      <v-card>
        <br>
        <h2 class="c-u">Create User</h2>
        <form>
          <v-text-field v-model="username" prepend-icon="mdi-account" label="Username" required></v-text-field>
          <v-text-field v-model="email" prepend-icon="mdi-email" label="E-mail" required></v-text-field>
          <v-text-field v-model="setPassword" prepend-icon="mdi-lock" label="Password" type="password" required ></v-text-field>
          <v-select v-model="role" prepend-icon="mdi-lock-reset" :items="items" label="Select Role" required></v-select>
          <select v-if="role === 'STUDENT'" name="" id="" v-model="student_id">
            <option v-for="student of studentsList" :key="student.id" :value="student.id">
                {{ student.first_name }} {{ student.last_name }}
            </option>
          </select>
          <v-file-input label="Choose image" prepend-icon="mdi-paperclip" v-model="picture"></v-file-input>
          <p>{{ errorMessage }}</p>
          <v-card-actions>
            <v-btn color="error" class="hvr-grow" @click="cancel"> Cancel</v-btn>
            <v-btn color="primary" class="hvr-grow" @click="AddNewUser"> Create</v-btn>
          </v-card-actions>
        </form>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  emits: ["add-user"],
  data: () => ({
    studentsList: [],
    studentSelected: "",
    showStudents: false,
    dialog: false,
    username: "",
    email: "",
    role: "",
    select: null,
    items: ["TEACHER", "STUDENT"],
    picture: null,
    setPassword: "",
    student_id: "",
    errorMessage: "",
  }),
  methods: {
    AddNewUser() {
      let newUser = new FormData();
      newUser.append("username", this.username);
      newUser.append("email", this.email);
      newUser.append("password", this.setPassword);
      newUser.append("role", this.role);
      newUser.append("image", this.picture);
      newUser.append("student_id", this.student_id);
      axios
        .post("/register", newUser)
        .then((res) => {
          this.$emit("add-user", res.data);
          console.log(res.data);
          this.dialog = false;
        })
        .catch((error) => {
          console.log(error);
          this.errorMessage = "Oops! You must fill in all fields";
        });
      this.username = "";
      this.email = "";
      this.setPassword = "";
      this.role = "";
      this.picture = "";
      this.student_id = "";
      this.errorMessage = "";
    },
    cancel() {
      this.dialog = false;
      this.username = "";
      this.email = "";
      this.setPassword = "";
      this.select = "";
      this.picture = "";
      this.student_id = "";
      this.errorMessage = "";
    },
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentsList = res.data;
      });
    },
  },
  mounted() {
    this.getAllStudent();
  },
};
</script>

<style scoped>
.c-u {
  text-align: center;
  align-items: center;
  justify-content: center;
}
.create-user-btn {
  top: 85vh;
  float: right;
  position: fixed;
}

p {
  color: red;
  text-align: center;
}

form {
  padding: 20px;
}

select {
  margin-left: 30px;
  border: 1px solid rgb(51, 50, 50);
  padding: 2px;
  border-radius: 3px;
  width: 94%;
}

.v-select {
  border: none;
  outline: none;
}
</style>
