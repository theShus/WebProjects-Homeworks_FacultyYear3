<template>
  <b-container class="bv-example-row">
    <b-row class = "row">
      <b-col class = "box">Librarian: {{library.librarian}}</b-col>
      <b-col class = "box">Open time: {{library.opentime}}</b-col>
      <b-col class = "box">Book number: {{library.booknumber}}</b-col>
      <b-col class = "box">Floor number: {{library.floor}}</b-col>
      <b-col class = "box">Currently working: {{library.working}}</b-col>
      <b-button v-on:click="goToLib()" >Go to library</b-button>
    </b-row>

  </b-container>

</template>

<script>
import {mapActions, mapState} from "vuex";

export default {
  name: "SingleLibrary",



  methods: {
    goToLib(){
      this.$router.push({ name: 'BookList', params: { id: this.library.id} });
    }
  },

  props: {
    library: Object
  },

  computed: {
    ...mapState([
      'faculty',
      'libraries',
    ]),
  }

}
</script>

<style scoped>
.row{
  border: 5px solid white;
}
.box{
  border: 2px solid white;
}

</style>