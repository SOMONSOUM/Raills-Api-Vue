<template>
  <header class="bg-grey-lighter py-4">
    <div class="container m-auto flex flex-wrap items-center justify-end">
      <div class="flex-1 flex items-center">
        <svg class="fill-current text-indigo" viewBox="0 0 24 24" width="24" height="24"><title>record vinyl</title><path d="M23.938 10.773a11.915 11.915 0 0 0-2.333-5.944 12.118 12.118 0 0 0-1.12-1.314A11.962 11.962 0 0 0 12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12c0-.414-.021-.823-.062-1.227zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0-5a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path></svg>

        <a href="/" class="uppercase text-sm font-mono pl-4 font-semibold no-underline text-indigo-dark hover:text-indigo-darker">Record Store</a>
      </div>
      <div class="relative mr-6">
        <input type="search" class="bg-purple-white rounded border-0 p-3" placeholder="Search here...">
        <div class="absolute pin-r pin-t mt-3 mr-4 text-purple-lighter">
          <svg version="1.1" class="h-5 text-indigo" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
              viewBox="0 0 52.966 52.966" style="enable-background:new 0 0 52.966 52.966;" xml:space="preserve">
                  <path d="M51.704,51.273L36.845,35.82c3.79-3.801,6.138-9.041,6.138-14.82c0-11.58-9.42-21-21-21s-21,9.42-21,21s9.42,21,21,21
                    c5.083,0,9.748-1.817,13.384-4.832l14.895,15.491c0.196,0.205,0.458,0.307,0.721,0.307c0.25,0,0.499-0.093,0.693-0.279
                    C52.074,52.304,52.086,51.671,51.704,51.273z M21.983,40c-10.477,0-19-8.523-19-19s8.523-19,19-19s19,8.523,19,19
              S32.459,40,21.983,40z"/>
          </svg>

        </div>
      </div>
      <div>
        <router-link to="/" class="px-2 text-indigo-dark hover:text-indigo-darker no-underline" v-if="!signedIn()">Sign in</router-link>
        <router-link to="/signup" class="px-2 text-indigo-dark hover:text-indigo-darker no-underline" v-if="!signedIn()">Sign Up</router-link>
        <router-link to="/records" class="px-2 text-indigo-dark hover:text-indigo-darker no-underline" v-if="signedIn()">Records</router-link>
        <router-link to="/artists" class="px-2 text-indigo-dark hover:text-indigo-darker no-underline" v-if="signedIn()">Artists</router-link>
        <a href="#" @click.prevent="signOut" class="px-2 text-indigo-dark hover:text-indigo-darker no-underline" v-if="signedIn()">Sign out</a>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
  created () {
    this.signedIn()
  },

  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    
    signedIn () {
      return localStorage.signedIn
    },

    signOut () {
      this.$http.secured.delete('/signin')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/')
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>
