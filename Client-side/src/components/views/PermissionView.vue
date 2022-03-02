<template>
  <section>
    <br>
    <permission-form @add-permission="getAllPermissions" v-if="role != 'STUDENT'"></permission-form>
    <edit-permission v-if="update_per" :data="perInfo" @update="EditPer" @cancel="cancel"></edit-permission>
    <v-container>
      <v-dialog v-model="dialogDelete" max-width="500px" transition="dialog-top-transition">
        <v-card >
          <br>
          <v-card-title class="red--text">Are you sure you want to delete this Permission?</v-card-title><br>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn id="action-btn" class="hvr-grow" color="white" style="background: #039BE5;" text @click="closeDelete">Cancel</v-btn>
            <v-btn id="action-btn" class="hvr-grow" color="white" style="background: #E53935;" text @click="deleteItemConfirm">YES</v-btn>
            <v-spacer></v-spacer>
          </v-card-actions>
        </v-card>
      </v-dialog>
      <v-card-title class="title">
        <strong class="t">Permissions</strong>
        <v-spacer></v-spacer>
      </v-card-title>
      <div v-if="permissionList == 0">
        <br>
        <h2 class="grey--text" >{{noData}}</h2>
      </div>
      <v-expansion-panels id="card">
        <v-expansion-panel v-for="(permission, i) in permissionList" :key="i" hide-actions class="card-body">
          <v-expansion-panel-header class="card">
            <v-row align="center"  no-gutters>
              <div class="img-and-name">
                <div>
                  <v-col cols="4">
                    <div class="imgp">
                      <img :src="imageURL+permission.student.image" />
                    </div>
                  </v-col>
                </div>
                <div class="name">
                  <v-col class="hidden-xs-only">
                    <div class="u-name">
                      <h4>{{permission.student.first_name}} {{permission.student.last_name}}</h4><br>
                    </div>
                    <div class="class">
                      <span><small>{{ permission.student.class }}</small></span>
                    </div>
                  </v-col>
                </div>
              </div>
              <div class="date-time">
                <v-col class="text-no-wrap" cols="5" sm="3">
                  <v-chip v-if="permission.new" :color="`${permission.student.first_name} lighten-4`" class="ml-0 mr-2 black--text" label small>
                    {{ permission.new }} new
                  </v-chip>
                  <span><small><v-icon>mdi-timetable</v-icon> {{getGoodDatetimeFormat(permission.startAt)}} to {{getGoodDatetimeFormat(permission.endAt)}}</small></span><br><br>
                  <div>
                    <small v-html="Math.round(((new Date(permission.endAt)).getTime() - (new Date(permission.startAt)).getTime()) / (1000 *  3600 * 24))" ></small><span>days</span>
                  </div>
                </v-col>
              </div>
              <div class="type">
                <v-col v-if="permission.type === 'Unauthorize' "> 
                  <strong class="red--text">{{permission.type}}</strong>
                </v-col>
                <v-col v-else> 
                  <strong class="green--text">{{permission.type}}</strong>
                </v-col>
              </div>
              <div class="action">
                <v-col>
                  <div class="btn">
                    <v-icon mediem color="#1E88E5" style="font-size: 20px" class="hvr-grow" @click="updatePer(permission)" v-if="role != 'STUDENT'">mdi-pencil</v-icon>
                    <v-icon mediem color="#EF5350" style="font-size: 20px" class="hvr-grow" @click="deleteItem(permission.id)" v-if="role != 'STUDENT'">mdi-delete</v-icon>
                  </div>
                </v-col>
              </div>
            </v-row>
          </v-expansion-panel-header>
          <v-expansion-panel-content class="details">
            <v-divider></v-divider>
            <v-card-text class="detail-info">
              <div class="text-info">
                <strong>Student name:</strong> {{permission.student.first_name}} {{permission.student.last_name}} <br>
                <strong>Class:</strong> {{ permission.student.class }} <br>
                <strong>Start date:</strong> {{getGoodDatetimeFormat(permission.startAt)}} <br>
                <strong>End date:</strong> {{getGoodDatetimeFormat(permission.endAt)}} <br>
              </div>
              <div class="reason">
                <strong>Permission type:</strong> {{permission.type}} <br>
                <strong>Reasons:</strong> <br> {{permission.description}}
              </div>
            </v-card-text>
          </v-expansion-panel-content>
        </v-expansion-panel>
      </v-expansion-panels>
    </v-container>
  </section>
</template>

<script>
import axios from "../../axios-request.js";
import permissionForm from "../permission/PermissionForm.vue";
import EditPermission from "../permission/DialogEditPermission.vue";
import moment from "moment";
export default {
  components: {
    "permission-form": permissionForm,
    "edit-permission": EditPermission,
  },
  data: () => ({
    update_per: false,
    dialogDelete: false,
    permissionList: [],
    studentList: [],
    permissions: [],
    perId: null,
    student: null,
    startAt: null,
    endAt: null,
    type: null,
    description: null,
    perInfo: "",
    userID: "",
    userInfo: "",
    imageURL: "http://127.0.0.1:8000/storage/images/",
    studentID: "",
    role: "",
    noData: "No data on Permission",
  }),
  methods: {
    cancel(isFalse) {
      this.update_per = isFalse;
    },
    updatePer(permission) {
      this.update_per = true;
      this.perInfo = permission;
    },
    EditPer(id, perData, isFalse) {
      axios.put("/permissions/" + id, perData).then((res) => {
        console.log(res.data);
        this.update_per = isFalse;
        this.getAllPermissions();
      });
    },
    getAllPermissions() {
      this.getUser();
      axios.get("/permissions").then((res) => {
        let store = res.data.data;
        if (this.role == "STUDENT") {
          for (let i of store) {
            if (this.studentID == i.student_id) {
              this.permissionList.push(i);
            }
          }
        } else {
          this.permissionList = res.data.data;
          this.perInfo = this.permissionList;
        }
      });
    },
    getAllStudent() {
      axios.get("/students").then((res) => {
        this.studentList = res.data;
      });
    },
    deleteItem(id) {
      this.dialogDelete = true;
      this.perId = id;
    },
    closeDelete() {
      this.dialogDelete = false;
    },
    deleteItemConfirm() {
      axios.delete("/permissions/" + this.perId).then((res) => {
        console.log(res.data);
        this.closeDelete();
        this.getAllPermissions();
      });
    },
    getGoodDatetimeFormat(datetime) {
      return moment(String(datetime)).format("DD-MM-Y");
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
    this.getAllPermissions();
    this.getUser();
  },
};
</script>

<style scoped>
body {
  background: #cfd8dc;
}

section {
  margin-top: 2.5vh;
}

.card-body {
  margin-left: 0%;
}

.details {
  height: auto;
  background: #ffffff;
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

#card {
  width: 98%;
}

.card {
  height: 15vh;
  background: #eceff1;
  box-shadow: 0px 2px 4px 2px rgba(99, 99, 99, 0.25);
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
  width: 15.5%;
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

.btn {
  margin-left: 60%;
}

.img-and-name {
  width: 30%;
  display: flex;
  margin-left: 1%;
}

.imgp {
  margin-left: -115%;
}

.date-time {
  width: 20%;
  margin-left: 120px;
  margin-top: 5px;
}
.type {
  width: 30%;
  text-align: center;
  justify-content: center;
  display: flex;
  margin-top: -0%;
  margin-left: -3%;
}
.action {
  text-align: center;
  justify-content: center;
  display: flex;
  width: 20%;
  margin-left: -14%;
  margin-top: -0.5%;
}

img {
  width: 100px;
  height: 105px;
  margin-top: 3%;
}

.name {
  width: 200px;
  height: auto;
  margin-top: 35px;
  margin-left: 12%;
}

.u-name {
  display: flex;
  width: 1000px;
  height: 30px;
  text-transform: uppercase;
}

.class {
  width: 150px;
  height: 30px;
}

.hidden-xs-only {
  margin-left: 2%;
}

#action-btn {
  margin-bottom: 20px;
}
</style>