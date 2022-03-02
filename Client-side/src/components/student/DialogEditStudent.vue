<template>
    <div class="">
    <v-dialog v-model="dialog" width="500px" transition="dialog-top-transition">
      <v-row justify="center" class="a">
        <v-card ref="form" class="form">
          <h2 class="u-s">Update Student</h2>
          <form>
            <v-text-field prepend-icon="mdi-account" ref="first name" v-model="first_name" label="First Name" required></v-text-field>
            <v-text-field prepend-icon="mdi-account" ref="last name" v-model="last_name" label="Last Name" required></v-text-field>
            <v-radio-group v-model="sex" row>
              <v-radio label="Female" value="Female"></v-radio>
              <v-radio label="Male" value="Male"></v-radio>
            </v-radio-group>
            <v-text-field ref="class" prepend-icon="mdi-school" v-model="getClass" label="Class" required></v-text-field>
            <v-text-field prepend-icon="mdi-phone-in-talk" ref="phone number" v-model="phone" label="Phone Number" required></v-text-field>
            <v-card-actions>
              <v-btn color="error" class="hvr-grow" @click="cancel"> Cancel </v-btn>
              <v-btn color="primary" class="hvr-grow" @click="editStudent"> Update </v-btn>
            </v-card-actions>
          </form>           
        </v-card>
      </v-row>
    </v-dialog>
  </div>
</template>

<script>
export default {
  props: ["data"],
  emits: ["update", "cancel"],
  data: () => ({
    getClass: "",
    phone: null,
    first_name: "",
    last_name: "",
    sex: "",
    id: null,
    dialog: true,
  }),
  methods: {
    cancel() {
      this.$emit("cancel", false);
    },
    editStudent() {
      let editStudent = {
        first_name: this.first_name,
        last_name: this.last_name,
        class: this.getClass,
        phone: this.phone,
        gender: this.sex,
      };
      this.$emit("update", this.id, editStudent, false);
    },
  },
  mounted() {
    this.userID = localStorage.getItem("UserID");
    this.id = this.data.id;
    this.first_name = this.data.first_name;
    this.last_name = this.data.last_name;
    this.getClass = this.data.class;
    this.phone = this.data.phone;
    this.sex = this.data.gender;
  },
};
</script>

<style scoped>
.u-s {
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
</style>