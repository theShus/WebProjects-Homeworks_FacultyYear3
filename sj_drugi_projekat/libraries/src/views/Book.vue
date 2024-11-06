<template>
  <div>
       <BookList />
  </div>

</template>

<script>
  import BookList from '@/components/BookList.vue';
  import { mapActions, mapState } from 'vuex';

  export default {
    name: "Book",

    components: {
      BookList
    },

    data() {
        return {
        }
    },


    mounted() {
      this.fetchBooks();
      // console.log(this.faculties)
    },

    computed: {
      // ...mapState([
      //   'faculties'
      // ])
    },

    methods: {
      ...mapActions([
          'fetchBooks'
      ])
    }


  }
</script>


<style scoped>


</style>