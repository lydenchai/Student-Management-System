<template>
  <v-dialog v-model="dialog" width="400" transition="dialog-top-transition">
    <template v-slot:activator="{ on, attrs }" class="create-user-btn">
      <v-btn color="red darken-1" dark class="hvr-grow" v-bind="attrs" v-on="on" bottom fab fixed right> + </v-btn>
    </template>
    <v-card>
      <br>
      <form>
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
        <label for="cars">Start Date: </label><br>
          <input type="date" name="" v-model="start_At"><br>
        <label for="cars">End Date: </label><br>
          <input type="date" name="" v-model="end_At"><br>
        <label for="cars">Choose leave type</label>
          <select class="selected" id="cars" v-model="type">f
            <option v-for="leave of leavetype" :key="leave" :value=leave>{{leave}}</option>
          </select>
        <v-textarea label="Description" auto-grow outlined row-height="15" v-model="description"></v-textarea>
        <p>{{ errorMessage }}</p>
        <v-card-actions>
          <v-btn color="error" class="hvr-grow" @click="cancelCreate"> Cancel</v-btn>
          <v-btn color="primary" class="hvr-grow" @click="CreatePermission"> Create</v-btn>
        </v-card-actions> 
      </form>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  emits: ["add-permission"],
  data: () => ({
    studentSelected: null,
    start_At: null,
    end_At: null,
    type: null,
    description: null,
    imageURL: "http://127.0.0.1:8000/storage/images/",
    leavetype: ["Authorize", "Unauthorize"],
    studentsList: [],
    dialog: false,
    errorMessage: "",
  }),
  methods: {
    CreatePermission() {
      let newPermission = {
        student_id: this.studentSelected.id,
        start_At: this.start_At,
        end_At: this.end_At,
        type: this.type,
        description: this.description,
      };
      if (this.studentSelected != null) {
        axios
          .post("/permissions", newPermission)
          .then((res) => {
            this.dialog = false;
            this.$emit("add-permission", res.date);
          })
          .catch((error) => {
            console.log(error);
            this.errorMessage = "Oops! You must fill in all fields";
          });
      }
      this.studentSelected = null;
      this.start_At = "";
      this.end_At = "";
      this.type = "";
      this.description = "";
    },
    cancelCreate() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
      this.studentSelected = null;
      this.start_At = "";
      this.end_At = "";
      this.type = "";
      this.description = "";
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
    this.CreatePermission();
  },
};
</script>

<style scoped>
.c-p {
  text-align: center;
  align-items: center;
  justify-content: center;
}

p {
  color: red;
  text-align: center;
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
input[type="date"] {
  width: 100%;
  background: rgba(191, 190, 190, 0.809);
  border-radius: 2px;
  height: 35px;
  padding: 0 5px;
  color: rgb(49, 47, 47);
  margin-bottom: 10px;
  border: none;
}

select {
  border: none;
  outline: none;
}
</style>