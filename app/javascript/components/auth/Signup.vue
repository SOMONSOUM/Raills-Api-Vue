<template>
  <div class = "max-w-sm m-auto my-8">
    <div class = "border p-10 border-gey-light shadow-md rounded">
      <h3 class = "text-2xl mb-6 text-center text-grey-darkest">Sign Up</h3>
      <form @submit.prevent = "signup" class="my-8">
        <div class="mb-6">
          <label for="email" class="block uppercase tracking-wide text-grey-darker text-xs font-bold mb-2">E-mail Address</label>
          <input type="email" v-model="email" class="shadow appearance-none block w-full bg-grey-lighter 
                                                     text-grey-darker border border-grey-lighter 
                                                     rounded py-3 px-4 leading-tight" id="email" 
                                                     placeholder="somon.soum9@gmail.com">
        <p class="text-red text-xs italic" v-if="error">{{error}}.</p>
        </div>

        <div class="mb-6">
          <label for="password" class="block uppercase tracking-wide text-grey-darker text-xs 
                                       font-bold mb-2">Password</label>
          <input type="password" v-model="password" class="shadow appearance-none block w-full 
                                                           bg-grey-lighter text-grey-darker border 
                                                           border-grey-lighter rounded py-3 px-4 
                                                           leading-tight" id="password"
                                                           placeholder="******************">
        </div>

        <div class="mb-6">
          <label for="password" class="block uppercase tracking-wide text-grey-darker text-xs 
                                       font-bold mb-2">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="shadow appearance-none block w-full 
                                                           bg-grey-lighter text-grey-darker border 
                                                           border-grey-lighter rounded py-3 px-4 
                                                           leading-tight" id="password_confirmation"
                                                           placeholder="******************">
        </div>

        <div class="mb-6">
          <div class="md:w-1/3"></div>
          <label class="md:w-2/3 block text-grey font-bold">
            <input class="mr-2 leading-tight" type="checkbox">
            <span class="text-sm">
              Remember Me
            </span>
          </label>
        </div>

        <button type="submit" class="font-sans font-bold px-4 rounded cursor-poiter 
                                     no-underline bg-green hover:bg-green-dark block 
                                     w-full py-4 text-white items-center justify-center">
                                     Sign Up</button>
        
        <div class="my-4 ">
          <router-link to = "/" class="text-blue hover:text-blue-darker no-underline">Sign In</router-link>
        </div>
      </form>
      <p class="text-center text-grey text-xs">
        ©2019  RecordStore. All rights reserved.
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Signup',
  data () {
    return {
      email: '',
      password: '',
      password_confirmation: '',
      error: ''
    }
  },
  created () {
    this.checkedSignedIn()
  },
  updated () {
    this.checkedSignedIn()
  },
  methods: {
    signup () {
      this.$http.plain.post('/signup', { email: this.email, password: this.password, password_confirmation: this.password_confirmation })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      if (!response.data.csrf) {
        this.signupFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/records')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkedSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/records')
      }
    }
  }
}
</script>