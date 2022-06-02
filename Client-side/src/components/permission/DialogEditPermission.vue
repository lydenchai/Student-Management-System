<template>
  <v-dialog v-model="dialog" width="400" transition="dialog-top-transition">
    <v-card>
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
          <input type="date" name="" id="" v-model="start_At"><br>
        <label for="cars">End Date: </label><br>
          <input type="date" name="" id="" v-model="end_At"><br>
        <label for="cars">Choose leave type</label>
          <select class="selected" id="cars" v-model="type">f
            <option v-for="leave of leavetype" :key="leave" :value=leave>{{leave}}</option>
          </select>
        <v-textarea label="Description" auto-grow outlined row-height="15" v-model="description"></v-textarea>
        <v-card-actions>
          <v-btn color="error" class="hvr-grow" @click="cancel"> Cancel</v-btn>
          <v-btn color="primary" class="hvr-grow" @click="edit">Update</v-btn>
        </v-card-actions> 
      </form>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  props: ["data"],
  emits: ["update", "cancel"],
  data: () => ({
    imageURL: "http://127.0.0.1:8000/storage/images/",
    studentSelected: null,
    start_At: null,
    end_At: null,
    type: null,
    description: null,
    leavetype: ["Authorize", "Unauthorize"],
    studentsList: [],
    dialog: true,
    perID: null,
  }),
  methods: {
    cancel() {
      this.$emit("cancel", false);
    },
    edit() {
      let editPermission = {
        student_id: this.studentSelected.id,
        start_At: this.start_At,
        end_At: this.end_At,
        type: this.type,
        description: this.description,
      };
      if (this.studentSelected != null) {
        this.$emit("update", this.perID, editPermission, false);
      }
    },
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentsList = res.data;
      });
    },
  },
  mounted() {
    this.getAllStudent();
    this.studentSelected = this.data.student.first_name;
    this.start_At = this.data.start_At;
    this.endAt = this.data.endAt;
    this.type = this.data.type;
    this.description = this.data.description;
    this.perID = this.data.id;
  },
};
</script>

<style scoped>
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