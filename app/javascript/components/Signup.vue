<template>
  <div class = "max-w-sm m-auto my-8">
    <div class = "border p-10 border-gey-light shadow-md rounded">
      <h3 class = "text-2xl mb-6 text-grey-darkest">Sign Up</h3>
      <form @submit.prevent = "signup" class="">
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

        <div class="mb-6">
          <label for="password" class="block uppercase tracking-wide text-grey-darker text-xs 
                                       font-bold mb-2">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="appearance-none block w-full 
                                                           bg-grey-lighter text-grey-darker border 
                                                           border-grey-lighter rounded py-3 px-4 
                                                           leading-tight" id="password_confirmation">
        </div>

        <button type="submit" class="font-sans font-bold px-4 rounded cursor-poiter 
                                     no-underline bg-green hover:bg-green-dark block 
                                     w-full py-4 text-white items-center justify-center">
                                     Sign Up</button>
        
        <div class="my-4 ">
          <router-link to = "/" class="no-underline">Sign In</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "signup",
  data () {
    return {
      email: '',
      password: '',
      password_confirmation: '',
      error: ''
    }
  },

  created () {
    this.checksignedUp()
  },
  updated () {
    this.checksignedUp()
  },

  methods: {
    signup() {
      this.$http.plain.post('/signup', { 
          email: this.email, password: this.password, password_confirmation: this.password_confirmation
       }).then(response => this.signupSuccesful(response))
         .catch(error => this.signupFailed(error))
    },
    signupSuccesful ( response ) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }

      localStorage.csrf = response.data.csrf
      localStorage.signedUp = true
      this.$router.replace('/records')
    },

    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.checksignedUp
    },
    checksignedUp () {
      if (localStorage.signedUp) {
        this.$router.replace('/records')
      }
    }
  }
}
</script>

