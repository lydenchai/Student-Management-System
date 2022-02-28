<template>
  <div class="">
    <v-dialog v-model="dialog" width="400" transition="dialog-top-transition">
      <template v-slot:activator="{ on, attrs }" class="create-user-btn">
        <v-btn color="red darken-1" dark class="hvr-grow" v-bind="attrs" v-on="on" bottom fab fixed right> + </v-btn>
      </template>
      <v-card>
        <form>
          <h1>Disciple notice</h1> <br>
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
          <label for="disciple">Choose discipline notice type</label>
            <select class="selected" id="disciple" v-model="type">
              <option v-for="leave of leavetype" :key="leave" :value=leave>{{leave}}</option>
            </select>
          <label for="">Start Date: </label><br>
          <input type="date" name="" id="" v-model="date"><br>
          <v-textarea label="Description" auto-grow outlined row-height="15" v-model="description"></v-textarea>
          <p>{{ errorMessage }}</p>
          <v-card-actions>
            <v-btn color="error" class="hvr-grow" @click="dialog = false"> Cancel</v-btn>
            <v-btn color="primary" class="hvr-grow" @click="CreateDisciple"> Create</v-btn>
          </v-card-actions> 
        </form>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
  import axios from '../../axios-request.js'
  export default {
    emits:['add-disciple'],
    data: () => ({
      studentSelected:null,
      date:null,
      type: null,
      description: null,
      leavetype: ["Notation", "Oral warning", "Warning letter", "Termination"],
      studentsList: [],
      dialog : false,
      errorMessage: "",
      imageURL: "http://127.0.0.1:8000/storage/images/",
    }),
    methods: {
      CreateDisciple(){
        let newDisciple = {
          'student_id': this.studentSelected.id,
          'dateWn': this.date,
          'type': this.type,
          'description': this.description,
        }
        if(this.studentSelected != null){
          axios.post('/disciples', newDisciple).then(res=>{
            console.log(res.data);
            this.dialog = false;
            this.$emit('add-disciple', res.data);
          }).catch((error) => {
            console.log(error);
            this.errorMessage = "Oops! You must fill in all fields";
          });
        }
        this.studentSelected = null;
        this.date = "";
        this.type = "";
        this.description = "";
      },
      getAllStudent(){
        axios.get('/students').then(res =>{
          this.studentsList = res.data;
        })
      },
    },
    mounted() {
      this.getAllStudent();
    },
  }
</script>

<style scoped>
  h1{
      margin-left: 18%;
  }
  
  .create-user-btn {
    top: 85vh;
    float: right;
    position: fixed;
  }

  form{
    padding: 15px;
  }

  .selected, input[type=date]{
    width: 100%;
    background: rgba(191, 190, 190, 0.809);
    border-radius: 2px;
    height: 35px;
    padding: 0 5px;
    color: rgb(49, 47, 47);
    margin-bottom: 10px;
    border: none;
  }

  p{
    color: red;
    text-align: center;
  }

</style>