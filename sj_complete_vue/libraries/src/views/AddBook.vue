<template>
  <div id="app"  v-if="this.token">
    <Header subtitle="Donate book"/>

    <b-form @submit="onSubmit">

      <b-form-group label="Book name:" label-for="bookname">
        <b-form-input id="bookname" v-model="form.name" :state="nameState" placeholder="Enter name" required></b-form-input>
      </b-form-group>

      <b-form-group label="Writer:" label-for="writer">
        <b-form-input id="writer" v-model="form.writer" :state="writerState" placeholder="Enter writer" required></b-form-input>
      </b-form-group>

      <b-form-group label="Genre:" label-for="genre">
        <b-form-input id="genre" v-model="form.genre" :state="genreState" placeholder="Enter genre" required></b-form-input>
      </b-form-group>

      <b-form-group label="Relesedate:" label-for="relesedate">
        <b-form-input id="relesedate" v-model="form.relesedate" type = "date" placeholder="Enter relesedate" required></b-form-input>
      </b-form-group>

      <b-form-group label="Desciption:" label-for="desciption">
        <b-form-input id="desciption" v-model="form.desciption" :state="desciptionState" placeholder="Enter desciption" required></b-form-input>
      </b-form-group>

      <b-form-group label="Publisher:" label-for="publisher">
        <b-form-input id="publisher" v-model="form.publisher" :state="publisherState" placeholder="Enter publisher" required></b-form-input>
      </b-form-group>

<!--      <b-form-group label="LibraryId:" label-for="libraryId">-->
<!--        <b-form-input id="libraryId" v-model="form.libraryId" type = "number" placeholder="Enter libraryId" required></b-form-input>-->
<!--      </b-form-group>-->

<!--      <b-form-group label="UserId:" label-for="userId">-->
<!--        <b-form-input id="userId" v-model="form.userId" type = "number" :state="userIdState" placeholder="Enter userId" required></b-form-input>-->
<!--      </b-form-group>-->

      <b-alert v-model="showDismissibleAlert" variant="danger" dismissible>
        Please fill in all the fields correctly!
      </b-alert>

      <br>
      <b-button type="submit" variant="primary">Submit</b-button>
    </b-form>

  </div>
  <p v-else>You must be signed in to leave a comment</p>
</template>

<script>

import Header from '@/components/Header.vue';
import {mapActions, mapState} from "vuex";


export default {
  name: 'AddBook',

  components: {
    Header
  },

  props: {
    userObj: Object
  },

  data() {
    return {
      form: {
        name: '',
        writer: '',
        genre: '',
        desciption: '',
        relesedate: '',
        publisher: '',
        libraryId: '',
        userId: '',
      },
      showDismissibleAlert: false
    }
  },

  computed: {
    ...mapState([
      'token',
      'loggedUserId'
    ]),
    nameState() {
      return (this.form.name.length >= 4 && this.form.name.length <= 15)
    },
    writerState() {
      return (this.form.writer.length >= 4 && this.form.writer.length <= 15)
    },
    genreState() {
      return (this.form.genre.length >= 4 && this.form.genre.length <= 15)
    },
    desciptionState() {
      return this.form.desciption.length >= 4
    },
    publisherState() {
      return (this.form.publisher.length >= 4 && this.form.publisher.length <= 15)
    }
    // userIdState() {
    //   return this.form.userId.length > 0
    // },
  },


  methods: {
    ...mapActions([
      'addBook',
    ]),

    onSubmit(e) {
      e.preventDefault();
      if (this.nameState && this.writerState && this.genreState && this.desciptionState && this.publisherState){
        this.form.libraryId = this.$route.params.id.toString()
        this.form.userId = this.loggedUserId.toString()
        // this.$socket.emit('addbook', { body: this.form, token: this.token });

        this.addBook(this.form);
        this.$router.back();
      }
      else
        this.showDismissibleAlert = true
    }
  }
}
</script>

<style scoped>

</style>
