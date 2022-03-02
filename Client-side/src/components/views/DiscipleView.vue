<template>
  <section>
    <br>
    <edit-disciple  v-if="update_disc" :data="discInfo" @update="EditDisc" @cancel="cancel" ></edit-disciple>
    <disciple-form  @add-disciple="getAllDisciple" v-if="role != 'STUDENT'"></disciple-form>
    <disciple-card>
      <v-container>
        <v-dialog v-model="dialogDelete" max-width="490px">
          <v-card >
            <br>
            <v-card-title class="red--text">Are you sure you want to delete this Discipline?</v-card-title><br>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn id="action-btn" class="hvr-grow" color="white" style="background: #039BE5;" text @click="closeDelete">Cancel</v-btn>
              <v-btn id="action-btn" class="hvr-grow" color="white" style="background: #E53935;" text @click="deleteItemConfirm">YES</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-card-title class="title">
          <strong class="t">Disciples</strong>
          <v-spacer></v-spacer>
        </v-card-title>
        <div v-if="discipleList == 0">
          <br>
          <h2 class="grey--text">{{noData}}</h2>
        </div>
        <v-expansion-panels id="card">
          <v-expansion-panel v-for="(disciple, i) in discipleList" :key="i" hide-actions class="card-body">
            <v-expansion-panel-header class="card">
              <v-row align="center"  no-gutters>
                <div class="img-and-name">
                  <div>
                    <v-col cols="4">
                      <div class="imgp">
                        <div class="w">
                          <v-icon v-if="disciple.type === 'Warning letter'" style="font-size: 60px; margin-top: 15px; color: #FFC107;">mdi-alert</v-icon>
                          <v-icon v-if="disciple.type === 'Termination'" class="red--text" style="font-size: 60px; margin-top: 15px;">mdi-close-circle</v-icon>
                          <v-icon v-if="disciple.type === 'Oral warning'" class="blue--text" style="font-size: 60px; margin-top: 15px;">mdi-alert-octagon</v-icon>
                          <v-icon v-if="disciple.type === 'Notation'" class="black--text" style="font-size: 60px; margin-top: 15px; ">mdi-alert-circle</v-icon>
                        </div>
                        <div class="p">
                          <img :src="imageURL+disciple.student.image" />
                        </div>
                      </div>
                    </v-col>
                  </div>
                  <div class="name">
                    <v-col class="hidden-xs-only">
                      <div class="u-name">
                        <h4>{{disciple.student.first_name}} {{disciple.student.last_name}}</h4><br>
                      </div>
                      <div class="class">
                        <span><small>{{ disciple.student.class }}</small></span>
                      </div>
                    </v-col>
                  </div>
                </div>
                <div class="date-time">
                  <v-col class="text-no-wrap" cols="5" sm="3">
                    <span><small>{{getGoodDatetimeFormat(disciple.dateWn)}}</small></span> 
                  </v-col>
                </div>
                <div class="type">
                  <strong class="black--text">{{disciple.type}}</strong>
                </div>
                <v-card-actions>
                  <div class="action">
                    <v-icon medium color="#1E88E5" style="font-size: 20px" class="hvr-grow" @click="updateDis(disciple)" v-if="role != 'STUDENT'">mdi-pencil</v-icon>
                    <v-icon medium color="#EF5350" style="font-size: 20px" class="hvr-grow" @click="deleteItem(disciple.id)" v-if="role != 'STUDENT'">mdi-delete</v-icon>
                  </div>
                </v-card-actions>
              </v-row>
            </v-expansion-panel-header>
            <v-expansion-panel-content class="details">
              <v-divider></v-divider>
              <v-card-text class="detail-info">
                <div class="text-info">
                  <strong>First name:</strong> {{disciple.student.first_name}}<br>
                  <strong>Last name:</strong>  {{disciple.student.last_name}} <br>
                  <strong>Class:</strong> {{ disciple.student.class }} <br>
                  <strong>Date:</strong> {{getGoodDatetimeFormat(disciple.dateWn)}} <br> 
                </div>   
                <div class="reason">
                  <strong>Discipline type:</strong> {{disciple.type}} <br>
                    <strong>Reasons:</strong> <br> {{disciple.description}}
                </div>                 
              </v-card-text>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-container>
    </disciple-card>
  </section>  
</template>

<script>
import axios from "../../axios-request.js";
import DialogEdit from "../disciple/DialogEditDisciple.vue";
import DiscipleForm from "../disciple/DiscipleForm.vue";
import moment from "moment";
export default {
  components: {
    "edit-disciple": DialogEdit,
    "disciple-form": DiscipleForm,
  },
  data: () => ({
    imageURL: "http://127.0.0.1:8000/storage/images/",
    update_disc: false,
    dialogDelete: false,
    student: null,
    description: null,
    discipleID: null,
    dateWn: null,
    type: null,
    studentList: [],
    discipleList: [],
    discInfo: "",
    userInfo: "",
    studentID: "",
    role: "",
    userID: "",
    noData: "No data on discipline",
  }),
  methods: {
    updateDis(disciple) {
      this.discInfo = disciple;
      this.update_disc = true;
    },
    EditDisc(id, updateDiscipleItem, isFalse) {
      console.log(id);
      axios.put("/disciples/" + id, updateDiscipleItem).then((res) => {
        console.log(res.data);
        this.update_disc = isFalse;
        this.getAllDisciple();
      });
    },
    cancel(isFalse) {
      this.update_disc = isFalse;
    },
    getAllDisciple() {
      this.getUser();
      axios.get("/disciples").then((res) => {
        let store = res.data.data;
        if (this.role == "STUDENT") {
          for (let i of store) {
            if (this.studentID == i.student_id) {
              this.discipleList.push(i);
            }
          }
        } else {
          this.discipleList = res.data.data;
        }
      });
    },
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentList = res.data;
        console.log(res.data);
      });
    },
    deleteItem(id) {
      this.dialogDelete = true;
      this.discipleID = id;
    },
    closeDelete() {
      this.dialogDelete = false;
    },
    deleteItemConfirm() {
      axios.delete("/disciples/" + this.discipleID).then((res) => {
        console.log(res.data);
        this.closeDelete();
        this.getAllDisciple();
      });
    },
    getGoodDatetimeFormat(datetime) {
      return moment(String(datetime)).format("DD-MMM-Y");
    },
    getUser() {
      axios.get("/getUserByID/" + this.userID).then((res) => {
        this.userInfo = res.data;
        this.studentID = res.data.student_id;
      });
    },
  },
  mounted() {
    this.role = localStorage.getItem("UserRole");
    this.userID = localStorage.getItem("UserID");
    this.getAllDisciple();
    this.getUser();
  },
};
</script>

<style scoped>
section {
  margin-top: 10px;
}

.details {
  height: auto;
  background: #ffffff;
  width: 100%;
}

.detail-info {
  display: flex;
  float: right;
}

.text-info {
  width: 50%;
  box-sizing: border-box;
}

.reason {
  width: 50%;
  box-sizing: border-box;
}

.card-body {
  margin-left: 0%;
}

.card {
  height: 15vh;
  background: #eceff1;
  box-shadow: 0px 2px 4px 2px rgba(99, 99, 99, 0.25);
}

#card {
  width: 98%;
}

.title {
  width: 100%;
  margin-left: -1%;
}

.t {
  margin-top: 3%;
}

.search {
  margin-right: -1%;
  width: 12.8%;
}

.btn {
  margin-left: 60%;
}

.img-and-name {
  width: 30%;
  display: flex;
  margin-left: 2%;
}

.date-time {
  width: 20%;
  height: 100%;
  margin-left: 20%;
  margin-top: -0%;
  align-items: center;
}
.type {
  width: 15%;
  margin-left: -5%;
  text-align: center;
  justify-content: center;
  display: flex;
  margin-top: 0%;
}
.action {
  text-align: center;
  justify-content: center;
  display: flex;
  width: 10%;
  justify-content: flex-start;
  margin-left: 80%;
  margin-top: -0.5%;
}

.imgp {
  display: flex;
  margin: 0px;
}

.w,
.p {
  margin: 10px;
}

.w {
  margin-top: 50%;
  margin-left: -1%;
}

.p {
  margin-left: 75%;
}

img {
  width: 100px;
  height: 105px;
  margin-top: 2%;
}

.name {
  width: 300px;
  height: auto;
  margin-top: 45px;
}

.u-name {
  display: flex;
  width: 1000px;
  height: 30px;
  text-transform: uppercase;
  margin-left: 30%;
}

.class {
  width: 150px;
  height: 30px;
  margin-left: 30%;
}

.hidden-xs-only {
  margin-left: 2%;
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

#action-btn {
  margin-bottom: 20px;
}
</style>