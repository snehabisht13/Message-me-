# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "semantic-ui", to: "https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
