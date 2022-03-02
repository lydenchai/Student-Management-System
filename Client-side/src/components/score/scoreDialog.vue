<template>
  <div class="">
    <v-dialog v-model="dialog" width="400" transition="dialog-top-transition">
      <v-card>
        <form>
          <h1>Students Score</h1> <br>
          <div class="s-student">
            <v-combobox label="Choose a student" v-model="studentSelected" :items="studentsList" item-text="first_name">
              <template v-slot:item="data">
                <v-list-item-avatar>
                  <img :src="imageURL + data.item.image"/>
                </v-list-item-avatar>
                <v-list-item-content>
                  <v-list-item-title v-html=" data.item.first_name + ' ' + data.item.last_name"></v-list-item-title>
                  <v-list-item-subtitle v-html="data.item.class"></v-list-item-subtitle>
                </v-list-item-content>
              </template>
            </v-combobox>
          </div>
          <div class="t-input">
            <div class="left">
              <label for="score">HTML / CSS</label>
                <input type="number" name="" id="" min="0" max="100" v-model="htmlcss">
              <label for="score">JavaScript</label>
                <input type="number" name="" id="" min="0" max="100" v-model="javascript">
              <label for="score">Python</label>
                <input type="number" name="" id="" min="0" max="100" v-model="python">
            </div>
            <div class="right">
              <label for="score">PHP</label>
                <input type="number" name="" id="" min="0" max="100" v-model="php">
              <label for="score">Laravel</label>
                <input type="number" name="" id="" min="0" max="100" v-model="laravel">
              <label for="score">Java</label>
                <input type="number" name="" id="" min="0" max="100" v-model="java">
            </div>
          </div>
          <v-card-actions>
            <v-btn color="error" class="hvr-grow" @click="cancel"> Cancel</v-btn>
            <v-btn color="primary" class="hvr-grow" @click="updateScore">Update</v-btn>
          </v-card-actions> 
        </form>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  props: ["data"],
  emits: ["edit-score", "cancel"],
  data: () => ({
    studentSelected: null,
    java: 0,
    javascript: 0,
    python: 0,
    studentsList: [],
    dialog: true,
    htmlcss: 0,
    laravel: 0,
    php: 0,
    scoreID: "",
    imageURL: "http://127.0.0.1:8000/storage/images/",
  }),
  methods: {
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentsList = res.data;
      });
    },
    updateScore() {
      let editScore = {
        student_id: this.studentSelected.id,
        java: this.java,
        javascript: this.javascript,
        python: this.python,
        htmlcss: this.htmlcss,
        laravel: this.laravel,
        php: this.php,
      };
      if (this.studentSelected != null) {
        this.$emit("edit-score", this.scoreID, editScore, false);
      }
    },
    cancel() {
      this.$emit("cancel", false);
    },
  },
  mounted() {
    this.studentSelected = this.data.student.first_name;
    this.java = this.data.java;
    this.javascript = this.data.javascript;
    this.python = this.data.python;
    this.htmlcss = this.data.htmlcss;
    this.laravel = this.data.laravel;
    this.php = this.data.php;
    this.scoreID = this.data.id;
    this.getAllStudent();
  },
};
</script>

<style scoped>
h1 {
  margin-left: 18%;
}

.create-user-btn {
  top: 85vh;
  float: right;
  position: fixed;
}

form {
  padding: 15px;
}

.selected,
input[type="number"] {
  width: 100%;
  background: rgba(191, 190, 190, 0.809);
  border-radius: 2px;
  height: 35px;
  padding: 0 5px;
  color: rgb(49, 47, 47);
  margin-bottom: 10px;
  border: none;
}

.t-input {
  display: flex;
}

.s-student {
  padding: 10px;
}

.left,
.right {
  padding: 10px;
  width: 50%;
}
</style>