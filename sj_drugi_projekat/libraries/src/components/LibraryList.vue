<template>
 <div>
    <b-table
      id="image-table"
      hover
      fixed
      :items="libraries"
      :fields="fields"
      small
      :per-page="perPage"
      :current-page="currentPage"
      @row-clicked="rowClicked"
    >
    </b-table>
    <b-pagination
      v-model="currentPage"
      :total-rows="libraries.length"
      :per-page="perPage"
      aria-controls="image-table"
    ></b-pagination>

 </div>
</template>

<script>

  import { mapActions, mapState } from 'vuex';

  export default {
    name: "LibraryList",

    data() {
      return {
        fields: ['librarian', 'opentime', 'booknumber', 'floor', 'working', 'facultyId'],
        items: [],
        currentPage: 1,
        perPage: 10,
        test :{
          broj: 3
        }
      }
    },

    mounted() {
    },

    computed: {
      ...mapState([
        'libraries'
      ])
    },

    methods: {
      ...mapActions([
       // 'getBooksByLibId',
        'fetchBooks'
      ]),

      rowClicked(record, index) {
   //     this.getBooksByLibId(record.id);
        // this.$router.push({ name: 'BookList'});
        this.$router.push({ name: 'BookList', params: { id: record.id} });

      }
    }


  }
</script>


<style scoped>


</style>