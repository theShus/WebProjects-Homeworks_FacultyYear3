<template>
  <div>
    <SingleFaculty v-if="faculty" :faculty="faculty" />
    <p></p>
    <h2>Library within the faculty</h2>
    <SingleLibrary v-if="library[0]" :library="library[0]" />
  </div>
</template>

<script>
import {mapActions, mapState} from "vuex";
import SingleFaculty from "@/components/SingleFaculty";
import LibraryList from "@/components/LibraryList";
import SingleLibrary from "@/components/SingleLibrary";
export default {
  name: "SingleFacultyView",
  components: {
    SingleLibrary,
    SingleFaculty,
    LibraryList
  },

  computed: {
    ...mapState([
      'faculty',
      'libraries',
    ]),
    library: function () {
      if (this.libraries){
        return this.libraries.filter(a => a.facultyId === this.$route.params.id);
      }
    }
  },
  methods: {
    ...mapActions([
      'fetchFacultyByID',
      'fetchLibraries',
    ]),

  },

  mounted() {
    this.fetchFacultyByID(this.$route.params.id);
    this.fetchLibraries();
  }
}
</script>

<style scoped>

</style>