<template>
    <img src="https://image.flaticon.com/icons/svg/236/236832.svg" width="500" alt="">
</template>

<script>
export default {
  name: 'Profile',
  data () {
    return {
      user,
      error: ''
    }
  },
    created () {
      if (!localStorage.signedIn) {
        this.$router.replace('/')
      } else {
        this.$http.secured.get('/api/v1/users/profile')
          .then(response =>  {this.user = response.data})
          .catch(error => this.setError(error, 'Something went wrong!'))
      }
    },
    methods: {
      setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    }

}
</script>
