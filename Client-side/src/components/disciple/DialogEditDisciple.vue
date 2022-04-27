<template>
    <section>
        <v-dialog v-model="dialogUpdate" width="400" transition="dialog-top-transition">
        <v-card>
          <form>
            <h1>Disciple notice</h1><br>          
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
            <label for="cars">Choose discipline notice type</label>
            <select class="selected" id="cars" v-model="type">
              <option v-for="leave of leavetype" :key="leave" :value=leave>{{leave}}</option>
            </select>
            <label for="cars">Start Date: </label><br>
            <input type="date" name="" id="" v-model="date"><br>
            <v-textarea label="Description" auto-grow outlined v-model="description"></v-textarea>
            <v-card-actions>
              <v-btn color="error" class="hvr-grow" @click="cancel"> Cancel</v-btn>
              <v-btn color="primary" class="hvr-grow" @click="UpdateDisciple()"> Update</v-btn>
            </v-card-actions> 
          </form>
        </v-card>
      </v-dialog>
    </section>
</template>

<script>
import axios from "../../axios-request.js";
export default {
  props: ["data"],
  emits: ["update", "cancel"],
  data() {
    return {
      imageURL: "http://127.0.0.1:8000/storage/images/",
      studentSelected: null,
      date: null,
      type: null,
      description: null,
      leavetype: ["Notation", "Oral warning", "Warning letter", "Termination"],
      studentsList: [],
      dialogUpdate: true,
      id: null,
    };
  },
  methods: {
    UpdateDisciple() {
      let updateDiscipleItem = {
        student_id: this.studentSelected.id,
        type: this.type,
        date: this.date,
        description: this.description,
      };
      this.$emit("update", this.id, updateDiscipleItem, false);
    },
    cancel() {
      this.$emit("cancel", false);
    },
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentsList = res.data;
      });
    },
  },
  mounted() {
    this.getAllStudent();
    this.id = this.data.id;
    this.studentSelected = this.data.student.first_name;
    this.type = this.data.type;
    this.description = this.data.description;
    this.date = this.data.date;
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
</style>