<template>
  <div class="d-flex justify-content-center">
    <div class="row text-center">
      <b-card
          :title="book.name"
          :img-src= 'getUrl()'
          img-alt="Image"
          img-top
          tag="article"
          style="max-width: 300rem;"
          class="mb-2"
      >
        <h4>{{book.writer}}</h4>
        <h4>{{book.id}}</h4>
        <b-card-text>
          <p id="year">Release date: {{book.relesedate}}</p>
          <p>Genre: {{book.genre}}</p>
          <p>Description: {{book.desciption}}</p>
        </b-card-text>
        <b-button v-on:click="goToEdit()" pill>Update your donated book</b-button>
      </b-card>
    </div>
  </div>

</template>

<script>
import {mapActions, mapState, mapMutations} from "vuex";

export default {
  name: "SingleBook",


  props: {
    book: Object
  },

  computed: {
    ...mapState([
      'bookInfo',
      'loggedUserId'
    ])
  },


  methods: {
    ...mapMutations([
        "setBookInfo"
    ]),
    getUrl(){
      return `https://picsum.photos/600/300/?image=${this.book.id}`
    },
    goToEdit(record, index) {

      if (this.loggedUserId == this.book.userId){
        this.setBookInfo({
          id: this.book.id,
          name: this.book.name,
          writer: this.book.writer,
          genre: this.book.genre,
          desciption: this.book.desciption,
          relesedate: this.book.relesedate,
          publisher: this.book.publisher,
          libraryId: this.book.libraryId,
          userId: this.book.userId,
        })
        this.$router.push({ name: 'UpdateBook'});
      }
      else{
        alert("You must be logged in as a donator to edit this book")
      }
    }
  }

}

</script>

<style scoped>

</style>