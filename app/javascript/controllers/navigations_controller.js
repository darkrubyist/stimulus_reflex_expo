// import { Controller } from 'stimulus';
// import StimulusReflex from 'stimulus_reflex';
import ApplicationController from './application_controller'

export default class extends ApplicationController {
    static targets = ['title']
  
    connect () {
        super.connect()
        console.log('Connect')
        this.titleTarget.focus()
    }

    closeBackground(e) {
        if (e.target === this.element) {
            this.close(e);
        }
    }

    closeWithKeyboard(e) {
        if (e.keyCode === 27 && !this.element.classList.contains(this.toggleClass)) {
            this.close(e);
        }
    }
    close(e) {
        this.stimulate('MenuReflex#noop')
    }

    set_active(e) { 
        // let url = e.detail[2].responseURL.split('/')
        // let slug = url[url.length - 1]
        // this.stimulate('MenuReflex#set')
        // Turbolinks.visit('/demos/navigations')
        Turbolinks.visit(e.detail[2].responseURL)

    }

    afterReflex (element, reflex) {
        if (reflex == "MenuReflex#destroy_menu") {
            Turbolinks.visit('/demos/navigations')
        }
    }

}
  

// export default class extends Controller {
//   static targets = ['menu_input']

//   connect() {
//     console.log('Connect')
//     StimulusReflex.register(this)
//     this.menu_inputTarget.focus()
//   }

//   process(event) {
//     event.preventDefault()
//     this.stimulate('ExampleReflex#processing', event.target)
//   }

//   closeBackground(e) {
//     if (e.target === this.element) {
//       this.close(e);
//     }
//   }

//   closeWithKeyboard(e) {
//     if (e.keyCode === 27 && !this.element.classList.contains(this.toggleClass)) {
//       this.close(e);
//     }
//   }

  
//   close(e) {
//     this.stimulate('MenuReflex#noop')
//   }
// }
