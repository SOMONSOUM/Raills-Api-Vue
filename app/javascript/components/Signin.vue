<template>
  <div class = "max-w-sm m-auto my-8">
    <div class = "border p-10 border-gey-light shadow-md rounded">
      <h3 class = "text-2xl mb-6 text-grey-darkest">Sign In</h3>
      <form @submit.prevent = "signin" class="">
        <div class="text-red" v-if="error">
          {{error}}
        </div>
        <div class="mb-6">
          <label for="email" class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2">E-mail Address</label>
          <input type="email" v-model="email" class="appearance-none block w-full bg-grey-lighter 
                                                     text-grey-darker border border-grey-lighter 
                                                     rounded py-3 px-4 leading-tight" id="email" 
                                                     placeholder="somon.soum9@gmail.com">
        </div>

        <div class="mb-6">
          <label for="password" class="block uppercase tracking-wide text-grey-darker text-xs 
                                       font-bold mb-2">Password</label>
          <input type="password" v-model="password" class="appearance-none block w-full 
                                                           bg-grey-lighter text-grey-darker border 
                                                           border-grey-lighter rounded py-3 px-4 
                                                           leading-tight" id="password">
        </div>

        <button type="submit" class="font-sans font-bold px-4 rounded cursor-poiter 
                                     no-underline bg-green hover:bg-green-dark block 
                                     w-full py-4 text-white items-center justify-center">
                                     Sign In</button>
        
        <div class="my-4 ">
          <router-link to = "/signup" class="no-underline">Sign Up</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Signin",
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },

  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },

  methods: {
    signin() {
      this.$http.plain.post('/signin', { 
          email: this.email, password: this.password
       }).then(response => this.signinSuccesful(response))
         .catch(error => this.signinFailed(error))
    },
    signinSuccesful ( response ) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.$router.replace('/records')
    },

    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.checkSignedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/records')
      }
    }
  }
}
</script>

